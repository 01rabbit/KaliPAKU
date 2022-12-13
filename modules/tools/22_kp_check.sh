#!/bin/bash

source kp.conf
source $MODULES_PATH/misc_module.sh

function menu_check(){
    clear
    figlet Check
    num2 0 "Tools"
    num2 5 "Check"
    num1 10 "Vulns"
    num2 10 "Result"
    num9 10 "Back"
    read -n 1 -s NUM
    case $NUM in
    1)
        cmd_checkvulns
        ;;
    2)
        cmd_results
        ;;
    9)
        menu_tools
        ;;
    *)
        ;;
    esac

}

function cmd_vulncheck(){
    clear
    figlet Check Vulns
    printf "┌─(${PURPLE}$TITLE${NC})${RED}${USERNAME}@${HOSTNAME}${NC}:${GREEN}[2]Tools${NC} > ${GREEN}[2]VulnCheck${NC} > ${RED}[1]Check${NC}\n"
    printf "+${RED}Command${NC}:\n"
    printf "|  ${WHITE}vuln.sh${NC}  Auther:${WHITE}01rabbit${NC}\n"
    echo "|"
    printf "+${BLUE}Usage${NC}: vuln.sh [-h] [-d DIR| -f FILE] \n"
    echo "|"
    printf "+${BLUE}Options${NC}:\n"
    printf "|   ${YELLOW}-h${NC} : Shows usage.\n"
    printf "|   ${YELLOW}-d DIR${NC} : Examines nmap files in the specified directory.\n"
    printf "|   ${YELLOW}-f FILE${NC} : Examines the specified nmap file.\n"
    cmd="$TOOL_PATH/vuln.sh -d result"
    echo "└─Command > $cmd"
    echo ""
    echo "> You ready?"
    num1 0 "No"
    num2 0 "Yes"
    read -n 1 -s ANS
    if [ $ANS = "2" ];then
        show_number 221 "Check Vulns"
        eval $cmd
        read
    else
        :
    fi

}

function cmd_results(){
    clear
    show_number 222 "Check Results"
    BASE=`pwd`
    cd result
    printf "┌─(${PURPLE}$TITLE${NC})${RED}${USERNAME}@${HOSTNAME}${NC}:${BLUE}[4]Result${NC} > ${RED}Show Result${NC}\n"
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
