#!/bin/bash

source kp.conf
source $MODULES_PATH/misc_module.sh

function menu_result(){
    clear
	figlet Result
    num4 0 "Result"
    num1 3 "Show Result"
    num9 3 "Back"
    read -n 1 -s NUM
	case $NUM in
    1) show_result ;;
    9) mainmenu ;;
    *) ;;
    esac

}
function show_result(){
    clear
    figlet Result
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
