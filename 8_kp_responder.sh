#!/bin/bash

source kp.conf

function menu_responder(){
	clear
	figlet Responder
    printf "${WHITE}+---+\n"
    printf "| 1 |%s\n" " Kali-tools-top10"
    printf "+---+\n"
    printf "${BLUE}%5s+---+\n"
    printf "%5s| 3 |%s\n" "" " responder"
    printf "%5s+---+\n"
    printf "${WHITE}%10s+---+\n"
    printf "%10s| 1 |%s\n" "" " Basic Usage"
    printf "%10s+---+%s\n"
    printf "%10s+---+\n"
    printf "%10s| 2 |%s\n" "" " Analyze mode" 
    printf "%10s+---+%s\n" 
    printf "%10s+---+\n"
    printf "%10s| 3 |%s\n" "" " Poisoning with Responder" 
    printf "%10s+---+%s\n" 
    printf "%10s+---+\n"
    printf "%10s| 4 |%s\n" "" " Basic Authentication & WPAD" 
    printf "%10s+---+%s${NC}\n" 
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
	clear
	figlet Responder
    printf "${BLUE}usage${NC} :Usage: responder ${WHITE}[Options]${NC}\n"
    printf "${BLUE}Options${NC}:\n"
    echo "  -I eth0, --interface=eth0"
    echo "                  Network interface to use, you can use 'ALL' as a"
    echo "                  wildcard for all interfaces"
    echo "  -w, --wpad      Start the WPAD rogue proxy server. Default value is False"
    echo "  -d, --DHCP      Enable ANSwers for DHCP broadcast requests. This"
    echo "                  option will inject a WPAD server in the DHCP response."
    read -p "Network interface: " INTERFACE
    cmd="responder"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}`whoami`@`hostname`${NC}:${BLUE}[1]Kali-tools-top10${NC} > ${BLUE}[3]$cmd${NC} > ${BLUE}[1]Basic Usage${NC}\n"
    cmd="${cmd} -I ${INTERFACE} -wd"
    echo "└─Command? > $cmd"
    read -n 1 -p "You ready? y|n > " ANS
    echo ""
    if [ $ANS = "y" ] || [ $ANS = "y" ];then
        eval $cmd
    fi
}

function cmd_responder2(){
	clear
	figlet Responder
    printf "${BLUE}usage${NC} :Usage: responder ${WHITE}[Options]${NC}\n"
    printf "${BLUE}Options${NC}:\n"
    echo "  -I eth0, --interface=eth0"
    echo "                  Network interface to use, you can use 'ALL' as a"
    echo "                  wildcard for all interfaces"
    echo "  -A, --analyze   Analyze mode. This option allows you to see NBT-NS,"
    echo "                  BROWSER, LLMNR requests without responding."
    read -p "Network interface: " INTERFACE
    cmd="responder"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}`whoami`@`hostname`${NC}:${BLUE}[1]Kali-tools-top10${NC} > ${BLUE}[3]$cmd${NC} > ${BLUE}[2]Analyze mode${NC}\n"
    cmd="${cmd} -I ${INTERFACE} -A"
    echo "└─Command? > $cmd"
    read -n 1 -p "You ready? y|n > " ANS
    echo ""
    if [ $ANS = "y" ] || [ $ANS = "y" ];then
        eval $cmd
    fi
}

function cmd_responder3(){
	clear
	figlet Responder
    printf "${BLUE}usage${NC} :Usage: responder ${WHITE}[Options]${NC}\n"
    printf "${BLUE}Options${NC}:\n"
    echo "  -I eth0, --interface=eth0"
    echo "                  Network interface to use, you can use 'ALL' as a"
    echo "                  wildcard for all interfaces"
    read -p "Network interface: " INTERFACE
    cmd="responder"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}`whoami`@`hostname`${NC}:${BLUE}[1]Kali-tools-top10${NC} > ${BLUE}[3]$cmd${NC} > ${BLUE}[3]Poisoning${NC}\n"
    cmd="${cmd} -I ${INTERFACE}"
    echo "└─Command? > $cmd"
    read -n 1 -p "You ready? y|n > " ANS
    echo ""
    if [ $ANS = "y" ] || [ $ANS = "y" ];then
        eval $cmd
    fi
}

function cmd_responder4(){
	clear
	figlet Responder
    printf "${BLUE}usage${NC} :Usage: responder ${WHITE}[Options]${NC}\n"
    printf "${BLUE}Options${NC}:\n"
    echo "  -I eth0, --interface=eth0"
    echo "                        Network interface to use, you can use 'ALL' as a"
    echo "                        wildcard for all interfaces"
    echo "  -w, --wpad            Start the WPAD rogue proxy server. Default value is False"
    echo "  -b, --basic           Return a Basic HTTP authentication. Default: NTLM"
    echo "  -F, --ForceWpadAuth   Force NTLM/Basic authentication on wpad.dat file"
    echo "                        retrieval. This may cause a login prompt. Default:"
    cmd="responder"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}`whoami`@`hostname`${NC}:${BLUE}[1]Kali-tools-top10${NC} > ${BLUE}[3]$cmd${NC} > ${BLUE}[4]WPAD${NC}\n"
    read -p "Network interface: " INTERFACE
    cmd="${cmd} -I ${INTERFACE} -wbF"
    echo "└─Command? > $cmd"
    read -n 1 -p "You ready? y|n > " ANS
    echo ""
    if [ $ANS = "y" ] || [ $ANS = "y" ];then
        eval $cmd
    fi
}
