#!/bin/bash

source kp.conf

function cmd_wireshark(){
    clear
	figlet Wireshark
    cmd="wireshark"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}`whoami`@`hostname`${NC}:${RED}[1]Kali-tools-top10${NC} > ${PURPLE}[5]$cmd${NC}\n"
    printf "|${RED}  ####  Caution!  ####${NC}\n"
    printf "|${RED}  Wireshark ${WHITE}is a GUI application. It can't be displayed on a remote console.\n"
    printf "|  If you want to continue with CUI, you can choose ${RED}tshark.${NC}\n"
    echo "|"
    echo "> Wireshark or tshark?"
    num1 0 "Wireshark"
    num2 0 "tshark"
    read -n 1 -s ANS
    if [ $ANS = 2 ];then
        cmd="tshark"
    fi
    echo "└─Command > $cmd"
	echo ""
	echo "> You ready?"
	num1 0 "No"
	num2 0 "Yes"
    read -n 1 -s ANS
    echo ""
    if [ $ANS = "2" ];then
        cmd="$cmd"
        eval $cmd
    fi

}


tshark [ -i <capture interface>|- ] [ -f <capture filter> ] [ -2 ] [ -r <infile> ] [ -w <outfile>|- ] [ options ] [ <filter> ]

       tshark -G [ <report type> ] [ --elastic-mapping-filter <protocols> ]
