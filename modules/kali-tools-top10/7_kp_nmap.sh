#!/bin/bash

source kp.conf
source $MODULES_PATH/misc_module.sh

function menu_nmap(){
	clear
	header
    num1 0 "Kali-tools-top10"
    num2 3 "nmap"
    num1 6 "Ping_Scan"
    num2 6 "Intense_Scan"
    num3 6 "Intense_Scan_UDP"
    num4 6 "Intense_Scan_all_TCP"
    num5 6 "Vuln_Scan"
    num6 6 "Manual"
    num9 6 "Back"
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
    clear
	figlet Nmap
    cmd="nmap"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}${USERNAME}@${HOSTNAME}${NC}:${RED}[1]Kali-tools-top10${WHITE} > [0] Next > [2]nmap > $[1]Ping Scan${NC}\n"
    printf "+${BLUE}Options${NC}:\n"
    printf "|  ${YELLOW}-sn${NC}:            Ping Scan - disable port scan\n"
    printf "|  ${YELLOW}-oA <basename>${NC}: Output in the three major formats at once\n"
    printf "|  ${YELLOW}-v${NC}:             Increase verbosity level (use -vv or more for greater effect)\n"
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
            show_number 1021 "nmap PingScan"
            tmux split-window -v
            tmux send-keys "${cmd};read;exit" C-m
            tmux select-pane -t "${TITLE}".0
            # eval $cmd
        else
            :
        fi
    else
        :
    fi
}

function cmd_nmap2(){
    clear
	figlet Nmap
    cmd="nmap"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}${USERNAME}@${HOSTNAME}${NC}:${RED}[1]Kali-tools-top10${WHITE} > [0] Next > [2]nmap > [2]IntenseScan${NC}\n"
    printf "+${BLUE}Options${NC}:\n"
    printf "|  ${YELLOW}-Pn${NC}:            Treat all hosts as online -- skip host discovery\n"
    printf "|  ${YELLOW}-p <port ranges>${NC}: Only scan specified ports\n"
    printf "|         ${YELLOW}Ex${NC}: -p22; -p1-65535; -p U:53,111,137,T:21-25,80,139,8080,S:9\n"
    printf "|  ${YELLOW}-T<0-5>${NC}:        Set timing template (higher is faster)\n"
    printf "|  ${YELLOW}-A${NC}:             Enable OS detection, version detection, script scanning, and traceroute\n"
    printf "|  ${YELLOW}-oA <basename>${NC}: Output in the three major formats at once\n"
    printf "|  ${YELLOW}-v${NC}:             Increase verbosity level (use -vv or more for greater effect)\n"
    echo "|"
    echo "> Here, we run a port scan beforehand and perform an Intense Scan of the open ports."
    echo "> Running port scan on all ports..."
    if [ ! -d "result/$TARGET" ]; then
        mkdir result/$TARGET
    fi

    FILE=(result/$TARGET/PortScan_`date "+%Y%m%d-%H%M%S"`.nmap)
    nmap -T4 -Pn $TARGET -oN $FILE

    if [ -e $FILE ];then
        echo "> Extracting open ports..."
        open_ports=$(grep -E '^[0-9]+/tcp *open' $FILE |cut -d '/' -f 1|paste -sd ",")
    fi
    printf "+${BLUE}usage${NC}: nmap ${WHITE}[Scan Type...] [Options] {target specification}${NC}\n"
    if [ -z "$open_ports" ];then
        cmd="${cmd} -Pn  -T4 -A -v -oA result/$TARGET/IntenseScan_`date "+%Y%m%d-%H%M%S"` $TARGET"
    else
        cmd="${cmd} -Pn -p $open_ports -T4 -A -v -oA result/$TARGET/IntenseScan_`date "+%Y%m%d-%H%M%S"` $TARGET" 
    fi

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
            show_number 1022 "nmap IntenseScan"
            tmux split-window -v
            tmux send-keys "${cmd};read;exit" C-m
            tmux select-pane -t "${TITLE}".0
            # eval $cmd
        else
            :
        fi
    else
        :
    fi
}

