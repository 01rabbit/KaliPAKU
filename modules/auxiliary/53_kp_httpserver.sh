#!/bin/bash

source kp.conf
source $MODULES_PATH/misc_module.sh

function menu_httpserver(){
    clear
	header
	num5 0 "Auxiliary"
	num3 3 "Python HTTP Server"
	num1 6 "Execute"
	num9 6 "Back"
    read -n 1 -s NUM
	case $NUM in
    1)
        cmd_httpserver
        ;;
    9)
        menu_auxiliary
        ;;
    *)
        ;;
    esac
}

function cmd_httpserver(){
    clear
	figlet Python HTTP Server
    printf "┌─(${PURPLE}$TITLE${NC})${RED}${USERNAME}@${HOSTNAME}${NC}:${PURPLE}[5]Auxiliary${WHITE} > [3]Python HTTP Server > [1]Execute${NC}\n"
    printf "+${BLUE}positional arguments${NC}:\n"
    printf "|  ${YELLOW}port${NC}:                                  specify alternate port (default: 8000)\n"
    echo "|"
    printf "+${BLUE}options${NC}:\n"
    printf "|  ${YELLOW}-h, --help${NC}:                            show this help message and exit\n"
    printf "|  ${YELLOW}--cgi${NC}:                                 run as CGI server\n"
    printf "|  ${YELLOW}--bind ADDRESS, -b ADDRESS${NC}:            specify alternate bind address (default: all interfaces)\n"
    printf "|  ${YELLOW}--directory DIRECTORY, -d DIRECTORY${NC}:   specify alternate directory (default: current directory)\n"
    read -p "> Enter the port number. If nothing is entered, the default (8000) is applied.: " PORT
    if [ -n "$PORT" ];then
        cmd="python3 -m http.server $PORT"
    else
        cmd="python3 -m http.server"
    fi
    echo "|"
    printf "+${BLUE}usage${NC}: python3 -m http.server ${WHITE}[--cgi] [--bind ADDRESS] [--directory DIRECTORY] [port]${NC}\n"
    echo "└─Command > $cmd"
    echo ""
    echo "> You ready?"
    num1 0 "No"
    num2 0 "Yes"
    read -n 1 -s ANS
    echo ""
    if [ ! -z "$ANS" ];then
        if [ $ANS = "2" ];then
            show_number 531 "Python HTTP Server"
            tmux split-window -v
            tmux send-keys "${cmd};read;exit" C-m
            tmux select-pane -t "${TITLE}".0
        else
            :
        fi
    else
        :
    fi
}