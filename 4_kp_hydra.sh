#!/bin/bash

source kp.conf

function menu_hydra(){
	clear
	figlet hydra
    printf "${WHITE}+---+\n"
    printf "| 1 |%s\n" " Kali-tools-top10"
    printf "+---+\n"
    printf "${BLUE}%5s+---+\n"
    printf "%5s| 4 |%s\n" "" " hydra"
    printf "%5s+---+\n"
	printf "${WHITE}%10s+---+\n"
	printf "%10s| 1 |%s\n" "" " Brute force the username admin "
	printf "%10s+---+%s\n" "" " with the given password list"
    printf "%10s+---+\n"
    printf "%10s| 2 |%s\n" "" " Brute force SSH with user and password lists"
    printf "%10s+---+%s\n${NC}" "" " against target IP address"
    read -n 1 -s NUM
    case $NUM in
    1)
        cmd_hydra1
        ;;
    2)
        cmd_hydra2
        ;;
    *)
        ;;
	esac
}

function cmd_hydra1(){
    clear
    figlet hydra
    cmd="hydra"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}`whoami`@`hostname`${NC}:${BLUE}[1]Kali-tools-top10${NC} > ${BLUE}[4]$cmd${NC} > ${BLUE}[1]Brute force${NC}\n"
	printf "${BLUE}Options${NC}:\n"
    echo "  -l LOGIN or -L FILE     login with LOGIN name, or load several logins from FILE"
    echo "  -p PASS  or -P FILE     try password PASS, or load several passwords from FILE"
    echo "  -t TASKS                run TASKS number of connects in parallel per target (default: 16)"
    echo "  -v / -V / -d            verbose mode / show login+pass for each attempt / debug mode "
	echo "  server                  the target: DNS, IP or 192.168.0.0/24 (this OR the -M option)"
	echo "  service                 the service to crack (see below for supported protocols)"
	printf "${BLUE}usage${NC}: hydra ${WHITE}[[[-l LOGIN|-L FILE] [-p PASS|-P FILE]] | [-C FILE]] [-e nsr] [-o FILE] [-t TASKS] [-M FILE [-T TASKS]] [-w TIME] [-W TIME] [-f] [-s PORT] [-x MIN:MAX:CHARSET] [-c TIME] [-ISOuvVd46] [-m MODULE_OPT] [service://server[:PORT][/OPT]]${NC}\n"
	printf "${RED}Example${NC}:   hydra -t 1 -l admin -P <PASSWORD_LIST_PATH> -v ftp://<IP_ADDRESS> ftp\n"
    read -p "usernsme: " USERNAME
    read -e -p "password list path:" PASSWORD_LIST_PATH
    read -p "IP Address:" IP_ADDRESS
    read -p "service: " SERVICE
    cmd="$cmd -t -l $USERNAME -P $PASSWORD_LIST_PATH -v $SERVICE://$IP_ADDRESS $SERVICE"
    echo "└─Command? > $cmd"
    read -n 1 -p "You ready? y|n > " ANS
    echo ""
    if [ $ANS = "y" ] || [ $ANS = "y" ];then
        eval $cmd
    fi
}

function cmd_hydra2(){
    clear
    figlet hydra
    cmd="hydra "
    printf "┌─(${PURPLE}$TITLE${NC})${RED}`whoami`@`hostname`${NC}:${BLUE}[1]Kali-tools-top10${NC} > ${BLUE}[4]$cmd${NC} > ${BLUE}[2]Brute force SSH${NC}\n"
    printf "${BLUE}Options:${NC}\n"
    printf "${BLUE}usage${NC}: hydra ${WHITE}[[[-l LOGIN|-L FILE] [-p PASS|-P FILE]] | [-C FILE]] [-e nsr] [-o FILE] [-t TASKS] [-M FILE [-T TASKS]] [-w TIME] [-W TIME] [-f] [-s PORT] [-x MIN:MAX:CHARSET] [-c TIME] [-ISOuvVd46] [-m MODULE_OPT] [service://server[:PORT][/OPT]]${NC}\n"
    echo "  -l LOGIN or -L FILE     login with LOGIN name, or load several logins from FILE"
    echo "  -p PASS  or -P FILE     try password PASS, or load several passwords from FILE"
	echo "  -u                      loop around users, not passwords (effective! implied with -x)"
	echo "  -t TASKS                run TASKS number of connects in parallel per target (default: 16)"
	echo "  -v / -V / -d            verbose mode / show login+pass for each attempt / debug mode "
    echo "  server                  the target: DNS, IP or 192.168.0.0/24 (this OR the -M option)"
    echo "  service                 the service to crack (see below for supported protocols)"
    printf "${RED}Example${NC}:  hydra -v -u -L <USER_LIST_PATH> -P <PASSWORD_LIST_PATH> -t 1 ssh://<IP_ADDRESS>\n"
    read -e -p "username list path: " USER_LIST_PATH
    read -e -p "password list path:" PASSWORD_LIST_PATH
    read -p "IP Address:" IP_ADDRESS
    read -p "service: " SERVICE
    cmd="$cmd -t -l $USERNAME -P $PASSWORD_LIST_PATH -v $SERVICE://$IP_ADDRESS $SERVICE"
    echo "└─Command? > $cmd"
    read -n 1 -p "You ready? y|n > " ANS
    echo ""
    if [ $ANS = "y" ] || [ $ANS = "y" ];then
        eval $cmd
    fi
}
