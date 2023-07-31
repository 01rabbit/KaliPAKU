#!/bin/bash

source kp.conf
source $MODULES_PATH/misc_module.sh

function menu_results(){
    clear
	header
    num4 0 "Reports"
    num1 3 "results"
    num1 6 "Show Result"
    num9 6 "Back"
    read -n 1 -s NUM
    case $NUM in
    1)
        cmd_results
        ;;
    9)
        menu_reports
        ;;
    *)
        ;;
    esac
}

function cmd_results(){
    clear
    show_number 411 "Check Results"
    BASE=`pwd`
    cd result
    printf "┌─(${PURPLE}$TITLE${NC})${RED}${USERNAME}@${HOSTNAME}${NC}:${BLUE}[4]Reports${WHITE} > [1]results > [1]Show Result${NC}\n"
    echo "|"
    while :;do
        PS3="└─Please Select one > "
        select FILE in * "Exit" ;do
        echo ""
        break
        done
        printf "└─You selected was : ${YELLOW}${FILE}${NC}\n"
        echo "|"
        if [ ${FILE} = "Exit" ];then
            break
        elif [ -d ${FILE} ];then
            cd ${FILE}
        elif [ -f ${FILE} ];then
            more ${FILE}
            cd $BASE
            break
        fi
    done
}
