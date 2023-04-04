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
	num4 6 "Deauthentication"
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
		cmd_deauthentication
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
	num1 9 "Stop"
	num2 9 "Start"
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
    printf "┌─(${PURPLE}$TITLE${NC})${RED}${USERNAME}@${HOSTNAME}${NC}:${RED}[1]Kali-tools-top10${NC} > ${RED}[1]Aircrack-ng${NC} > ${RED}[1]Monitor Mode${NC} > ${RED}[1]Stop${NC}\n"
    echo "|"
    echo "> Select Interface:"
    iwconfig | grep -oE '^[a-zA-Z0-9]+'
    read -p "> Enter Interface:" INTERFACE
    printf "+${BLUE}usage${NC}: sudo airmon-ng <start|stop|check> <interface>\n"
    cmd="sudo $cmd stop $INTERFACE"
    echo "└─Command > $cmd"
    echo ""
    echo "> You ready?"
    num1 0 "No"
    num2 0 "Yes"
    read -n 1 -s ANS
    echo ""
    if [ ! -z "$ANS" ];then
        if [ $ANS = "2" ];then
            show_number 1111 "Monitor Mode Stop"
            tmux split-window -v -p 30
            tmux send-keys "${cmd}" C-m
            tmux send-keys "sudo service network-manager restart;read;exit" C-m
            tmux select-pane -t "${TITLE}".0
            # eval $cmd
        else
            :
        fi
    else
        :
    fi
}

function cmd_monitor2(){
	clear
	figlet Aircrack-ng
    cmd="airmon-ng"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}${USERNAME}@${HOSTNAME}${NC}:${RED}[1]Kali-tools-top10${NC} > ${RED}[1]Aircrack-ng${NC} > ${RED}[1]Monitor Mode${NC} > ${GREEN}[2]Start${NC}\n"
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
            show_number 1112 "Monitor Mode Start"
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

function cmd_searchbssid(){
	clear
	figlet Aircrack-ng
    cmd="airodump-ng"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}${USERNAME}@${HOSTNAME}${NC}:${RED}[1]Kali-tools-top10${NC} > ${RED}[1]Aircrack-ng${NC} > ${GREEN}[2]Search BSSID${NC}\n"
    echo "|"
    echo "> Select Interface:"
    iwconfig | grep -oE '^[a-zA-Z0-9]+'
    read -p "> Enter Interface:" INTERFACE
    printf "+${BLUE}Options${NC}:\n"
    printf "|  ${YELLOW}-w                    ${NC}:same as --write\n"
    printf "|  ${YELLOW}--write      <prefix> ${NC}: Dump file prefix\n"
    printf "|  ${YELLOW}--output-format                  <formats> ${NC}\n"
    printf "|        : Output format. Possible values: pcap, ivs, csv, gps, kismet, netxml, logcsv\n"
    echo "|"
    printf "+${BLUE}usage${NC}: sudo airodump-ng <options> <interface>\n"
    FILENAME=(result/search_BSSID_`date "+%Y%m%d-%H%M%S"`)
    cmd="sudo $cmd $INTERFACE -w $FILENAME --output-format csv"
    echo "└─Command > $cmd"
    echo ""
    echo "> You ready?"
    num1 0 "No"
    num2 0 "Yes"
    read -n 1 -s ANS
    echo ""
    if [ ! -z "$ANS" ];then
        if [ $ANS = "2" ];then
            show_number 112 "Search BSSID"
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

function cmd_packetcapture(){
	clear
	figlet Aircrack-ng
    cmd="airodump-ng"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}${USERNAME}@${HOSTNAME}${NC}:${RED}[1]Kali-tools-top10${NC} > ${RED}[1]Aircrack-ng${NC} > ${YELLOW}[3]Packet Capture${NC}\n"
    echo "|"
    echo "> Select Interface:"
    iwconfig | grep -oE '^[a-zA-Z0-9]+'
    read -p "> Enter Interface: " INTERFACE
    printf "+${BLUE}Options${NC}:\n"
    printf "|  ${YELLOW}-w                    ${NC}:same as --write\n"
    printf "|  ${YELLOW}--write      <prefix> ${NC}: Dump file prefix\n"
    printf "|  ${YELLOW}--output-format                  <formats> ${NC}\n"
    printf "|        : Output format. Possible values: pcap, ivs, csv, gps, kismet, netxml, logcsv\n"
    printf "+${BLUE}Filter options${NC}:\n"
    printf "|  ${YELLOW}--bssid     <bssid>   ${NC}: Filter APs by BSSID\n"
    printf "|  ${YELLOW}--channel <channels>  ${NC} Capture on specific channels\n"
    echo "|"
    read -p "> Enter target BSSID: " BSSID
    read -p "> Enter target Channel: " CHANNEL
    printf "+${BLUE}usage${NC}: sudo airodump-ng <options> <interface>\n"
    FILENAME=(result/search_BSSID_`date "+%Y%m%d-%H%M%S"`)
    cmd="sudo $cmd --bssid $BSSID --channel $CHANNEL -w $FILENAME $INTERFACE"
    echo "└─Command > $cmd"
    echo ""
    echo "> You ready?"
    num1 0 "No"
    num2 0 "Yes"
    read -n 1 -s ANS
    echo ""
    if [ ! -z "$ANS" ];then
        if [ $ANS = "2" ];then
            show_number 113 "Packet Capture"
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

function cmd_deauthentication(){
	clear
	figlet Aircrack-ng
    cmd="aireplay-ng"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}${USERNAME}@${HOSTNAME}${NC}:${RED}[1]Kali-tools-top10${NC} > ${RED}[1]Aircrack-ng${NC} > ${BLUE}[4]Deauthentication${NC}\n"
    echo "|"
    echo "> Select Interface:"
    iwconfig | grep -oE '^[a-zA-Z0-9]+'
    read -p "> Enter Interface: " INTERFACE
    printf "+${BLUE}Attack modes (numbers can still be used)${NC}:\n"
    printf "|  ${YELLOW}--deauth      count ${NC}: deauthenticate 1 or all stations (-0)\n"
    printf "+${BLUE}Replay options:${NC}:\n"
    printf "|  ${YELLOW}-a bssid                    ${NC}:set Access Point MAC address\n"
    echo "|"
    read -p "> Enter target BSSID: " BSSID
    printf "+${BLUE}usage${NC}: sudo aireplay-ng <options> <replay interface>\n"
    cmd="sudo $cmd -0 0 -a $BSSID $INTERFACE"
    echo "└─Command > $cmd"
    echo ""
    echo "> You ready?"
    num1 0 "No"
    num2 0 "Yes"
    read -n 1 -s ANS
    echo ""
    if [ ! -z "$ANS" ];then
        if [ $ANS = "2" ];then
            show_number 114 "Deauthentication"
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
