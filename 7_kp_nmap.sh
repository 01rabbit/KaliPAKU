#!/bin/bash

source kp.conf

function menu_nmap(){
	clear
	figlet Nmap
    printf "${WHITE}+---+\n"
    printf "| 1 |%s\n" " Kali-tools-top10"
    printf "+---+\n"
    printf "${BLUE}%5s+---+\n"
    printf "%5s| 2 |%s\n" "" " nmap"
    printf "%5s+---+\n"
    printf "${WHITE}%10s+---+\n"
    printf "%10s| 1 |%s\n" "" " Ping Scan"
    printf "%10s+---+%s\n"
    printf "%10s+---+\n"
    printf "%10s| 2 |%s\n" "" " Intense Scan"
    printf "%10s+---+%s\n"
    printf "%10s+---+\n"
    printf "%10s| 3 |%s\n" "" " Intense Scan + UDP"
    printf "%10s+---+%s\n"
    printf "%10s+---+\n"
    printf "%10s| 4 |%s\n" "" " Intense Scan all TCP Port"
    printf "%10s+---+%s\n"
    printf "%10s+---+\n"
    printf "%10s| 5 |%s\n" "" " Vuln Scan"
    printf "%10s+---+%s${NC}\n"
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
    clear
	figlet Nmap
    cmd="nmap"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}`whoami`@`hostname`${NC}:${BLUE}[1]Kali-tools-top10${NC} > ${BLUE}[2]$cmd${NC} > ${BLUE}[1]Ping Scan${NC}\n"
    printf "${BLUE}usage${NC}: nmap ${WHITE}[Scan Type...] [Options] {target specification}${NC}\n"
    printf "${BLUE}Options${NC}:\n"
    echo "  -sn:            Ping Scan - disable port scan"
    echo "  -oA <basename>: Output in the three major formats at once"
    echo "  -v:             Increase verbosity level (use -vv or more for greater effect)"
    read -p "Target IP: " TARGET
    cmd="${cmd} -sn -v -oA pingscan_`date "+%Y%m%d-%H%M%S"` $TARGET" 
    echo "└─Command? > $cmd"
    read -n 1 -p "You ready? y|n > " ANS
    echo ""
    if [ $ANS = "y" ] || [ $ANS = "y" ];then
        eval $cmd
    fi
}

function cmd_nmap2(){
    clear
	figlet Nmap
    printf "${BLUE}usage${NC}: nmap ${WHITE}[Scan Type...] [Options] {target specification}${NC}\n"
    printf "${BLUE}Options${NC}:\n"
    echo "  -Pn:            Treat all hosts as online -- skip host discovery"
    echo "  -T<0-5>:        Set timing template (higher is faster)"
    echo "  -A:             Enable OS detection, version detection, script scanning, and traceroute"
    echo "  -oA <basename>: Output in the three major formats at once"
    echo "  -v:             Increase verbosity level (use -vv or more for greater effect)"
    read -p "Target IP: " TARGET
    cmd="nmap"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}`whoami`@`hostname`${NC}:${BLUE}[1]Kali-tools-top10${NC} > ${BLUE}[2]$cmd${NC} > ${BLUE}[2]IntenseScan${NC}\n"
    cmd="${cmd} -Pn -T4 -A -v -oA IntenseScan_`date "+%Y%m%d-%H%M%S"` $TARGET" 
    echo "└─Command? > $cmd"
    read -n 1 -p "You ready? y|n > " ANS
    echo ""
    if [ $ANS = "y" ] || [ $ANS = "y" ];then
        eval $cmd
    fi
}

