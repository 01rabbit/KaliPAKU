#!/bin/bash

source kp.conf

function cmd_burpsuite(){
	clear
	figlet Burpsuite
    cmd="burpsuite"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}`whoami`@`hostname`${NC}:${RED}[1]Kali-tools-top10${NC} > ${GREEN}[2]$cmd${NC}\n"
    printf "${RED}####  Caution!  ####\n"
    printf "${WHITE}This is a GUI application. It can't be displayed on a remote console.${NC}\n"
    echo "└─Command > $cmd"
    echo ""
    echo "You ready?"
    read -n 1 -s ANS
    num1 0 "No"
    num2 0 "Yes"
    if [ $ANS = "2" ];then
        cmd="$cmd &"
        eval $cmd
    fi
}
