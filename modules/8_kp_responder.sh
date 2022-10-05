#!/bin/bash

source kp.conf

function menu_responder(){
	clear
	figlet Responder
    num1 0 " Kali-tools-top10"
    num3 5 " responder"
    num1 10 " Basic_Usage"
    num2 10 " Analyze_mode"
    num3 10 " Poisoning_with_Responder"
    num4 10 " Basic_Authentication_&_WPAD"
	read -n 1 -s NUM
    case $NUM in
    1)
        cmd_responder1
        ;;
    2)
        cmd_responder2
        ;;
	3)
        cmd_responder3
		;;
    4)
        cmd_responder4
        ;;
    *)
        ;;
    esac
}

function cmd_responder1(){
    local INTERFACE="" cmd="" ANS=""
	clear
	figlet Responder
    cmd="responder"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}`whoami`@`hostname`${NC}:${RED}[1]Kali-tools-top10${NC} > ${YELLOW}[3]$cmd${NC} > ${RED}[1]Basic Usage${NC}\n"
    printf "+${BLUE}Options${NC}:\n"
    echo "|  -I eth0, --interface=eth0"
    echo "|                  Network interface to use, you can use 'ALL' as a"
    echo "|                  wildcard for all interfaces"
    read -p "> Input Network interface: " INTERFACE
    echo "|"
    echo "|  -w, --wpad      Start the WPAD rogue proxy server. Default value is False"
    echo "|  -d, --DHCP      Enable ANSwers for DHCP broadcast requests. This"
    echo "|                  option will inject a WPAD server in the DHCP response."
    echo "|"
    printf "+${BLUE}usage${NC} :Usage: responder ${WHITE}[Options]${NC}\n"
    cmd="${cmd} -I ${INTERFACE} -wd"
    echo "└─Command > $cmd"
    echo ""
    echo "> You ready?"
    num1 0 "No"
    num2 0 "Yes"
    read -n 1 -s ANS
    if [ $ANS = "2" ];then
        eval $cmd
    fi
}

function cmd_responder2(){
    local INTERFACE="" cmd="" ANS=""
	clear
	figlet Responder
    cmd="responder"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}`whoami`@`hostname`${NC}:${RED}[1]Kali-tools-top10${NC} > ${YELLOW}[3]$cmd${NC} > ${GREEN}[2]Analyze mode${NC}\n"
    printf "+${BLUE}Options${NC}:\n"
    echo "|  -I eth0, --interface=eth0"
    echo "|                  Network interface to use, you can use 'ALL' as a"
    echo "|                  wildcard for all interfaces"
    read -p "> Input Network interface: " INTERFACE
    echo "|"
    echo "|  -A, --analyze   Analyze mode. This option allows you to see NBT-NS,"
    echo "|                  BROWSER, LLMNR requests without responding."
    echo "|"
    printf "+${BLUE}usage${NC} :Usage: responder ${WHITE}[Options]${NC}\n"
    cmd="${cmd} -I ${INTERFACE} -A"
    echo "└─Command > $cmd"
    echo ""
    echo "> You ready?"
    num1 0 "No"
    num2 0 "Yes"
    read -n 1 -s ANS
    if [ $ANS = "2" ];then
        eval $cmd
    fi
}

function cmd_responder3(){
    local INTERFACE="" cmd="" ANS=""
	clear
	figlet Responder
    cmd="responder"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}`whoami`@`hostname`${NC}:${RED}[1]Kali-tools-top10${NC} > ${YELLOW}[3]$cmd${NC} > ${YELLOW}[3]Poisoning${NC}\n"
    printf "+${BLUE}Options${NC}:\n"
    echo "|  -I eth0, --interface=eth0"
    echo "|                  Network interface to use, you can use 'ALL' as a"
    echo "|                  wildcard for all interfaces"
    read -p "> Input Network interface: " INTERFACE
    echo "|"
    printf "+${BLUE}usage${NC} :Usage: responder ${WHITE}[Options]${NC}\n"
    cmd="${cmd} -I ${INTERFACE}"
    echo "└─Command > $cmd"
    echo ""
    echo "> You ready?"
    num1 0 "No"
    num2 0 "Yes"
    read -n 1 -s ANS
    if [ $ANS = "2" ];then
        eval $cmd
    fi
}

function cmd_responder4(){
    local INTERFACE="" cmd="" ANS=""
	clear
	figlet Responder
    cmd="responder"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}`whoami`@`hostname`${NC}:${RED}[1]Kali-tools-top10${NC} > ${YELLOW}[3]$cmd${NC} > ${BLUE}[4]WPAD${NC}\n"
    printf "+${BLUE}Options${NC}:\n"
    echo "|  -I eth0, --interface=eth0"
    echo "|                        Network interface to use, you can use 'ALL' as a"
    echo "|                        wildcard for all interfaces"
    read -p "Network interface: " INTERFACE
    echo "|"
    echo "|  -w, --wpad            Start the WPAD rogue proxy server. Default value is False"
    echo "|  -b, --basic           Return a Basic HTTP authentication. Default: NTLM"
    echo "|  -F, --ForceWpadAuth   Force NTLM/Basic authentication on wpad.dat file"
    echo "|                        retrieval. This may cause a login prompt. Default:"
    printf "+${BLUE}usage${NC} :Usage: responder ${WHITE}[Options]${NC}\n"
    cmd="${cmd} -I ${INTERFACE} -wbF"
    echo "└─Command > $cmd"
    echo ""
    echo "> You ready?"
    num1 0 "No"
    num2 0 "Yes"
    read -n 1 -s ANS
    if [ $ANS = "2" ];then
        eval $cmd
    fi
}
