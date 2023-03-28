#!/bin/bash

source kp.conf
source $MODULES_PATH/misc_module.sh

function menu_burpsuite(){
	clear
	figlet Burpsuite
	num1 0 "Kali-tools-top10"
	num2 3 "burpsuite"
	num1 6 "Execute"
	num9 6 "Back"
    read -n 1 -s NUM
	case $NUM in
    1)
        cmd_burpsuite
        ;;
    9)
        kalitoolstop10_menu1
        ;;
    *)
        ;;
    esac

}

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
            show_number 121 "burpsuite Execute"
            tmux split-window -v -p 30
            tmux send-keys "${cmd};read;exit" C-m
            tmux select-pane -t "${TITLE}".0
            # eval $cmd
        else
            :
        fi
    else
        :
    fi
}
