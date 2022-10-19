#!/bin/bash

source kp.conf
source $MODULES_PATH/misc_module.sh

function menu_crackmapexec(){
	clear
	figlet crackmapexec
    num1 0 " Kali-tools-top10"
    num3 5 " crackmapexec(SMB)"
    menu_title=("Target_format(Basic)" "Null_session" "Connect_to_target_using_local_account" "Path_the_hash_against_a_subnet" "Brutefocing_&_Password_Spraying")
    num1 10 ${menu_title[0]} ""
    num2 10 ${menu_title[1]}
    num3 10 ${menu_title[2]}
    num4 10 ${menu_title[3]}
    num5 10 ${menu_title[4]}
    read -n 1 -s n
    case $n in
    1)
        cmd_crackmapexec1
        ;;
    2)
        cmd_crackmapexec2
        ;;
    3)
        cmd_crackmapexec3
        ;;
    4)
        cmd_crackmapexec4
        ;;
    5)
        cmd_crackmapexec5
        ;;
    *)
        mainmenu
        ;;
	esac
}

function cmd_crackmapexec1(){
    local cmd="" TARGET="" ANS="" NUM=""
	clear
	figlet crackmapexec
    cmd="crackmapexec"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}${USERNAME}@${HOSTNAME}${NC}:${RED}[1]Kali-tools-top10${NC} > ${YELLOW}[3]$cmd${NC} > ${RED}[1]Target format(Basic)${NC}\n"
    printf "+${BLUE}positional arguments${NC}:\n"
    printf "|  ${YELLOW}target${NC}      the target IP(s), range(s), CIDR(s), hostname(s), FQDN(s),\n"
    echo "|              file(s) containing a list of targets, NMap XML or .Nessus file(s)"
    read -e -p "> Input Target: " TARGET
    echo "|"
    echo "> Use which Service?"
    num1 0 "smb"
    num2 0 "ssh"
    num3 0 "winrm"
    num4 0 "ldap"
    num5 0 "mssql"
    read -n 1 -s NUM
    case $NUM in
    1)
        SERVICE="smb" ;;
    2)
        SERVICE="ssh" ;;
    3)
        SERVICE="winrm" ;;
    4)
        SERVICE="ldap" ;;
    5)
        SERVICE="mssql" ;;
    *)
        ;;
    esac
    printf "+${BLUE}usage${NC}: crackmapexec smb [target ...]\n"
    cmd="${cmd} $SERVICE $TARGET"
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
    NUM=""
    ANS=""
}

function cmd_crackmapexec2(){
    local cmd="" TARGET="" ANS=""
	clear
	figlet crackmapexec
    cmd="crackmapexec"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}${USERNAME}@${HOSTNAME}${NC}:${RED}[1]Kali-tools-top10${NC} > ${YELLO}[3]$cmd${NC} > ${GREEN}[2]Null session${NC}\n"
    printf "+${BLUE}positional arguments${NC}:\n"
    printf "|  ${YELLOW}target${NC}      the target IP(s), range(s), CIDR(s), hostname(s), FQDN(s),\n"
    echo "|              file(s) containing a list of targets, NMap XML or .Nessus file(s)"
    read -e -p "> Input Target: " TARGET
    echo "|"
    SERVICE="smb"
    printf "+${BLUE}usage${NC}: crackmapexec smb [target ...] -u "" up ""\n"
    cmd="${cmd} $SERVICE $TARGET -u \"\" up \"\""
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

function cmd_crackmapexec3(){
    local cmd="" TARGET="" USERNAME="" PASSWORD="" ANS=""
	clear
	figlet crackmapexec
    cmd="crackmapexec"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}${USERNAME}@${HOSTNAME}${NC}:${RED}[1]Kali-tools-top10${NC} > ${YELLOW}[3]$cmd${NC} > ${YELLOW}[3]Connect to target using local account${NC}\n"
    printf "+${BLUE}positional arguments${NC}:\n"
    printf "|  ${YELLOW}target${NC}      the target IP(s), range(s), CIDR(s), hostname(s), FQDN(s),\n"
    echo "|              file(s) containing a list of targets, NMap XML or .Nessus file(s)"
    read -e -p "> Input Target: " TARGET
    echo "|"
    echo "> Use which Service?"
    num1 0 "smb"
    num2 0 "ssh"
    num3 0 "winrm"
    num4 0 "ldap"
    num5 0 "mssql"
    read -n 1 -s NUM
    case $NUM in
    1)
        SERVICE="smb" ;;
    2)
        SERVICE="winrm" ;;
    3)
        SERVICE="ldap" ;;
    4)
        SERVICE="mssql" ;;
    *)
        ;;
    esac
    printf "+${BLUE}options:${NC}\n"
    printf "|  ${YELLOW}-u USERNAME [USERNAME ...]${NC}\n"
    echo "|              username(s) or file(s) containing usernames"
    read -e -p "> Input Username: " USERNAME
    echo "|"
    printf "|  ${YELLOW}-p PASSWORD [PASSWORD ...]${NC}\n"
    echo "|              password(s) or file(s) containing passwords"
    read -e -p "> Input Password: " PASSWORD
    echo "|"
    printf "|  ${YELLOW}--local-auth${NC}          authenticate locally to each target\n"
    echo "|"
    printf "+${BLUE}usage${NC}: crackmapexec smb [target ...] [-u USERNAME [USERNAME ...]] [-p PASSWORD [PASSWORD ...]] [--local-auth]\n"
    cmd="${cmd} $SERVICE $TARGET -u $USERNAME -p $PASSWORD --local-auth"
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

