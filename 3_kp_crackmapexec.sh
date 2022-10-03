#!/bin/bash

source kp.conf

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
    read -n 1 -s NUM
    case $NUM in
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
        ;;
	esac
}

function cmd_crackmapexec1(){
	clear
	figlet crackmapexec
    cmd="crackmapexec "
    printf "┌─(${PURPLE}$TITLE${NC})${RED}`whoami`@`hostname`${NC}:${RED}[1]Kali-tools-top10${NC} > ${YELLOW}[3]$cmd${NC} > ${RED}[1]Target format(Basic)${NC}\n"
    printf "${BLUE}positional arguments${NC}:\n"
    echo "  target                the target IP(s), range(s), CIDR(s), hostname(s), FQDN(s), file(s) containing a list of targets, NMap XML or .Nessus file(s)"
    printf "${BLUE}usage${NC}: crackmapexec smb [target ...]\n"
    read -e -p "Target: " $TARGET
    cmd="${cmd} $TARGET"
    echo "└─Command? > $cmd"
    read -n 1 -p "You ready? y|n > " ANS
    echo ""
    if [ $ANS = "y" ] || [ $ANS = "y" ];then
        eval $cmd
    fi
}

function cmd_crackmapexec2(){
	clear
	figlet crackmapexec
    cmd="crackmapexec "
    printf "┌─(${PURPLE}$TITLE${NC})${RED}`whoami`@`hostname`${NC}:${RED}[1]Kali-tools-top10${NC} > ${YELLO}[3]$cmd${NC} > ${GREEN}[2]Null session${NC}\n"
    printf "${BLUE}positional arguments${NC}:\n"
    echo "  target                the target IP(s), range(s), CIDR(s), hostname(s), FQDN(s), file(s) containing a list of targets, NMap XML or .Nessus file(s)"
    printf "${BLUE}usage${NC}: crackmapexec smb [target ...] -u "" up ""\n"
    read -e -p "Target: " TARGET
    cmd="${cmd} $TARGET -u \"\" up \"\""
    echo "└─Command? > $cmd"
    read -n 1 -p "You ready? y|n > " ANS
    echo ""
    if [ $ANS = "y" ] || [ $ANS = "y" ];then
        eval $cmd
    fi
}

function cmd_crackmapexec3(){
	clear
	figlet crackmapexec
    cmd="crackmapexec "
    printf "┌─(${PURPLE}$TITLE${NC})${RED}`whoami`@`hostname`${NC}:${RED}[1]Kali-tools-top10${NC} > ${YELLOW}[3]$cmd${NC} > ${YELLOW}[3]Connect to target using local account${NC}\n"
    printf "${BLUE}positional arguments${NC}:\n"
    echo "  target                the target IP(s), range(s), CIDR(s), hostname(s), FQDN(s), file(s) containing a list of targets, NMap XML or .Nessus file(s)"
    printf "${BLUE}options:#{NC}\n"
    echo "  -u USERNAME [USERNAME ...]"
    echo "                        username(s) or file(s) containing usernames"
    echo "  -p PASSWORD [PASSWORD ...]"
    echo "                        password(s) or file(s) containing passwords"
    echo "  --local-auth          authenticate locally to each target"
    printf "${BLUE}usage${NC}: crackmapexec smb [target ...] [-u USERNAME [USERNAME ...]] [-p PASSWORD [PASSWORD ...]] [--local-auth]\n"
    read -e -p "Target: " $TARGET
    read -e -p "Username: " USERNAME
    read -e -p "Password: " PASSWORD
    cmd="${cmd} $TARGET -u $USERNAME -p $PASSWORD --local-auth"
    echo "└─Command? > $cmd"
    read -n 1 -p "You ready? y|n > " ANS
    echo ""
    if [ $ANS = "y" ] || [ $ANS = "y" ];then
        eval $cmd
    fi
}

