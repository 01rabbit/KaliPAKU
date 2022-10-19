#!/bin/bash

source kp.conf
source $TOP10_PATH/top10menu.sh
source $MODULES_PATH/misc_module.sh
source $TOOL_PATH/toolsmenu.sh
source $TOOL_PATH/attackmenu.sh


function mainmenu(){
	clear
	figlet KaliPAKU
    num1 0 "Kali-tools-top10"
    num2 0 "Tools"
    num3 0 "Attack"
    num9 0 "Exit"
    read -n 1 -s n
    case $n in
    1)
        kalitoolstop10_menu1
        ;;
    2)
        menu_tools
        ;;
    3)
        menu_attack
        ;;
    9)
        exit 0
        ;;
    *)
        ;;
    esac
    unset NUM
}

# Rockyou Check
FILE="rockyou.txt"

if [ ! -e $FILE ];then
    cp /usr/share/wordlists/rockyou.txt.gz .
    if [ -e "rockyou.txt.gz" ];then
        gunzip rockyou.txt.gz
    fi
fi

# Banner
clear
banner
read -t 1
clear

while :;do
	printf "┌─(${PURPLE}${TITLE}${NC})${RED}${USER}@${HOSTNAME}${NC}:${BLUE}`pwd`${NC}\n"
	read -e -p "└─Command? > " str
    case $str in
    "kp"|"k"|"pakuri"|"kalipakuri"|"menu"|5963)
		mainmenu
        ;;
	"exit"|"q"|"quit")
		exit 0
        ;;
	*)
		eval $str
        ;;
    esac
done
