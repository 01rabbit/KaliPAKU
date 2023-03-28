#!/bin/bash

source kp.conf
source $MODULES_PATH/misc_module.sh

function menu_undercover(){
    clear
	figlet Undercover
	num5 0 "Auxiliary"
	num1 3 "kali-undercover"
	num1 6 "Execute"
	num9 6 "Back"
    read -n 1 -s NUM
	case $NUM in
    1)
        cmd_undercover
        ;;
    9)
        menu_auxiliary
        ;;
    *)
        ;;
    esac
}

function cmd_undercover(){
    clear
	figlet Undercover
    cmd="kali-undercover "
    printf "┌─(${PURPLE}$TITLE${NC})${RED}${USERNAME}@${HOSTNAME}${NC}:${PURPLE}[5]Auxiliary${NC} > ${RED}[1]$cmd${NC} > ${RED}[1]Execute${NC}\n"
    echo "|"
    printf "|${RED}  ########  Caution!  ########${NC}\n"
    echo "|  This is a tool to hide the appearance."
    echo "|  You can change the Kali Linux screen to look like Windows and work stealthily."
    echo "|  If you run this tool again after changing the look and feel, it will revert back to the original Kali Linux."
    echo "|"
    printf "+${BLUE}usage${NC}: kali-undercover\n"
    echo "└─Command > $cmd"
    echo ""
    echo "> You ready?"
    num1 0 "No"
    num2 0 "Yes"
    read -n 1 -s ANS
    echo ""
    if [ ! -z "$ANS" ];then
        if [ $ANS = "2" ];then
            show_number 511 "Kali Undercover Execute"
            eval $cmd
        else
            :
        fi
    else
        :
    fi
}