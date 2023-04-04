#!/bin/bash

source kp.conf
source $MODULES_PATH/misc_module.sh

function menu_aircrack(){
	clear
	figlet Aircrack-ng
	num1 0 "Kali-tools-top10"
	num1 3 "Aircrack-ng"
	num1 6 "Monitor Mode"
	num2 6 "Search BSSid"
	num3 6 "Packet Capture"
	num4 6 "Rogue Traffic"
	num9 6 "Back"
    read -n 1 -s NUM
	case $NUM in
    1)
        menu_monitor
        ;;
	2)
		cmd_searchbssid
		;;
    3)
        cmd_packetcapture
        ;;
	4)
		menu_roguetraffic
		;;
	9)
		kalitoolstop10_menu1
		;;
    *)
        ;;
    esac
}

function menu_monitor(){
	clear
	figlet Aircrack-ng
	num1 0 "Kali-tools-top10"
	num1 3 "Aircrack-ng"
	num1 6 "Monitor Mode"
	num1 9 "Start"
	num2 9 "Stop"
	num9 9 "Back"
    read -n 1 -s NUM
	case $NUM in
    1)
        cmd_monitor1
        ;;
	2)
		cmd_monitor2
		;;
	9)
		menu_aircrack
		;;
	esac
}

function cmd_monitor1(){
	clear
	figlet Aircrack-ng
    cmd="airmon-ng"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}${USERNAME}@${HOSTNAME}${NC}:${RED}[1]Kali-tools-top10${NC} > ${RED}[1]Aircrack-ng${NC} > ${RED}[1]Monitor Mode${NC} > ${RED}[1]Start${NC}\n"
    echo "|"
    echo "> Select Interface:"
    iwconfig | grep -oE '^[a-zA-Z0-9]+'
    read -p "> Enter Interface:" INTERFACE
    printf "+${BLUE}usage${NC}: sudo airmon-ng <start|stop|check> <interface>\n"
    cmd="sudo $cmd start $INTERFACE"
    echo "└─Command > $cmd"
    echo ""
    echo "> You ready?"
    num1 0 "No"
    num2 0 "Yes"
    read -n 1 -s ANS
    echo ""
    if [ ! -z "$ANS" ];then
        if [ $ANS = "2" ];then
            sudo airmon-ng check kill
            show_number 1111 "Monitor Mode Start"
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
cmd_monitor1

