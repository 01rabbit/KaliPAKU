#!/bin/bash

source kp.conf

function cmd_burpsuite(){
	clear
	figlet Burpsuite
    cmd="burpsuite"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}`whoami`@`hostname`${NC}:${RED}[1]Kali-tools-top10${NC} > ${GREEN}[2]$cmd${NC}\n"
    printf "${RED}####  Caution!  ####\n"
    printf "${WHITE}This is a GUI application. It can't be displayed on a remote console.${NC}\n"
    echo "└─Command? > $cmd"
    read -n 1 -p "You ready? y|n > " ANS
    echo ""
    if [ $ANS = "y" ] || [ $ANS = "y" ];then
        cmd="$cmd &"
        eval $cmd
    fi
}
