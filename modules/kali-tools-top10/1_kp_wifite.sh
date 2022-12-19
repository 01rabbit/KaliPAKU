#!/bin/bash

source kp.conf
source $MODULES_PATH/misc_module.sh

function menu_wifite(){
	clear
	figlet wifite
	num1 0 "Kali-tools-top10"
	num1 5 "wifite"
	num1 10 "Execute"
	num2 10 "Manual"
	num9 10 "Back"
    read -n 1 -s NUM
	case $NUM in
    1)
        cmd_wifite1
        ;;
	2)
		cmd_wifite2
		;;
    9)
        kalitoolstop10_menu1
        ;;
    *)
        ;;
    esac

}

function cmd_wifite1(){
	local cmd="" ANS=""
	clear
	figlet wifite
    cmd="wifite "
    printf "┌─(${PURPLE}$TITLE${NC})${RED}${USERNAME}@${HOSTNAME}${NC}:${RED}[1]Kali-tools-top10${NC} > ${RED}[1]$cmd${NC} > ${RED}Execute${NC}\n"
    echo "|"
    printf "|${RED}  ########  Caution!  ########${NC}\n"
	printf "|${RED}  Root plivileges are required.${NC}\n"
    echo "|"
    printf "+${BLUE}usage${NC}: wifite\n"
	if [ ! ${EUID:-${UID}} = 0 ];then
		echo "└─Command > Back"
		read
	else
		echo "└─Command > $cmd"
		echo ""
		echo "> You ready?"
		num1 0 "No"
		num2 0 "Yes"
		read -n 1 -s ANS
		echo ""
		if [ ! -z "$ANS" ];then
			if [ $ANS = "2" ];then
				show_number 111 "wifite Execute"
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
	fi
}

function cmd_wifite2(){
	local cmd="" ANS=""
	clear
	show_number 112 "wifite Manual"
	figlet wifite
    cmd="wifite "
    printf "┌─(${PURPLE}$TITLE${NC})${RED}${USERNAME}@${HOSTNAME}${NC}:${RED}[1]Kali-tools-top10${NC} > ${RED}[1]$cmd${NC} > ${GREEN}Manual${NC}\n"
    echo "|"
    printf "|${RED}  ########  Caution!  ########${NC}\n"
	printf "|${RED}  Root plivileges are required.${NC}\n"
    echo "|"
	if [ ! ${EUID:-${UID}} = 0 ];then
		echo "└─Command > Back"
		read
	else
		printf "+${BLUE}options${NC}:\n"
		printf "|  ${YELLOW}-h, --help${NC}              show this help message and exit"
		echo "|"
		printf "+${BLUE}SETTINGS${NC}:\n"
		printf "|  ${YELLOW}-v, --verbose${NC}           Shows more options (-h -v). Prints commands and outputs.\n"
		printf "|                           (default:quiet)\n"
		printf "|  ${YELLOW}-i [interface]${NC}          Wireless interface to use, e.g. wlan0mon (default: ask)\n"
		printf "|  ${YELLOW}-c [channel]${NC}            Wireless channel to scan e.g. 1,3-6 (default: all 2Ghz channels)\n"
		printf "|  ${YELLOW}-ab, --allbands${NC}         Include both 2.4Ghz and 5Ghz bands (default: off)\n"
		printf "|  ${YELLOW}-2, --2ghz${NC}              Include 2.4Ghz channels (default: off)\n"
		printf "|  ${YELLOW}-5, --5ghz${NC}              Include 5Ghz channels (default: off)\n"
		printf "|  ${YELLOW}-inf, --infinite${NC}        Enable infinite attack mode. Modify scanning time with -p (default:off)\n"
		printf "|  ${YELLOW}-mac, --random-mac${NC}      Randomize wireless card MAC address (default: off)\n"
		printf "|  ${YELLOW}-p [scan_time]${NC}          Pillage: Attack all targets after scan_time (seconds)\n"
		printf "+${BLUE}usage${NC}: wifite ${WHITE}[option|SETTINGS]${NC}\n"
		read -e -p "└─Command > " cmd
		tmux split-window -v -p 30
		tmux send-keys "${cmd};read;exit" C-m
		tmux select-pane -t "${TITLE}".0
		# eval $cmd
	fi
}

