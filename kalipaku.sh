#!/bin/bash

source kp.conf
source $TOP10_PATH/top10menu.sh
source $MODULES_PATH/misc_module.sh
source $TOOL_PATH/toolsmenu.sh
source $TOOL_PATH/attackmenu.sh
source $TOOL_PATH/reportmenu.sh

function mainmenu(){
    while :; do
        clear
        figlet KaliPAKU
        num1 0 "Kali-tools-top10"
        num2 0 "Tools"
        num3 0 "Attack"
        num4 0 "Reports"
        num5 0 "Assist"
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
            assist_mode
            ;;
        9)
            break
            ;;
        *)
            ;;
        esac
        unset NUM
    done
    clear
}

function assist_mode(){
    clear
    show_number 5 "Assist NIST SP 800-115"
    tmux split-window -v -p 25
    tmux send-keys "./assist.sh message;exit" C-m

    tmux select-pane -t 0
    tmux split-window -h -p 25
    tmux send-keys "./assist.sh menu;exit" C-m

    tmux select-pane -t 1
    sleep 1
    tmux send-keys "S1" C-m

    tmux select-pane -t 2
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
            more cheatsheet.txt
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
