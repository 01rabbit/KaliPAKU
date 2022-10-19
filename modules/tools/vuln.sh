#!/bin/bash

# Text Color
BLACK='\e[1;30m'
RED='\e[1;31m'
GREEN='\e[1;32m'
YELLOW='\e[1;33m'
BLUE='\e[1;34m'
PURPLE='\e[1;35m'
LIGHTBLUE='\e[1;36m'
WHITE='\e[1;37m'
NC='\e[0m'

YMDHM=$(date +%Y%m%d-%H%M%S)
outDir="vulnCheck"
resultFile="${outDir}/vulnCheck_${YMDHM}.csv"
tmpFile="tmp-${YMDHM}.txt"

function usage_exit() {
    echo "Usage: $0 [-h] [-d DIR| -f FILE] "
    exit 1
}

function checkVuln() {
    totalLines=$(wc -l "${inFile}" | awk '{print $1}')
    thisCount=0
    while read thisLine; do
        let thisCount=thisCount+1
        checkForHost=$(echo "${thisLine}" | grep 'Nmap scan report for' | awk '{print $NF}' | tr -d '()')
        if [ "${checkForHost}" != "" ]; then thisHost="${checkForHost}"; fi
        checkForPort=$(echo "${thisLine}" | grep '/tcp')
        # checkForPort=$(echo "${thisLine}" | grep 'open')
        if [ "${checkForPort}" != "" ]; then thisPort="${checkForPort}"; fi
        checkForNSE=$(echo "${thisLine}" | grep '|[ _][A-Za-z0-9-]*:' | awk -F: '{print $1}' | tr -d '| _:')
        if [ "${checkForNSE}" != "" ]; then thisNSE="${checkForNSE}"; fi
        checkForState=$(echo "${thisLine}" | grep 'State: VULNERABLE\|State: LIKELY VULNERABLE' | awk -F: '{print $2}' | sed 's/^ //g')
        if [ "${checkForState}" != "" ]; then
            thisState="${checkForState}"
            echo "${thisHost},${thisPort},${thisNSE},${thisState}" >>temp
        fi
    done <"${inFile}"
}


if [ $# = 0 ]; then usage_exit; fi
printf "Checking for vulnerabilities.\n" 

while getopts :d:f:h OPT; do
    case ${OPT} in
    d) # Dir
        FLAG_D=1
        DIR=${OPTARG}
        for i in $(find ${DIR}/ -name "*.nmap" -type f); do cat $i >>${tmpFile}; done
        ;;
    f) # File
        FLAG_F=1
        FILE=${OPTARG}
        ;;
    h) # Help
        usage_exit
        ;;
    \?)
        echo "option error"
        usage_exit
        ;;
    esac
done

if [ ! -d $outDir ];then mkdir $outDir; fi

shift $((OPTIND - 1))
if [[ ${FLAG_D} ]]; then inFile=${tmpFile}; fi
if [[ ${FLAG_F} ]]; then inFile=${FILE}; fi
checkVuln

if [ -e temp ]; then
    sort temp | uniq >> "$resultFile"
    rm temp
fi

if [ -e ${tmpFile} ]; then rm ${tmpFile}; fi

size=$(wc -c ${resultFile} | awk '{print $1}')
if [ $size -eq 0 ]; then
    rm ${resultFile}
else
    while read line; do
        IFS=, msg=(${line})
        _thisHost=${msg[0]}
        _thisPort=${msg[1]}
        _thisNSE=${msg[2]}
        _thisState=${msg[3]}
        printf "${_thisHost} ${_thisPort} ${_thisNSE} ${RED}${_thisState}${NC}\n" 
    done <${resultFile}
fi
printf "Vulnerability checks have been completed.\n"
exit 0