function cmd_nmap3(){
    clear
	figlet Nmap
    printf "${BLUE}usage${NC}: nmap ${WHITE}[Scan Type...] [Options] {target specification}${NC}\n"
    printf "${BLUE}Options${NC}:\n"
    echo "  -Pn:            Treat all hosts as online -- skip host discovery"
    echo "  -sS/sT/sA/sW/sM: TCP SYN/Connect()/ACK/Window/Maimon scANS"
    echo "  -sU:             UDP Scan"
    echo "  -T<0-5>:         Set timing template (higher is faster)"
    echo "  -A:              Enable OS detection, version detection, script scanning, and traceroute"
    echo "  -oA <basename>:  Output in the three major formats at once"
    echo "  -v:              Increase verbosity level (use -vv or more for greater effect)"
    read -p "Target IP: " TARGET
    cmd="nmap"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}`whoami`@`hostname`${NC}:${BLUE}[1]Kali-tools-top10${NC} > ${BLUE}[2]$cmd${NC} > ${BLUE}[3]IntenseScan+UDP${NC}\n"
    cmd="${cmd} -Pn -sS -sU -T4 -A -v -oA IntenseScanUDP_`date "+%Y%m%d-%H%M%S"` $TARGET" 
    echo "└─Command? > $cmd"
    read -n 1 -p "You ready? y|n > " ANS
    echo ""
    if [ $ANS = "y" ] || [ $ANS = "y" ];then
        eval $cmd
    fi
}

function cmd_nmap4(){
    clear
	figlet Nmap
    printf "${BLUE}usage${NC}: nmap ${WHITE}[Scan Type...] [Options] {target specification}${NC}\n"
    printf "${BLUE}Options${NC}:\n"
    echo "  -Pn:            Treat all hosts as online -- skip host discovery"
    echo "  -p <port ranges>: Only scan specified ports"
    echo "         Ex: -p22; -p1-65535; -p U:53,111,137,T:21-25,80,139,8080,S:9"
    echo "  -T<0-5>:          Set timing template (higher is faster)"
    echo "  -A:               Enable OS detection, version detection, script scanning, and traceroute"
    echo "  -oA <basename>:   Output in the three major formats at once"
    echo "  -v:               Increase verbosity level (use -vv or more for greater effect)"
    read -p "Target IP: " TARGET
    cmd="nmap"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}`whoami`@`hostname`${NC}:${BLUE}[1]Kali-tools-top10${NC} > ${BLUE}[2]$cmd${NC} > ${BLUE}[4]IntenseScan_all_TCP${NC}\n"
    cmd="${cmd} -Pn -p 1-65535 -T4 -A -v -oA IntenseScanAllTCP_`date "+%Y%m%d-%H%M%S"` $TARGET" 
    echo "└─Command? > $cmd"
    read -n 1 -p "You ready? y|n > " ANS
    echo ""
    if [ $ANS = "y" ] || [ $ANS = "y" ];then
        eval $cmd
    fi
}

function cmd_nmap5(){
    clear
	figlet Nmap
    printf "${BLUE}usage${NC}: nmap ${WHITE}[Scan Type...] [Options] {target specification}${NC}\n"
    printf "${BLUE}Options${NC}:\n"
    echo "  -Pn:                    Treat all hosts as online -- skip host discovery"
    echo "  --script=<Lua scripts>: <Lua scripts> is a comma separated list of"
    echo "                          directories, script-files or script-categories"
    echo "  -oA <basename>:         Output in the three major formats at once"
    echo "  -v:                     Increase verbosity level (use -vv or more for greater effect)"
    read -p "Target IP: " TARGET
    cmd="nmap"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}`whoami`@`hostname`${NC}:${BLUE}[1]Kali-tools-top10${NC} > ${BLUE}[2]$cmd${NC} > ${BLUE}[5]Vuln Scan${NC}\n"
    cmd="${cmd} -Pn --script vuln -v -oA ScriptScanVuln_`date "+%Y%m%d-%H%M%S"` $TARGET" 
    echo "└─Command? > $cmd"
    read -n 1 -p "You ready? y|n > " ANS
    echo ""
    if [ $ANS = "y" ] || [ $ANS = "y" ];then
        eval $cmd
    fi
}