function cmd_crackmapexec4(){
    local cmd="" TARGET="" USERNAME="" HASH="" AUTH="" ANS=""
	clear
	figlet crackmapexec
    cmd="crackmapexec "
    printf "┌─(${PURPLE}$TITLE${NC})${RED}${USERNAME}@${HOSTNAME}${NC}:${RED}[1]Kali-tools-top10${NC} > ${YELLOW}[3]$cmd${NC} > ${BLUE}[4]Path the hash against a subnet${NC}\n"
    printf "+${BLUE}positional arguments${NC}:\n"
    printf "|  ${YELLOW}target${NC}      the target IP(s), range(s), CIDR(s), hostname(s), FQDN(s),\n"
    echo "|              file(s) containing a list of targets, NMap XML or .Nessus file(s)"
    read -e -p "> Input Target(subnet): " TARGET
    echo "|"
    echo "> Use which Service?"
    num1 0 "smb"
    num2 0 "ssh"
    num3 0 "winrm"
    num4 0 "ldap"
    num5 0 "mssql"
    read -n 1 -s NUM
    case $NUM in
    1)
        SERVICE="smb" ;;
    2)
        SERVICE="ssh" ;;
    3)
        SERVICE="winrm" ;;
    4)
        SERVICE="ldap" ;;
    5)
        SERVICE="mssql" ;;
    *)
        ;;
    esac
    printf "+${BLUE}options:${NC}\n"
    printf "|  ${YELLOW}-u USERNAME [USERNAME ...]${NC}\n"
    echo "|              username(s) or file(s) containing usernames"
    read -e -p "> Input Username: " USERNAME
    echo "|"
    printf "|  ${YELLOW}-H HASH [HASH ...], --hash HASH [HASH ...]${NC}\n"
    echo "|              NTLM hash(es) or file(s) containing NTLM hashes"
    read -e -p "> Input HASH(LMHASH:NTHASH|NTHASH): " HASH
    echo "> Which HASH Type was used?"
    num1 0 "LMHASH:NTHASH"
    num2 0 "NTHASH"
    read -n 1 -s NUM
    case $NUM in
        1)
            AUTH="--local-auth"
            ;;
        2)
            AUTH=""
            ;;
    esac
    echo "|"
    printf "+${BLUE}usage${NC}: crackmapexec smb [target ...] [-u USERNAME [USERNAME ...]] [-H HASH [HASH ...]] [--local-auth]\n"
    cmd="${cmd} $SERVICE $TARGET -u $USERNAME -H '$HASH' $AUTH"
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

function cmd_crackmapexec5(){
    local cmd="" TARGET="" USERNAME="" PASSWORD="" HASH="" ANS=""
	clear
	figlet crackmapexec
    cmd="crackmapexec "
    printf "┌─(${PURPLE}$TITLE${NC})${RED}${USERNAME}@${HOSTNAME}${NC}:${RED}[1]Kali-tools-top10${NC} > ${YELLOW}[3]crackmapexec${NC} > ${PURPLE}[5]Brutefocing & Password Spraying${NC}\n"
    printf "+${BLUE}positional arguments${NC}:\n"
    printf "|  ${YELLOW}target${NC}      the target IP(s), range(s), CIDR(s), hostname(s), FQDN(s),\n"
    echo "|              file(s) containing a list of targets, NMap XML or .Nessus file(s)"
    read -e -p "> Input Target(subnet): " TARGET
    echo "|"
    echo "> Use which Service?"
    num1 0 "smb"
    num2 0 "ssh"
    num3 0 "winrm"
    num4 0 "ldap"
    num5 0 "mssql"
    read -n 1 -s NUM
    case $NUM in
    1)
        SERVICE="smb" ;;
    2)
        SERVICE="ssh" ;;
    3)
        SERVICE="winrm" ;;
    4)
        SERVICE="ldap" ;;
    5)
        SERVICE="mssql" ;;
    *)
        ;;
    esac
    printf "+${BLUE}options:${NC}\n"
    printf "|  ${YELLOW}-u USERNAME [USERNAME ...]${NC}\n"
    echo "|                        username(s) or file(s) containing usernames"
    read -e -p "> Input Username: " USERNAME
    echo "|"
    printf "|  ${YELLOW}-p PASSWORD [PASSWORD ...]${NC}\n"
    echo "|                        password(s) or file(s) containing passwords"
    printf "|  ${YELLOW}-H HASH [HASH ...], --hash HASH [HASH ...]${NC}\n"
    echo "|                        NTLM hash(es) or file(s) containing NTLM hashes"
    echo "> Password or HASH? " 
    num1 0 "Password"
    num2 0 "Hash"
    read -n 1 -s PASS_HASH
    if [ $PASS_HASH = 1 ];then
        read -e -p "> Input Password: " PASSWORD
        cmd="${cmd} $SERVICE $TARGET -u $USERNAME -p $PASSWORD"
    else
        read -e -p "> Input HASH(LMHASH:NTHASH|NTHASH): " HASH
        cmd="${cmd} $SERVICE $TARGET -u $USERNAME -H '$HASH'"
    fi
    echo "|"
    printf "+${BLUE}usage${NC}: crackmapexec smb [target ...] [-u USERNAME [USERNAME ...]] [[-p PASSWORD [PASSWORD ...]]|[-H HASH [HASH ...]]]\n"
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
