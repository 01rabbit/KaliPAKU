#!/bin/bash

source kp.conf
source $MODULES_PATH/misc_module.sh

function menu_nmap(){
	clear
	figlet Nmap
    num1 0 " Kali-tools-top10"
    num2 5 " nmap"
    num1 10 " Ping_Scan"
    num2 10 " Intense_Scan"
    num3 10 " Intense_Scan+UDP"
    num4 10 " Intense_Scan_all_TCP_Port"
    num5 10 " Vuln_Scan"
	read -n 1 -s NUM
    case $NUM in
    1)
        cmd_nmap1
        ;;
    2)
        cmd_nmap2
        ;;
	3)
        cmd_nmap3
		;;
    4)
        cmd_nmap4
        ;;
    5)
        cmd_nmap5
        ;;
    *)
        ;;
    esac
}

function cmd_nmap1(){
    local TARGET="" cmd="" ANS=""
    clear
	figlet Nmap
    cmd="nmap"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}`whoami`@`hostname`${NC}:${RED}[1]Kali-tools-top10${NC} > ${GREEN}[2]$cmd${NC} > ${RED}[1]Ping Scan${NC}\n"
    printf "+${BLUE}Options${NC}:\n"
    echo "|  -sn:            Ping Scan - disable port scan"
    echo "|  -oA <basename>: Output in the three major formats at once"
    echo "|  -v:             Increase verbosity level (use -vv or more for greater effect)"
    read -p "> Input Target IP: " TARGET
    echo "|"
    printf "+${BLUE}usage${NC}: nmap ${WHITE}[Scan Type...] [Options] {target specification}${NC}\n"
    cmd="${cmd} -sn -v -oA pingscan_`date "+%Y%m%d-%H%M%S"` $TARGET" 
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

function cmd_nmap2(){
    local TARGET="" cmd="" ANS=""
    clear
	figlet Nmap
    cmd="nmap"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}`whoami`@`hostname`${NC}:${RED}[1]Kali-tools-top10${NC} > ${GREEN}[2]$cmd${NC} > ${GREEN}[2]IntenseScan${NC}\n"
    printf "+${BLUE}Options${NC}:\n"
    echo "|  -Pn:            Treat all hosts as online -- skip host discovery"
    echo "|  -T<0-5>:        Set timing template (higher is faster)"
    echo "|  -A:             Enable OS detection, version detection, script scanning, and traceroute"
    echo "|  -oA <basename>: Output in the three major formats at once"
    echo "|  -v:             Increase verbosity level (use -vv or more for greater effect)"
    read -p "> Input Target IP: " TARGET
    echo "|"
    printf "+${BLUE}usage${NC}: nmap ${WHITE}[Scan Type...] [Options] {target specification}${NC}\n"
    cmd="${cmd} -Pn -T4 -A -v -oA IntenseScan_`date "+%Y%m%d-%H%M%S"` $TARGET" 
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

function cmd_nmap3(){
    local TARGET="" cmd="" ANS=""
    clear
	figlet Nmap
    cmd="nmap"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}`whoami`@`hostname`${NC}:${RED}[1]Kali-tools-top10${NC} > ${GREEN}[2]$cmd${NC} > ${YELLOW}[3]IntenseScan+UDP${NC}\n"
    printf "+${BLUE}Options${NC}:\n"
    echo "|  -Pn:            Treat all hosts as online -- skip host discovery"
    echo "|  -sS/sT/sA/sW/sM: TCP SYN/Connect()/ACK/Window/Maimon scANS"
    echo "|  -sU:             UDP Scan"
    echo "|  -T<0-5>:         Set timing template (higher is faster)"
    echo "|  -A:              Enable OS detection, version detection, script scanning, and traceroute"
    echo "|  -oA <basename>:  Output in the three major formats at once"
    echo "|  -v:              Increase verbosity level (use -vv or more for greater effect)"
    read -p "> Input Target IP: " TARGET
    echo "|"
    printf "+${BLUE}usage${NC}: nmap ${WHITE}[Scan Type...] [Options] {target specification}${NC}\n"
    cmd="${cmd} -Pn -sS -sU -T4 -A -v -oA IntenseScanUDP_`date "+%Y%m%d-%H%M%S"` $TARGET" 
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

function cmd_nmap4(){
    local TARGET="" cmd="" ANS=""
    clear
	figlet Nmap
    cmd="nmap"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}`whoami`@`hostname`${NC}:${RED}[1]Kali-tools-top10${NC} > ${GREEN}[2]$cmd${NC} > ${BLUE}[4]IntenseScan_all_TCP${NC}\n"
    printf "+${BLUE}Options${NC}:\n"
    echo "|  -Pn:            Treat all hosts as online -- skip host discovery"
    echo "|  -p <port ranges>: Only scan specified ports"
    echo "|         Ex: -p22; -p1-65535; -p U:53,111,137,T:21-25,80,139,8080,S:9"
    echo "|  -T<0-5>:          Set timing template (higher is faster)"
    echo "|  -A:               Enable OS detection, version detection, script scanning, and traceroute"
    echo "|  -oA <basename>:   Output in the three major formats at once"
    echo "|  -v:               Increase verbosity level (use -vv or more for greater effect)"
    read -p "> Input Target IP: " TARGET
    echo "|"
    printf "+${BLUE}usage${NC}: nmap ${WHITE}[Scan Type...] [Options] {target specification}${NC}\n"
    cmd="${cmd} -Pn -p 1-65535 -T4 -A -v -oA IntenseScanAllTCP_`date "+%Y%m%d-%H%M%S"` $TARGET" 
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

function cmd_nmap5(){
    local TARGET="" cmd="" ANS=""
    clear
	figlet Nmap
    cmd="nmap"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}`whoami`@`hostname`${NC}:${RED}[1]Kali-tools-top10${NC} > ${GREEN}[2]$cmd${NC} > ${PURPLE}[5]Vuln Scan${NC}\n"
    printf "+${BLUE}Options${NC}:\n"
    echo "|  -Pn:                    Treat all hosts as online -- skip host discovery"
    echo "|  --script=<Lua scripts>: <Lua scripts> is a comma separated list of"
    echo "|                          directories, script-files or script-categories"
    echo "|  -oA <basename>:         Output in the three major formats at once"
    echo "|  -v:                     Increase verbosity level (use -vv or more for greater effect)"
    read -p "> Input Target IP: " TARGET
    echo "|"
    printf "+${BLUE}usage${NC}: nmap ${WHITE}[Scan Type...] [Options] {target specification}${NC}\n"
    cmd="${cmd} -Pn --script vuln -v -oA ScriptScanVuln_`date "+%Y%m%d-%H%M%S"` $TARGET" 
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
