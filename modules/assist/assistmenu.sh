#!/bin/bash

source kp.conf
source $MODULES_PATH/misc_module.sh
source $ASSIST_PATH/assist.sh


function menu_assist(){
    clear
    figlet Assist
    num6 0 "Assist"
    num1 5 "NIST SP 800-115"
    num2 5 "Cheatsheet"
    num9 5 "Main"
    read -n 1 -s NUM
	case $NUM in
	1) 
        assist_mode
        ;;
    2)
        show_number 62 "Cheatsheet"
        more $ASSIST_PATH/cheatsheet.txt
        ;;
    9) 
        mainmenu
        ;;
    *) 
        ;;
    esac
}

function assist_mode(){
    clear
    show_number 61 "Assist NIST SP 800-115"
    tmux split-window -v -p 25
    tmux send-keys "bash $ASSIST_PATH/assist.sh message;exit" C-m

    tmux select-pane -t 0
    tmux split-window -h -p 25
    tmux send-keys "bash $ASSIST_PATH/assist.sh menu;exit" C-m

    tmux select-pane -t 1
    sleep 1
    tmux send-keys "S1" C-m

    tmux select-pane -t 2
}
