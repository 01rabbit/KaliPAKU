#!/bin/bash

source kp.conf

function menu_john(){
	clear
	figlet john
	printf "${WHITE}+---+\n"
	printf "| 1 |%s\n" " Kali-tools-top10"
	printf "+---+\n"
	printf "${BLUE}%5s+---+\n"
	printf "%5s| 5 |%s\n" "" " john"
	printf "%5s+---+\n"
	printf "${WHITE}%10s+---+\n"
	printf "%10s| 1 |%s\n" "" " Cracking with a wordlist"
	printf "%10s+---+%s\n"
    printf "%10s+---+\n"
    printf "%10s| 2 |%s\n" "" " Attempt to crack hash file"
    printf "%10s+---+%s\n" "" " using previously cracked passwords"
    printf "%10s+---+\n"
    printf "%10s| 3 |%s\n" "" " Show cracked passwords"
    printf "%10s+---+%s\n"
    printf "%10s+---+\n"
    printf "%10s| 4 |%s\n" "" " Attempt to crack hash using incremental mode"
    printf "%10s+---+%s${NC}\n" "" " (May take a long time)"
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
    printf "${BLUE}usage${NC} :john ${WHITE}[OPTIONS] [PASSWORD-FILES]${NC}\n"
    printf "${BLUE}Options${NC}:\n"
	echo "  --wordlist[=FILE] --stdin  Wordlist mode, read words from FILE or stdin"
	echo "                    --pipe   like --stdin, but bulk reads, and allows rules"
    printf "${RED}Example${NC}:  john --wordlist=<WORD_LIST_PATH> <HASH_LIST_FILE>\n"
    read -e -p "word list path: " WORD_LIST_PATH
    read -e -p "hash list path:" HASH_LIST_PATH
    cmd="john "
    printf "┌─(${PURPLE}$TITLE${NC})${RED}`whoami`@`hostname`${NC}:${BLUE}[1]Kali-tools-top10${NC} > ${BLUE}[5]$cmd${NC} > ${BLUE}[1]Cracking with a wordlist${NC}\n"
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
    printf "${BLUE}usage${NC}: john ${WHITE}[OPTIONS] [PASSWORD-FILES]${NC}\n"
    printf "${BLUE}Options${NC}:\n"
	echo "  --loopback[=FILE]   Like --wordlist, but extract words from a .pot file"
    printf "${RED}Example${NC}:  john --loopback <HASH_LIST_FILE>\n"
    read -e -p "hash list path:" HASH_LIST_PATH
    cmd="john "
    printf "┌─(${PURPLE}$TITLE${NC})${RED}`whoami`@`hostname`${NC}:${BLUE}[1]Kali-tools-top10${NC} > ${BLUE}[5]$cmd${NC} > ${BLUE}[2]Hash Crack(using previously cracked passwords)${NC}\n"
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
    printf "${BLUE}usage${NC}: john ${WHITE}[OPTIONS] [PASSWORD-FILES]${NC}\n"
    printf "${BLUE}Options${NC}:\n"
	echo "  --show[=left]              Show cracked passwords [if =left, then uncracked]"
    printf "${RED}Example${NC}:  john --show <HASH_LIST_FILE>\n"
    read -e -p "hash list path:" HASH_LIST_PATH
    cmd="john "
    printf "┌─(${PURPLE}$TITLE${NC})${RED}`whoami`@`hostname`${NC}:${BLUE}[1]Kali-tools-top10${NC} > ${BLUE}[5]$cmd${NC} > ${BLUE}[3]Show cracked passwords${NC}\n"
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
    printf "${BLUE}usage${NC}: john ${WHITE}[OPTIONS] [PASSWORD-FILES]${NC}\n"
    printf "${BLUE}Options${NC}:\n"
	echo "  --incremental[=MODE]       \"Incremental\" mode [using section MODE]"
    printf "${RED}Example${NC}:  john --incremental <HASH_LIST_FILE>\n"
    read -e -p "hash list path:" HASH_LIST_PATH
    cmd="john "
    printf "┌─(${PURPLE}$TITLE${NC})${RED}`whoami`@`hostname`${NC}:${BLUE}[1]Kali-tools-top10${NC} > ${BLUE}[5]$cmd${NC} > ${BLUE}[4]Hash crack using incremental mode${NC}\n"
    cmd="${cmd} --incremental ${HASH_LIST_PATH}"
    echo "└─Command? > $cmd"
    read -n 1 -p "You ready? y|n > " ANS
    echo ""
    if [ $ANS = "y" ] || [ $ANS = "y" ];then
        eval $cmd
    fi
}

