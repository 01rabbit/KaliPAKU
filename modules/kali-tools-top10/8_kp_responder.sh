#!/bin/bash

source kp.conf
source $MODULES_PATH/misc_module.sh

function menu_responder(){
	clear
	figlet Responder
    num1 0 "Kali-tools-top10"
    num3 5 "responder"
    num1 10 "Basic_Usage"
    num2 10 "Analyze_mode"
    num3 10 "Poisoning_with_Responder"
    num4 10 "Basic_Authentication_&_WPAD"
    num5 10 "Manual"
    num9 10 "Back"
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
    5)
        cmd_responder5
        ;;
    9)
        kalitoolstop10_menu1
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
    printf "┌─(${PURPLE}$TITLE${NC})${RED}${USERNAME}@${HOSTNAME}${NC}:${RED}[1]Kali-tools-top10${NC} > ${YELLOW}[3]$cmd${NC} > ${RED}[1]Basic Usage${NC}\n"
    printf "+${BLUE}Options${NC}:\n"
    printf "|  ${YELLOW}-I eth0, --interface=eth0${NC}\n"
    echo "|                  Network interface to use, you can use 'ALL' as a"
    echo "|                  wildcard for all interfaces"
    read -p "> Input Network interface: " INTERFACE
    echo "|"
    printf "|  ${YELLOW}-w, --wpad${NC}      Start the WPAD rogue proxy server. Default value is False\n"
    printf "|  ${YELLOW}-d, --DHCP${NC}      Enable ANSwers for DHCP broadcast requests. This\n"
    echo "|                  option will inject a WPAD server in the DHCP response."
    echo "|"
    printf "+${BLUE}usage${NC} : responder ${WHITE}[Options]${NC}\n"
    cmd="${cmd} -I ${INTERFACE} -wd"
    echo "└─Command > $cmd"
    echo ""
    echo "> You ready?"
    num1 0 "No"
    num2 0 "Yes"
    read -n 1 -s ANS
    if [ ! -z "$ANS" ];then
        if [ $ANS = "2" ];then
            eval $cmd
        else
            :
        fi
    else
        :
    fi
}

function cmd_responder2(){
    local INTERFACE="" cmd="" ANS=""
	clear
	figlet Responder
    cmd="responder"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}${USERNAME}@${HOSTNAME}${NC}:${RED}[1]Kali-tools-top10${NC} > ${YELLOW}[3]$cmd${NC} > ${GREEN}[2]Analyze mode${NC}\n"
    printf "+${BLUE}Options${NC}:\n"
    printf "|  ${YELLOW}-I eth0, --interface=eth0${NC}\n"
    echo "|                  Network interface to use, you can use 'ALL' as a"
    echo "|                  wildcard for all interfaces"
    read -p "> Input Network interface: " INTERFACE
    echo "|"
    printf "|  ${YELLOW}-A, --analyze${NC}   Analyze mode. This option allows you to see NBT-NS,\n"
    echo "|                  BROWSER, LLMNR requests without responding."
    echo "|"
    printf "+${BLUE}usage${NC} : responder ${WHITE}[Options]${NC}\n"
    cmd="${cmd} -I ${INTERFACE} -A"
    echo "└─Command > $cmd"
    echo ""
    echo "> You ready?"
    num1 0 "No"
    num2 0 "Yes"
    read -n 1 -s ANS
    if [ ! -z "$ANS" ];then
        if [ $ANS = "2" ];then
            eval $cmd
        else
            :
        fi
    else
        :
    fi
}