function cmd_nmap3(){
    clear
	figlet Nmap
    cmd="nmap"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}${USERNAME}@${HOSTNAME}${NC}:${RED}[1]Kali-tools-top10${WHITE} > [0] Next > [2]nmap > [3]IntenseScan_UDP${NC}\n"
    printf "+${BLUE}Options${NC}:\n"
    printf "|  ${YELLOW}-Pn${NC}:            Treat all hosts as online -- skip host discovery\n"
    printf "|  ${YELLOW}-p <port ranges>${NC}: Only scan specified ports\n"
    printf "|         ${YELLOW}Ex${NC}: -p22; -p1-65535; -p U:53,111,137,T:21-25,80,139,8080,S:9\n"
    printf "|  ${YELLOW}-sU${NC}:             UDP Scan\n"
    printf "|  ${YELLOW}-T<0-5>${NC}:         Set timing template (higher is faster)\n"
    printf "|  ${YELLOW}-A${NC}:              Enable OS detection, version detection, script scanning, and traceroute\n"
    printf "|  ${YELLOW}-oA <basename>${NC}:  Output in the three major formats at once\n"
    printf "|  ${YELLOW}-v${NC}:              Increase verbosity level (use -vv or more for greater effect)\n"
    echo "|"
    echo "> Here, we run a port scan beforehand and perform an Intense Scan of the open ports."
    echo "> Running port scan on all ports..."
    if [ ! -d "result/$TARGET" ]; then
        mkdir result/$TARGET
    fi
    FILE=(result/$TARGET/PortScanUDP_`date "+%Y%m%d-%H%M%S"`.nmap)
    sudo nmap -sU -F -Pn -T4 $TARGET -oN $FILE

    if [ -e $FILE ];then
        echo "> Extracting open ports..."
        open_ports=$(grep -E '^[0-9]+/udp *open' $FILE |cut -d '/' -f 1|paste -sd ",")
    fi
    if [ -z "$open_ports" ];then
        cmd="sudo ${cmd} -Pn -sU -T4 -A -v -oA result/$TARGET/IntenseScanUDP_`date "+%Y%m%d-%H%M%S"` $TARGET"
    else
        cmd="sudo ${cmd} -Pn -sU -p $open_ports -T4 -A -v -oA result/$TARGET/IntenseScanUDP_`date "+%Y%m%d-%H%M%S"` $TARGET"
    fi
    printf "+${BLUE}usage${NC}: nmap ${WHITE}[Scan Type...] [Options] {target specification}${NC}\n"
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
            show_number 1023 "nmap IntenseScan UDP"
            tmux split-window -v
            tmux send-keys "${cmd};read;exit" C-m
            tmux select-pane -t "${TITLE}".0

            # eval $cmd
        else
            :
        fi
    else
        :
    fi
}

function cmd_nmap4(){
    clear
	figlet Nmap
    cmd="nmap"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}${USERNAME}@${HOSTNAME}${NC}:${RED}[1]Kali-tools-top10${WHITE} > [0] Next > [2]nmap > [4]IntenseScan_all_TCP${NC}\n"
    printf "+${BLUE}Options${NC}:\n"
    printf "|  ${YELLOW}-Pn${NC}:            Treat all hosts as online -- skip host discovery\n"
    printf "|  ${YELLOW}-p <port ranges>${NC}: Only scan specified ports\n"
    printf "|         ${YELLOW}Ex${NC}: -p22; -p1-65535; -p U:53,111,137,T:21-25,80,139,8080,S:9\n"
    printf "|  ${YELLOW}-T<0-5>${NC}:          Set timing template (higher is faster)\n"
    printf "|  ${YELLOW}-A${NC}:               Enable OS detection, version detection, script scanning, and traceroute\n"
    printf "|  ${YELLOW}-oA <basename>${NC}:   Output in the three major formats at once\n"
    printf "|  ${YELLOW}-v${NC}:               Increase verbosity level (use -vv or more for greater effect)\n"
    echo "|"
    echo "> Here, we run a port scan beforehand and perform an Intense Scan of the open ports."
    echo "> Running port scan on all ports..."
    if [ ! -d "result/$TARGET" ]; then
        mkdir result/$TARGET
    fi
    FILE=(result/$TARGET/PortScanAllTCP_`date "+%Y%m%d-%H%M%S"`.nmap)
    nmap -T4 -Pn -p 1-65535 $TARGET -oN $FILE

    if [ -e $FILE ];then
        echo "> Extracting open ports..."
        open_ports=$(grep -E '^[0-9]+/tcp *open' $FILE |cut -d '/' -f 1|paste -sd ",")
    fi
    if [ -z "$open_ports" ];then
        cmd="${cmd} -Pn -T4 -A -v -oA result/$TARGET/IntenseScanAllTCP_`date "+%Y%m%d-%H%M%S"` $TARGET"
    else
        cmd="${cmd} -Pn -p $open_port -T4 -A -v -oA result/$TARGET/IntenseScanAllTCP_`date "+%Y%m%d-%H%M%S"` $TARGET"
    fi
    printf "+${BLUE}usage${NC}: nmap ${WHITE}[Scan Type...] [Options] {target specification}${NC}\n"
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
            show_number 1024 "nmap IntenseScan All TCP"
            tmux split-window -v
            tmux send-keys "${cmd};read;exit" C-m
            tmux select-pane -t "${TITLE}".0

            # eval $cmd
        else
            :
        fi
    else
        :
    fi
}

