#!/bin/bash

source kp.conf

function menu_john(){
	clear
	figlet john
    num1 0 " Kali-tools-top10"
    num5 5 " john"
    num1 10 " Cracking_with_a_wordlist"
    num2 10 " Attempt_to_crack_hash_file" " using_previously_cracked_passwords"
    num3 10 " Show_cracked_passwords"
    num4 10 " Attempt_to_crack_hash_using_incremental_mode" " (May_take_a_long_time)"
	read -n 1 -s NUM
    case $NUM in
    1)
        cmd_john1
        ;;
    2)
        cmd_john2
        ;;
	3)
		cmd_john3
		;;
	4)
		cmd_john4
		;;
    *)
        ;;
    esac
}

function cmd_john1(){
    clear
    figlet john
    cmd="john "
    printf "┌─(${PURPLE}$TITLE${NC})${RED}`whoami`@`hostname`${NC}:${RED}[1]Kali-tools-top10${NC} > ${PURPLE}[5]$cmd${NC} > ${RED}[1]Cracking with a wordlist${NC}\n"
    printf "${BLUE}usage${NC} :john ${WHITE}[OPTIONS] [PASSWORD-FILES]${NC}\n"
    printf "${BLUE}Options${NC}:\n"
	echo "  --wordlist[=FILE] --stdin  Wordlist mode, read words from FILE or stdin"
	echo "                    --pipe   like --stdin, but bulk reads, and allows rules"
    printf "${RED}Example${NC}:  john --wordlist=<WORD_LIST_PATH> <HASH_LIST_FILE>\n"
    read -e -p "word list path: " WORD_LIST_PATH
    read -e -p "hash list path:" HASH_LIST_PATH
    cmd="${cmd} --wordlist=${WORD_LIST_PATH} ${HASH_LIST_PATH}"
    echo "└─Command? > $cmd"
    read -n 1 -p "You ready? y|n > " ANS
    echo ""
    if [ $ANS = "y" ] || [ $ANS = "y" ];then
        eval $cmd
    fi
}

function cmd_john2(){
    clear
    figlet john
    cmd="john "
    printf "┌─(${PURPLE}$TITLE${NC})${RED}`whoami`@`hostname`${NC}:${RED}[1]Kali-tools-top10${NC} > ${PURPLE}[5]$cmd${NC} > ${GREEN}[2]Hash Crack(using previously cracked passwords)${NC}\n"
    printf "${BLUE}usage${NC}: john ${WHITE}[OPTIONS] [PASSWORD-FILES]${NC}\n"
    printf "${BLUE}Options${NC}:\n"
	echo "  --loopback[=FILE]   Like --wordlist, but extract words from a .pot file"
    printf "${RED}Example${NC}:  john --loopback <HASH_LIST_FILE>\n"
    read -e -p "hash list path:" HASH_LIST_PATH
    cmd="${cmd} --loopback ${HASH_LIST_PATH}"
    echo "└─Command? > $cmd"
    read -n 1 -p "You ready? y|n > " ANS
    echo ""
    if [ $ANS = "y" ] || [ $ANS = "y" ];then
        eval $cmd
    fi
}

function cmd_john3(){
    clear
    figlet john
    cmd="john "
    printf "┌─(${PURPLE}$TITLE${NC})${RED}`whoami`@`hostname`${NC}:${RED}[1]Kali-tools-top10${NC} > ${PURPLE}[5]$cmd${NC} > ${YELLOW}[3]Show cracked passwords${NC}\n"
    printf "${BLUE}usage${NC}: john ${WHITE}[OPTIONS] [PASSWORD-FILES]${NC}\n"
    printf "${BLUE}Options${NC}:\n"
	echo "  --show[=left]              Show cracked passwords [if =left, then uncracked]"
    printf "${RED}Example${NC}:  john --show <HASH_LIST_FILE>\n"
    read -e -p "hash list path:" HASH_LIST_PATH
    cmd="${cmd} --show ${HASH_LIST_PATH}"
    echo "└─Command? > $cmd"
    read -n 1 -p "You ready? y|n > " ANS
    echo ""
    if [ $ANS = "y" ] || [ $ANS = "y" ];then
        eval $cmd
    fi
}

function cmd_john4(){
    clear
    figlet john
    cmd="john "
    printf "┌─(${PURPLE}$TITLE${NC})${RED}`whoami`@`hostname`${NC}:${RED}[1]Kali-tools-top10${NC} > ${PURPLE}[5]$cmd${NC} > ${BLUE}[4]Hash crack using incremental mode${NC}\n"
    printf "${BLUE}usage${NC}: john ${WHITE}[OPTIONS] [PASSWORD-FILES]${NC}\n"
    printf "${BLUE}Options${NC}:\n"
	echo "  --incremental[=MODE]       \"Incremental\" mode [using section MODE]"
    printf "${RED}Example${NC}:  john --incremental <HASH_LIST_FILE>\n"
    read -e -p "hash list path:" HASH_LIST_PATH
    cmd="${cmd} --incremental ${HASH_LIST_PATH}"
    echo "└─Command? > $cmd"
    read -n 1 -p "You ready? y|n > " ANS
    echo ""
    if [ $ANS = "y" ] || [ $ANS = "y" ];then
        eval $cmd
    fi
}

