#!/bin/bash

source kp.conf
source $MODULES_PATH/misc_module.sh

function menu_nmap(){
	clear
	figlet Nmap
    num1 0 "Kali-tools-top10"
    num2 5 "nmap"
    num1 10 "Ping_Scan"
    num2 10 "Intense_Scan"
    num3 10 "Intense_Scan+UDP"
    num4 10 "Intense_Scan_all_TCP_Port"
    num5 10 "Vuln_Scan"
    num6 10 "Manual"
    num9 10 "Back"
	read -n 1 -s NUM
    case $NUM in
    1) cmd_nmap1 ;;
    2) cmd_nmap2 ;;
	3) cmd_nmap3 ;;
    4) cmd_nmap4 ;;
    5) cmd_nmap5 ;;
    6) cmd_nmap6 ;;
    9) kalitoolstop10_menu1 ;;
    *) ;;
    esac
}

function cmd_nmap1(){
    local TARGET="" cmd="" ANS=""
    clear
	figlet Nmap
    cmd="nmap"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}${USERNAME}@${HOSTNAME}${NC}:${RED}[1]Kali-tools-top10${NC} > ${GREEN}[2]$cmd${NC} > ${RED}[1]Ping Scan${NC}\n"
    printf "+${BLUE}Options${NC}:\n"
    printf "|  ${YELLOW}-sn${NC}:            Ping Scan - disable port scan\n"
    printf "|  ${YELLOW}-oA <basename>${NC}: Output in the three major formats at once\n"
    printf "|  ${YELLOW}-v${NC}:             Increase verbosity level (use -vv or more for greater effect)\n"
    read -p "> Input Target IP: " TARGET
    echo "|"
    printf "+${BLUE}usage${NC}: nmap ${WHITE}[Scan Type...] [Options] {target specification}${NC}\n"
    cmd="${cmd} -sn -v -oA result/$TARGET/PingScan_`date "+%Y%m%d-%H%M%S"` $TARGET" 
    echo "└─Command > $cmd"
    echo ""
    echo "> You ready?"
    num1 0 "No"
    num2 0 "Yes"
    read -n 1 -s ANS
    if [ ! -z "$ANS" ];then
        if [ $ANS = "2" ];then
            if [ ! -d result/$TARGET ];then
                mkdir result/$TARGET
            fi
            show_number 1021 "nmap Ping_Scan"
            eval $cmd
        else
            :
        fi
    else
        :
    fi
}

function cmd_nmap2(){
    local TARGET="" cmd="" ANS=""
    clear
	figlet Nmap
    cmd="nmap"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}${USERNAME}@${HOSTNAME}${NC}:${RED}[1]Kali-tools-top10${NC} > ${GREEN}[2]$cmd${NC} > ${GREEN}[2]IntenseScan${NC}\n"
    printf "+${BLUE}Options${NC}:\n"
    printf "|  ${YELLOW}-Pn${NC}:            Treat all hosts as online -- skip host discovery\n"
    printf "|  ${YELLOW}-T<0-5>${NC}:        Set timing template (higher is faster)\n"
    printf "|  ${YELLOW}-A${NC}:             Enable OS detection, version detection, script scanning, and traceroute\n"
    printf "|  ${YELLOW}-oA <basename>${NC}: Output in the three major formats at once\n"
    printf "|  ${YELLOW}-v${NC}:             Increase verbosity level (use -vv or more for greater effect)\n"
    read -p "> Input Target IP: " TARGET
    echo "|"
    printf "+${BLUE}usage${NC}: nmap ${WHITE}[Scan Type...] [Options] {target specification}${NC}\n"
    cmd="${cmd} -Pn -T4 -A -v -oA result/$TARGET/IntenseScan_`date "+%Y%m%d-%H%M%S"` $TARGET" 
    echo "└─Command > $cmd"
    echo ""
    echo "> You ready?"
    num1 0 "No"
    num2 0 "Yes"
    read -n 1 -s ANS
    if [ ! -z "$ANS" ];then
        if [ $ANS = "2" ];then
            if [ ! -d result/$TARGET ];then
                mkdir result/$TARGET
            fi
            show_number 1022 "nmap Intense_Scan"
            eval $cmd
        else
            :
        fi
    else
        :
    fi
}

