#!/bin/bash

source kp.conf
source $MODULES_PATH/misc_module.sh

function cmd_burpsuite(){
    local cmd ="" ANS=""
	clear
	figlet Burpsuite
    cmd="burpsuite"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}${USERNAME}@${HOSTNAME}${NC}:${RED}[1]Kali-tools-top10${NC} > ${GREEN}[2]$cmd${NC}\n"
    echo "|"
    printf "|${RED}  ########  Caution!  ########${NC}\n"
    echo "|"
    printf "|${WHITE}  This is a GUI application. It can't be displayed on a remote console.${NC}\n"
    echo "└─Command > $cmd"
    echo ""
	echo "> You ready?"
    num1 0 "No"
    num2 0 "Yes"
    read -n 1 -s ANS
    if [ ! -z "$ANS" ];then
        if [ $ANS = "2" ];then
            eval $cmd
        else
            :
        fi
    else
        :
    fi
}