function cmd_responder3(){
    local INTERFACE="" cmd="" ANS=""
	clear
	figlet Responder
    cmd="responder"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}${USERNAME}@${HOSTNAME}${NC}:${RED}[1]Kali-tools-top10${NC} > ${YELLOW}[3]$cmd${NC} > ${YELLOW}[3]Poisoning${NC}\n"
    printf "+${BLUE}Options${NC}:\n"
    printf "|  ${YELLOW}-I eth0, --interface=eth0${NC}\n"
    echo "|                  Network interface to use, you can use 'ALL' as a"
    echo "|                  wildcard for all interfaces"
    read -p "> Input Network interface: " INTERFACE
    echo "|"
    printf "+${BLUE}usage${NC} : responder ${WHITE}[Options]${NC}\n"
    cmd="${cmd} -I ${INTERFACE}"
    echo "└─Command > $cmd"
    echo ""
    echo "> You ready?"
    num1 0 "No"
    num2 0 "Yes"
    read -n 1 -s ANS
    if [ ! -z "$ANS" ];then
        if [ $ANS = "2" ];then
            eval $cmd
        else
            :
        fi
    else
        :
    fi
}

function cmd_responder4(){
    local INTERFACE="" cmd="" ANS=""
	clear
	figlet Responder
    cmd="responder"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}${USERNAME}@${HOSTNAME}${NC}:${RED}[1]Kali-tools-top10${NC} > ${YELLOW}[3]$cmd${NC} > ${BLUE}[4]WPAD${NC}\n"
    printf "+${BLUE}Options${NC}:\n"
    printf "|  ${YELLOW}-I eth0, --interface=eth0${NC}\n"
    echo "|                        Network interface to use, you can use 'ALL' as a"
    echo "|                        wildcard for all interfaces"
    read -p "Network interface: " INTERFACE
    echo "|"
    printf "|  ${YELLOW}-w, --wpad${NC}            Start the WPAD rogue proxy server. Default value is False\n"
    printf "|  ${YELLOW}-b, --basic${NC}           Return a Basic HTTP authentication. Default: NTLM\n"
    printf "|  ${YELLOW}-F, --ForceWpadAuth${NC}   Force NTLM/Basic authentication on wpad.dat file\n"
    echo "|                        retrieval. This may cause a login prompt. Default:"
    printf "+${BLUE}usage${NC} : responder ${WHITE}[Options]${NC}\n"
    cmd="${cmd} -I ${INTERFACE} -wbF"
    echo "└─Command > $cmd"
    echo ""
    echo "> You ready?"
    num1 0 "No"
    num2 0 "Yes"
    read -n 1 -s ANS
    if [ ! -z "$ANS" ];then
        if [ $ANS = "2" ];then
            eval $cmd
        else
            :
        fi
    else
        :
    fi
}

function cmd_responder5(){
    local INTERFACE="" cmd="" ANS=""
	clear
	figlet Responder
    cmd="responder"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}${USERNAME}@${HOSTNAME}${NC}:${RED}[1]Kali-tools-top10${NC} > ${YELLOW}[3]$cmd${NC} > ${PURPLE}[5]Manual${NC}\n"
    printf "+${BLUE}Options${NC}:\n"
    printf "|  ${YELLOW}-I eth0, --interface=eth0${NC}\n"
    echo "|                  Network interface to use, you can use 'ALL' as a"
    echo "|                  wildcard for all interfaces"
    printf "|  ${YELLOW}-w, --wpad${NC}      Start the WPAD rogue proxy server. Default value is False\n"
    printf "|  ${YELLOW}-d, --DHCP${NC}      Enable ANSwers for DHCP broadcast requests. This\n"
    echo "|                  option will inject a WPAD server in the DHCP response."
    printf "|  ${YELLOW}-A, --analyze${NC}   Analyze mode. This option allows you to see NBT-NS,\n"
    echo "|                  BROWSER, LLMNR requests without responding."
    printf "|  ${YELLOW}-F, --ForceWpadAuth${NC}   Force NTLM/Basic authentication on wpad.dat file\n"
    echo "|"
    printf "+${BLUE}usage${NC} : responder ${WHITE}[Options]${NC}\n"
    read -e -p "└─Command > " cmd
    eval $cmd
}