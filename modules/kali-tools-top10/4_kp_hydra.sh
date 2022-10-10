#!/bin/bash

source kp.conf
source $MODULES_PATH/misc_module.sh

function menu_hydra(){
	clear
	figlet hydra
    num1 0 " Kali-tools-top10"
    num4 5 " hydra"
    num1 10 " Bruteforce_the_username_admin " " with_the_given_password_list"
    num2 10 " Bruteforce_SSH_with_user_and_password_lists" " against_target_IP_address"
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
    local cmd="" USERNAME="" PASSWORD="" SERVER="" SERVICE="" ANS=""
    clear
    figlet hydra
    cmd="hydra"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}`whoami`@`hostname`${NC}:${RED}[1]Kali-tools-top10${NC} > ${BLUE}[4]$cmd${NC} > ${RED}[1]Brute force${NC}\n"
	printf "+${BLUE}Options${NC}:\n"
    echo "|  -l LOGIN or -L FILE     login with LOGIN name, or load several logins from FILE"
    echo "> Username or Username File?"
    num1 0 "Username"
    num2 0 "Username File"
    read -n 1 -s ANS
    if [ $ANS = 1 ];then
        read -p "> Input Username: " USERNAME
        USERNAME="-l ${USERNAME}"
    else
        read -p "> Input Username File path: " USERNAME
        USERNAME="-L ${USERNAME}"
    fi 
    echo "|"
    echo "|  -p PASS  or -P FILE     try password PASS, or load several passwords from FILE"
    echo "> Password or Password File?"
    num1 0 "Password"
    num2 0 "Password File"
    read -n 1 -s ANS
    if [ $ANS = 1 ];then
        read -p "> Input Password: " PASSWORD
        PASSWORD="-p ${PASSWORD}"
    else
        echo "> Original list or Default?"
        num1 0 "Original Password List"
        num2 0 "Default Password List"
        read -n 1 -s ANS
        if [$ANS = 1 ];then
            read -p "> Input Original Password File path: " USERNAME
            USERNAME="-P ${USERNAME}"
        else
            echo "> Use Default PAssword List."
            USERNAME="-P rockyou.txt"
        fi
    fi
    echo "|"
    echo "|  -t TASKS                run TASKS number of connects in parallel per target (default: 16)"
    echo "|  -v / -V / -d            verbose mode / show login+pass for each attempt / debug mode "
	echo "|  server                  the target: DNS, IP or 192.168.0.0/24 (this OR the -M option)"
    read -p "> Input Target:" SERVER
    echo "|"
	echo "|  service                 the service to crack (see below for supported protocols)"
    echo "> Which Service?"
    num1 0 "SSH"
    num2 0 "FTP"
    num3 0 "TELNET"
    read -n 1 -s ANS
    case $ANS in
    1)
        SERVICE="ssh"
        ;;
    2)
        SERVICE="ftp"
        ;;
    3)
        SERVICE="telnet"
        ;;
    esac
    echo "|"
	printf "+${BLUE}usage${NC}: hydra ${WHITE}[[[-l LOGIN|-L FILE] [-p PASS|-P FILE]] | [-C FILE]] [-e nsr] [-o FILE] [-t TASKS] [-M FILE [-T TASKS]] [-w TIME] [-W TIME] [-f] [-s PORT] [-x MIN:MAX:CHARSET] [-c TIME] [-ISOuvVd46] [-m MODULE_OPT] [service://server[:PORT][/OPT]]${NC}\n"
    #echo "|"
	#printf "+${RED}Example${NC}:   hydra -t 1 -l admin -P <PASSWORD_LIST_PATH> -v ftp://<SERVER> ftp\n"
    cmd="$cmd -t 1 $USERNAME $PASSWORD -v $SERVICE://$SERVER $SERVICE"
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

function cmd_hydra2(){
    local cmd="" USERNAME="" PASSWORD="" SERVER="" ANS=""
    clear
    figlet hydra
    cmd="hydra "
    printf "┌─(${PURPLE}$TITLE${NC})${RED}`whoami`@`hostname`${NC}:${RED}[1]Kali-tools-top10${NC} > ${BLUE}[4]$cmd${NC} > ${GREEN}[2]Brute force SSH${NC}\n"
    printf "+${BLUE}Options:${NC}\n"
    echo "|  -l LOGIN or -L FILE     login with LOGIN name, or load several logins from FILE"
    echo "> Username or Username File?"
    num1 0 "Username"
    num2 0 "Username File"
    read -n 1 -s ANS
    if [ $ANS = "1" ];then
        read -p "> Input Username: " USERNAME
        USERNAME="-l ${USERNAME}"
    else
        read -p "> Input Username File path: " USERNAME
        USERNAME="-L ${USERNAME}"
    fi 
    echo "|"
    echo "|  -p PASS  or -P FILE     try password PASS, or load several passwords from FILE"
    echo "> Password or Password File?"
    num1 0 "Password"
    num2 0 "Password File"
    read -n 1 -s ANS
    if [ $ANS = "1" ];then
        read -p "> Input Password: " PASSWORD
        PASSWORD="-p ${PASSWORD}"
    else
        echo "> Original list or Default?"
        num1 0 "Original Password List"
        num2 0 "Default Password List"
        read -n 1 -s ANS
        if [$ANS = 1 ];then
            read -p "> Input Original Password File path: " USERNAME
            USERNAME="-P ${USERNAME}"
        else
            echo "> Use Default PAssword List."
            USERNAME="-P rockyou.txt"
        fi
    fi
    echo "|"
	echo "|  -u                      loop around users, not passwords (effective! implied with -x)"
	echo "|  -t TASKS                run TASKS number of connects in parallel per target (default: 16)"
	echo "|  -v / -V / -d            verbose mode / show login+pass for each attempt / debug mode "
    echo "|  server                  the target: DNS, IP or 192.168.0.0/24 (this OR the -M option)"
    read -p "> Input Target: " SERVER
    echo "|"
    #printf "${RED}Example${NC}:  hydra -v -u -L <USER_LIST_PATH> -P <PASSWORD_LIST_PATH> -t 1 ssh://<SERVER>\n"
    printf "+${BLUE}usage${NC}: hydra ${WHITE}[[[-l LOGIN|-L FILE] [-p PASS|-P FILE]] | [-C FILE]] [-e nsr] [-o FILE] [-t TASKS] [-M FILE [-T TASKS]] [-w TIME] [-W TIME] [-f] [-s PORT] [-x MIN:MAX:CHARSET] [-c TIME] [-ISOuvVd46] [-m MODULE_OPT] [service://server[:PORT][/OPT]]${NC}\n"
    cmd="$cmd $USERNAME $PASSWORD -u -t 1 -v ssh://$SERVER"
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