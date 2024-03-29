#!/bin/bash

source kp.conf
source $MODULES_PATH/misc_module.sh
source $ATTACK_PATH/32_kp_msfpc.sh

function menu_metasploit(){
	clear
	header
    num1 0 " Kali-tools-top10"
    num1 3 " metasploit-framework"
    num1 6 " Normal_Boot"
    num2 6 " Create_Multi_handler" " (windows/meterpreter/reverse_tcp)"
    num3 6 " Create_Payload" " (msfpc)"
    num9 6 " Back"
	read -n 1 -s NUM
    echo ""
    case $NUM in
    1)
        cmd_metasploit1
        ;;
    2)
        cmd_metasploit2
        ;;
	3)
		cmd_msfpc
		;;
    9)
        kalitoolstop10_menu1
        ;;
    *)
        ;;
    esac
}

function cmd_metasploit1(){
    local cmd="" ANS="" RESOURCE=""
	clear
	figlet Metasploit
    cmd="msfconsole"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}${USERNAME}@${HOSTNAME}${NC}:${RED}[1]Kali-tools-top10${WHITE} > [0]Next > [1]metasploit-framework > [1]Normal Boot${NC}\n"
    printf "+${BLUE}Options${NC}:\n"
    printf "|  ${YELLOW}-q, --quiet${NC}                      Do not print the banner on startup\n"
    printf "|  ${YELLOW}-r, --resource FILE${NC}              Execute the specified resource file (- for stdin)\n"
    printf "|  ${YELLOW}-h, --help${NC}                       Show this message\n"
    echo "> Select Boot style"
    num1 0 "Normal"
    num2 0 "Quiet"
    num3 0 "resource"
    num4 0 "Help"
    read -n 1 -s ANS
    case $ANS in
    1)
        SET_NUMBER=10111
        OPTION="Normal Boot"
        cmd="msfconsole"
        ;;
    2)
        SET_NUMBER=10112
        OPTION="Quiet Boot"
        cmd="msfconsole -q"
        ;;
    3)
        SET_NUMBER=10113
        OPTION="Resource"
        read -e -p "> Enter the resource file path: " RESOURCE
        cmd="msfconsole -r ${RESOURCE}"
        ;;
    4)
        SET_NUMBER=10114
        OPTION="Help"
        cmd="msfconsole -h"
        ;;
    esac
    printf "+${BLUE}usage${NC} :Usage: msfconsole ${WHITE}[options]${NC}\n"
    echo "└─Command > $cmd"
    echo ""
    echo "> You ready?"
    num1 0 "No"
    num2 0 "Yes"
    read -n 1 -s ANS
    if [ ! -z "$ANS" ];then
        if [ $ANS = "2" ];then
            show_number $SET_NUMBER "metasploit $OPTION"
            eval $cmd
        else
            :
        fi
    else
        :
    fi
}

function cmd_metasploit2(){
    local LHOST="" LPORT="" cmd="" ANS=""
	clear
	figlet Metasploit
    cmd="msfconsole"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}${USERNAME}@${HOSTNAME}${NC}:${RED}[1]Kali-tools-top10${WHITE} > [0]Next > [1]metasploit-framework > [2]Create Multi Handler${NC}\n"
    echo "> Create handler..."
    read -p "> Enter Local host <IP Address>: " LHOST
    echo "|"
    read -p "> Enter Local Port: " LPORT
    cat <<EOF >> resouce.rc
use exploit/multi/handler
set PAYLOAD windows/meterpreter/reverse_tcp
set LHOST $LHOST
set LPORT $LPORT
exploit
EOF
    echo "|"
    printf "+  ${YELLOW}PAYLOAD${NC}: windows/meterpreter/reverse_tcp\n"
    printf "+  ${YELLOW}LHOST${NC}  : $LHOST\n"
    printf "+  ${YELLOW}LPORT${NC}  : $LPORT\n"
    cmd+=" -r resouce.rc"
    echo "└─Command > $cmd"
    echo ""
    echo "> You ready?"
    num1 0 "No"
    num2 0 "Yes"
    read -n 1 -s ANS
    if [ ! -z "$ANS" ];then
        if [ $ANS = "2" ];then
            show_number 1012 "metasploit Create_Multi_handler"
            eval $cmd
        else
            :
        fi
    else
        :
    fi
    rm resouce.rc
}