function cmd_nmap5(){
    clear
	figlet Nmap
    cmd="nmap"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}${USERNAME}@${HOSTNAME}${NC}:${RED}[1]Kali-tools-top10${WHITE} > [0] Next > [2]nmap > [5]Vuln Scan${NC}\n"
    printf "+${BLUE}Options${NC}:\n"
    printf "|  ${YELLOW}-Pn${NC}:                    Treat all hosts as online -- skip host discovery\n"
    printf "|  ${YELLOW}-p <port ranges>${NC}: Only scan specified ports\n"
    printf "|         ${YELLOW}Ex${NC}: -p22; -p1-65535; -p U:53,111,137,T:21-25,80,139,8080,S:9\n"
    printf "|  ${YELLOW}--script=<Lua scripts>${NC}: <Lua scripts> is a comma separated list of\n"
    printf "|                          directories, script-files or script-categories\n"
    printf "|  ${YELLOW}-oA <basename>${NC}:         Output in the three major formats at once\n"
    printf "|  ${YELLOW}-v${NC}:                     Increase verbosity level (use -vv or more for greater effect)\n"
    echo "|"
    echo "> Here, we run a port scan beforehand and perform an Intense Scan of the open ports."
    echo "> Running port scan on all ports..."
    if [ ! -d "result/$TARGET" ]; then
        mkdir result/$TARGET
    fi
    FILE=(result/$TARGET/PortScanAllTCP_Vuln_`date "+%Y%m%d-%H%M%S"`.nmap)
    nmap -T4 -p 1-65535 $TARGET -oN $FILE

    if [ -e $FILE ];then
        echo "> Extracting open ports..."
        open_ports=$(grep -E '^[0-9]+/tcp *open' $FILE |cut -d '/' -f 1|paste -sd ",")
    fi
    if [ -z "$open_ports" ];then
        cmd="${cmd} -Pn --script vuln -v -oA result/$TARGET/ScriptScanVuln_`date "+%Y%m%d-%H%M%S"` $TARGET"
    else
        cmd="${cmd} -Pn -p $open_ports --script vuln -v -oA result/$TARGET/ScriptScanVuln_`date "+%Y%m%d-%H%M%S"` $TARGET"
    fi
    printf "+${BLUE}usage${NC}: nmap ${WHITE}[Scan Type...] [Options] {target specification}${NC}\n"
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
            show_number 1025 "nmap VulnScan"
            tmux split-window -v
            tmux send-keys "${cmd};read;exit" C-m
            tmux select-pane -t "${TITLE}".0

            # eval $cmd
        else
            :
        fi
    else
        :
    fi
}

function cmd_nmap6(){
    clear
    show_number 1026 "nmap Manual"
    cmd="nmap"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}${USERNAME}@${HOSTNAME}${NC}:${RED}[1]Kali-tools-top10${WHITE} > [0] Next > [2]nmap > [6]Manual${NC}\n"
    printf "+${BLUE}Options${NC}:\n"
    printf "|  ${YELLOW}-sn${NC}:            Ping Scan - disable port scan\n"
    printf "|  ${YELLOW}-Pn${NC}:            Treat all hosts as online -- skip host discovery\n"
    printf "|  ${YELLOW}-T<0-5>${NC}:        Set timing template (higher is faster)\n"
    printf "|  ${YELLOW}-sS/sT/sA/sW/sM${NC}: TCP SYN/Connect()/ACK/Window/Maimon scANS\n"
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
    eval $cmd
}