function cmd_nmap3(){
    local TARGET="" cmd="" ANS=""
    clear
	figlet Nmap
    cmd="nmap"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}${USERNAME}@${HOSTNAME}${NC}:${RED}[1]Kali-tools-top10${NC} > ${GREEN}[2]$cmd${NC} > ${YELLOW}[3]IntenseScan+UDP${NC}\n"
    printf "+${BLUE}Options${NC}:\n"
    printf "|  ${YELLOW}-Pn${NC}:            Treat all hosts as online -- skip host discovery\n"
    printf "|  ${YELLOW}-sS/sT/sA/sW/sM${NC}: TCP SYN/Connect()/ACK/Window/Maimon scANS\n"
    printf "|  ${YELLOW}-sU${NC}:             UDP Scan\n"
    printf "|  ${YELLOW}-T<0-5>${NC}:         Set timing template (higher is faster)\n"
    printf "|  ${YELLOW}-A${NC}:              Enable OS detection, version detection, script scanning, and traceroute\n"
    printf "|  ${YELLOW}-oA <basename>${NC}:  Output in the three major formats at once\n"
    printf "|  ${YELLOW}-v${NC}:              Increase verbosity level (use -vv or more for greater effect)\n"
    read -p "> Input Target IP: " TARGET
    echo "|"
    printf "+${BLUE}usage${NC}: nmap ${WHITE}[Scan Type...] [Options] {target specification}${NC}\n"
    cmd="${cmd} -Pn -sS -sU -T4 -A -v -oA result/$TARGET/IntenseScanUDP_`date "+%Y%m%d-%H%M%S"` $TARGET" 
    echo "└─Command > $cmd"
    echo ""
    echo "> You ready?"
    num1 0 "No"
    num2 0 "Yes"
    read -n 1 -s ANS
    if [ ! -z "$ANS" ];then
        if [ $ANS = "2" ];then
            if [ ! -d result/$TARGET ];then
                mkdir result/$TARGET
            fi
            show_number 1023 "nmap Intense_Scan+UDP"
            eval $cmd
        else
            :
        fi
    else
        :
    fi
}

function cmd_nmap4(){
    local TARGET="" cmd="" ANS=""
    clear
	figlet Nmap
    cmd="nmap"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}${USERNAME}@${HOSTNAME}${NC}:${RED}[1]Kali-tools-top10${NC} > ${GREEN}[2]$cmd${NC} > ${BLUE}[4]IntenseScan_all_TCP${NC}\n"
    printf "+${BLUE}Options${NC}:\n"
    printf "|  ${YELLOW}-Pn${NC}:            Treat all hosts as online -- skip host discovery\n"
    printf "|  ${YELLOW}-p <port ranges>${NC}: Only scan specified ports\n"
    printf "|         ${YELLOW}Ex${NC}: -p22; -p1-65535; -p U:53,111,137,T:21-25,80,139,8080,S:9\n"
    printf "|  ${YELLOW}-T<0-5>${NC}:          Set timing template (higher is faster)\n"
    printf "|  ${YELLOW}-A${NC}:               Enable OS detection, version detection, script scanning, and traceroute\n"
    printf "|  ${YELLOW}-oA <basename>${NC}:   Output in the three major formats at once\n"
    printf "|  ${YELLOW}-v${NC}:               Increase verbosity level (use -vv or more for greater effect)\n"
    read -p "> Input Target IP: " TARGET
    echo "|"
    printf "+${BLUE}usage${NC}: nmap ${WHITE}[Scan Type...] [Options] {target specification}${NC}\n"
    cmd="${cmd} -Pn -p 1-65535 -T4 -A -v -oA result/$TARGET/IntenseScanAllTCP_`date "+%Y%m%d-%H%M%S"` $TARGET" 
    echo "└─Command > $cmd"
    echo ""
    echo "> You ready?"
    num1 0 "No"
    num2 0 "Yes"
    read -n 1 -s ANS
    if [ ! -z "$ANS" ];then
        if [ $ANS = "2" ];then
            if [ ! -d result/$TARGET ];then
                mkdir result/$TARGET
            fi
            show_number 1024 "nmap Intense_Scan_all_TCP"
            eval $cmd
        else
            :
        fi
    else
        :
    fi
}