function cmd_crackmapexec4(){
	clear
	figlet crackmapexec
    cmd="crackmapexec "
    printf "┌─(${PURPLE}$TITLE${NC})${RED}`whoami`@`hostname`${NC}:${RED}[1]Kali-tools-top10${NC} > ${YELLOW}[3]$cmd${NC} > ${BLUE}[4]Path the hash against a subnet${NC}\n"
    printf "${BLUE}positional arguments${NC}:\n"
    echo "  target                the target IP(s), range(s), CIDR(s), hostname(s), FQDN(s), file(s) containing a list of targets, NMap XML or .Nessus file(s)"
    printf "${BLUE}options:#{NC}\n"
    echo "  -u USERNAME [USERNAME ...]"
    echo "                        username(s) or file(s) containing usernames"
    echo "  -H HASH [HASH ...], --hash HASH [HASH ...]"
    echo "                        NTLM hash(es) or file(s) containing NTLM hashes"
    printf "${BLUE}usage${NC}: crackmapexec smb [target ...] [-u USERNAME [USERNAME ...]] [-H HASH [HASH ...]] [--local-auth]\n"
    read -e -p "Target(subnet): " TARGET
    read -e -p "Hash(LMHASH:NTHASH|NTHASH): " HASH
    echo "Hash Type:"
    echo "  1) LMHASH:NTHASH"
    echo "  2) NTHASH"
    read -n 1 -s NUM
    case $NUM in
        1)
            AUTH="--local-auth"
            ;;
        2)
            AUTH=""
            ;;
    esac
    cmd="${cmd} smb $TARGET -u $USERNAME -H '$HASH' $AUTH"
    echo "└─Command? > $cmd"
    read -n 1 -p "You ready? y|n > " ANS
    echo ""
    if [ $ANS = "y" ] || [ $ANS = "y" ];then
        eval $cmd
    fi
}

function cmd_crackmapexec5(){
	clear
	figlet crackmapexec
    printf "┌─(${PURPLE}$TITLE${NC})${RED}`whoami`@`hostname`${NC}:${RED}[1]Kali-tools-top10${NC} > ${YELLOW}[3]crackmapexec${NC} > ${PURPLE}[5]Brutefocing & Password Spraying${NC}\n"
    printf "${BLUE}positional arguments${NC}:\n"
    echo "  target                the target IP(s), range(s), CIDR(s), hostname(s), FQDN(s), file(s) containing a list of targets, NMap XML or .Nessus file(s)"
    printf "${BLUE}options:#{NC}\n"
    echo "  -u USERNAME [USERNAME ...]"
    echo "                        username(s) or file(s) containing usernames"
    echo "  -p PASSWORD [PASSWORD ...]"
    echo "                        password(s) or file(s) containing passwords"
    echo "  -H HASH [HASH ...], --hash HASH [HASH ...]"
    echo "                        NTLM hash(es) or file(s) containing NTLM hashes"
    printf "${BLUE}usage${NC}: crackmapexec smb [target ...] [-u USERNAME [USERNAME ...]] [[-p PASSWORD [PASSWORD ...]]|[-H HASH [HASH ...]]]\n"
    read -e -p "Target(subnet): " TARGET
    read -e -p "Username: " USERNAME
    read -n 1 -p "Use password? y|n >" PASS_HASH
    if [ $PASS_HASH = y ] || [ $PASS_HASH = "Y" ];then
        read -e -p "Password: " PASSWORD
        cmd="${cmd} $TARGET -u $USERNAME -p $PASSWORD"
    else
        read -e -p "Hash(LMHASH:NTHASH|NTHASH): " HASH
        cmd="${cmd} smb $TARGET -u $USERNAME -H '$HASH'"
    fi
    echo "└─Command? > $cmd"
    read -n 1 -p "You ready? y|n > " ANS
    echo ""
    if [ $ANS = "y" ] || [ $ANS = "y" ];then
        eval $cmd
    fi
}
