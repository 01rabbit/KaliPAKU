#!/bin/bash

source kp.conf
source $TOP10_PATH/top10menu.sh
source $MODULES_PATH/misc_module.sh
source $TOOL_PATH/toolsmenu.sh
source $ATTACK_PATH/attackmenu.sh
source $REPORTS_PATH/reportmenu.sh
source $ASSIST_PATH/assistmenu.sh
source $AUXILIARY_PATH/auxiliarymenu.sh

function mainmenu(){
    while :; do
        clear
        figlet KaliPAKU
        num1 0 "Kali-tools-top10"
        num2 0 "Tools"
        num3 0 "Attack"
        num4 0 "Reports"
        num5 0 "Auxiliary"
        num6 0 "Assist"
        num9 0 "Exit"
        read -n 1 -s NUM
        case $NUM in
        1)
            kalitoolstop10_menu1
            ;;
        2)
            menu_tools
            ;;
        3)
            menu_attack
            ;;
        4)
            menu_reports
            ;;
        5)
            menu_auxiliary
            ;;
        6)
            menu_assist
            ;;
        9)
            break
            ;;
        *)
            ;;
        esac
    done
    clear
}

KP=$0

# Rockyou Check
FILE="rockyou.txt"

if [ ! -e $FILE ];then
    cp /usr/share/wordlists/rockyou.txt.gz .
    if [ -e "rockyou.txt.gz" ];then
        gunzip rockyou.txt.gz
    fi
fi

if [ -z ${TMUX} ];then
    # Banner
    clear
    banner
    read -t 1
    clear

    tmux new-session -d -s "${TITLE}" -n "Main"
    tmux set-option -g mouse on
    tmux bind-key -T copy-mode-vi y send-keys -X copy-pipe-and-cancel
    tmux bind-key -T copy-mode-vi Enter send-keys -X copy-pipe-and-cancel
    tmux send-keys -t "Main".0 "${KP}" C-m
    tmux send-keys -t "Main".0 "clear" C-m
    tmux -2 attach -t "${TITLE}"
else
    while :;do
        printf "┌─(${PURPLE}${TITLE}${NC})${RED}${USER}@${HOSTNAME}${NC}:${BLUE}`pwd`${NC}\n"
        read -e -p "└─Command? > " str
        echo ""
        case $str in
        "kp"|"k"|"pakuri"|"kalipakuri"|"menu"|4649)
            mainmenu
            ;;
        "cs"|"cheat"|"cheatsheet"|4936)
            more $ASSIST_PATH/cheatsheet.txt
            ;;
        "exit"|"q"|"quit"|3470)
            figlet See you!
            sleep 1
            tmux kill-session -t ${TITLE}
            tmux kill-server
            clear
            exit 0
            ;;
        *)
            eval $str
            ;;
        esac
    done
fi
exit 0