function cmd_nmap5(){
    local TARGET="" cmd="" ANS=""
    clear
	figlet Nmap
    cmd="nmap"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}${USERNAME}@${HOSTNAME}${NC}:${RED}[1]Kali-tools-top10${NC} > ${GREEN}[2]$cmd${NC} > ${PURPLE}[5]Vuln Scan${NC}\n"
    printf "+${BLUE}Options${NC}:\n"
    printf "|  ${YELLOW}-Pn${NC}:                    Treat all hosts as online -- skip host discovery\n"
    printf "|  ${YELLOW}--script=<Lua scripts>${NC}: <Lua scripts> is a comma separated list of\n"
    printf "|                          directories, script-files or script-categories\n"
    printf "|  ${YELLOW}-oA <basename>${NC}:         Output in the three major formats at once\n"
    printf "|  ${YELLOW}-v${NC}:                     Increase verbosity level (use -vv or more for greater effect)\n"
    read -p "> Input Target IP: " TARGET
    echo "|"
    printf "+${BLUE}usage${NC}: nmap ${WHITE}[Scan Type...] [Options] {target specification}${NC}\n"
    cmd="${cmd} -Pn --script vuln -v -oA result/$TARGET/ScriptScanVuln_`date "+%Y%m%d-%H%M%S"` $TARGET" 
    echo "└─Command > $cmd"
    echo ""
    echo "> You ready?"
    num1 0 "No"
    num2 0 "Yes"
    read -n 1 -s ANS
    if [ ! -z "$ANS" ];then
        if [ $ANS = "2" ];then
            if [ ! -d result/$TARGET ];then
                mkdir result/$TARGET
            fi
            show_number 1025 "nmap Vuln_Scan"
            eval $cmd
        else
            :
        fi
    else
        :
    fi
}

function cmd_nmap6(){
    local cmd=""
    clear
	figlet Nmap
    cmd="nmap"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}${USERNAME}@${HOSTNAME}${NC}:${RED}[1]Kali-tools-top10${NC} > ${GREEN}[2]$cmd${NC} > ${LIGHTBLUE}[6]Manual${NC}\n"
    printf "+${BLUE}Options${NC}:\n"
    printf "|  ${YELLOW}-sn${NC}:            Ping Scan - disable port scan\n"
    printf "|  ${YELLOW}-Pn${NC}:            Treat all hosts as online -- skip host discovery\n"
    printf "|  ${YELLOW}-T<0-5>${NC}:        Set timing template (higher is faster)\n"
    printf "|  ${YELLOW}-A${NC}:             Enable OS detection, version detection, script scanning, and traceroute\n"
    printf "|  ${YELLOW}-p <port ranges>${NC}: Only scan specified ports\n"
    printf "|         ${YELLOW}Ex${NC}: -p22; -p1-65535; -p U:53,111,137,T:21-25,80,139,8080,S:9\n"
    printf "|  ${YELLOW}--script=<Lua scripts>${NC}: <Lua scripts> is a comma separated list of\n"
    printf "|                          directories, script-files or script-categories\n"
    printf "|  ${YELLOW}-oA <basename>${NC}:         Output in the three major formats at once\n"
    printf "|  ${YELLOW}-v${NC}:                     Increase verbosity level (use -vv or more for greater effect)\n"
    echo "|"
    printf "+${BLUE}Usage${NC}: nmap [Scan Type(s)] [Options] {target specification}\n"
    read -e -p "└─Command > " cmd
    show_number 1026 "nmap Manual"
    eval $cmd
}