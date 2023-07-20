#!/bin/bash

source kp.conf
source $MODULES_PATH/misc_module.sh

function menu_john(){
	clear
	header
    num1 0 "Kali-tools-top10"
    num5 3 "john"
    num1 6 "Cracking_with_a_wordlist"
    num2 6 "Attempt_to_crack_hash_file" " using_previously_cracked_passwords"
    num3 6 "Show_cracked_passwords"
    num4 6 "Attempt_to_crack_hash_using_incremental_mode" " (May_take_a_long_time)"
    num5 6 "Manual"
    num9 6 "Back"
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
    5)
        cmd_john5
        ;;
    9)
        kalitoolstop10_menu1
        ;;
    *)
        ;;
    esac
}

function cmd_john1(){
    local cmd="" ANS="" WORD_LIST_PATH="" HASH_LIST_PATH=""
    clear
    figlet john
    cmd="john "
    printf "┌─(${PURPLE}$TITLE${NC})${RED}${USERNAME}@${HOSTNAME}${NC}:${RED}[1]Kali-tools-top10${WHITE} > [5]$cmd > [1]Cracking with a wordlist${NC}\n"
    printf "+${BLUE}Options${NC}:\n"
	printf "|  ${YELLOW}--wordlist[=FILE] --stdin${NC}  Wordlist mode, read words from FILE or stdin\n"
	printf "|                    ${YELLOW}--pipe${NC}   like --stdin, but bulk reads, and allows rules\n"
    echo "> Original Wordlist or Default?"
    num1 0 "Original"
    num2 0 "Default"
    read -n 1 -s ANS
    if [ $ANS = 1 ];then
        read -e -p "> Enter the path to the original word list: " WORD_LIST_PATH
    else
        echo "> Use Default Wordlist Path"
        WORD_LIST_PATH="rockyou.txt"
    fi
    echo "|"
    read -e -p "> Enter the HASH list path:" HASH_LIST_PATH
    echo "|"
    # printf "${RED}Example${NC}:  john --wordlist=<WORD_LIST_PATH> <HASH_LIST_FILE>\n"
    printf "+${BLUE}usage${NC} :john ${WHITE}[OPTIONS] [PASSWORD-FILES]${NC}\n"
    cmd="${cmd} --wordlist=${WORD_LIST_PATH} ${HASH_LIST_PATH}"
    echo "└─Command > $cmd"
    echo ""
    echo "> You ready?"
    num1 0 "No"
    num2 0 "Yes"
    read -n 1 -s ANS
    if [ ! -z "$ANS" ];then
        if [ $ANS = "2" ];then
            show_number 151 "john with_wordlist"
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

function cmd_john2(){
    local cmd="" ANS="" HASH_LIST_PATH=""
    clear
    figlet john
    cmd="john "
    printf "┌─(${PURPLE}$TITLE${NC})${RED}${USERNAME}@${HOSTNAME}${NC}:${RED}[1]Kali-tools-top10${WHITE} > [5]$cmd${NC} > [2]Hash Crack(using previously cracked passwords)${NC}\n"
    printf "+${BLUE}Options${NC}:\n"
	printf "|  ${YELLOW}--loopback[=FILE]${NC}   Like --wordlist, but extract words from a .pot file\n"
    read -e -p "> Enter the HASH list path:" HASH_LIST_PATH
    echo "|"
    # printf "${RED}Example${NC}:  john --loopback <HASH_LIST_FILE>\n"
    printf "+${BLUE}usage${NC}: john ${WHITE}--loopback [PASSWORD-FILES]${NC}\n"
    cmd="${cmd} --loopback ${HASH_LIST_PATH}"
    echo "└─Command > $cmd"
    echo ""
    echo "> You ready?"
    num1 0 "No"
    num2 0 "Yes"
    read -n 1 -s ANS
    if [ ! -z "$ANS" ];then
        if [ $ANS = "2" ];then
            show_number 152 "john crack_hash"
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

function cmd_john3(){
    local cmd="" ANS="" HASH_LIST_PATH=""
    clear
    figlet john
    cmd="john "
    printf "┌─(${PURPLE}$TITLE${NC})${RED}${USERNAME}@${HOSTNAME}${NC}:${RED}[1]Kali-tools-top10${WHITE} > [5]$cmd > [3]Show cracked passwords${NC}\n"
    printf "+${BLUE}Options${NC}:\n"
	printf "|  ${YELLOW}--show[=left]${NC}              Show cracked passwords [if =left, then uncracked]\n"
    read -e -p "Enter the HASH list path:" HASH_LIST_PATH
    echo "|"
    # printf "${RED}Example${NC}:  john --show <HASH_LIST_FILE>\n"
    printf "+${BLUE}usage${NC}: john ${WHITE}--show [PASSWORD-FILES]${NC}\n"
    cmd="${cmd} --show ${HASH_LIST_PATH}"
    echo "└─Command > $cmd"
    echo ""
    echo "> You ready?"
    num1 0 "No"
    num2 0 "Yes"
    read -n 1 -s ANS
    if [ ! -z "$ANS" ];then
        if [ $ANS = "2" ];then
            show_number 153 "john Show_passwords"
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

function cmd_john4(){
    local cmd="" ANS="" HASH_LIST_PATH=""
    clear
    figlet john
    cmd="john "
    printf "┌─(${PURPLE}$TITLE${NC})${RED}${USERNAME}@${HOSTNAME}${NC}:${RED}[1]Kali-tools-top10${WHITE} > [5]$cmd > [4]Hash crack using incremental mode${NC}\n"
    printf "+${BLUE}Options${NC}:\n"
	printf "|  ${YELLOW}--incremental[=MODE]${NC}       \"Incremental\" mode [using section MODE]\n"
    read -e -p "Enter the HASH list path:" HASH_LIST_PATH
    # printf "${RED}Example${NC}:  john --incremental <HASH_LIST_FILE>\n"
    printf "+${BLUE}usage${NC}: john ${WHITE}--incremental [PASSWORD-FILES]${NC}\n"
    cmd="${cmd} --incremental ${HASH_LIST_PATH}"
    echo "└─Command > $cmd"
    echo ""
    echo "> You ready?"
    num1 0 "No"
    num2 0 "Yes"
    read -n 1 -s ANS
    if [ ! -z "$ANS" ];then
        if [ $ANS = "2" ];then
            show_number 154 "john incremental_mode"
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

function cmd_john5(){
    local cmd=""
    clear
    show_number 155 "john Manual"
    figlet john
    cmd="john "
    printf "┌─(${PURPLE}$TITLE${NC})${RED}${USERNAME}@${HOSTNAME}${NC}:${RED}[1]Kali-tools-top10${WHITE} > [5]$cmd > [5]Manual${NC}\n"
    printf "+${BLUE}Options${NC}:\n"
	printf "|  ${YELLOW}--wordlist[=FILE] --stdin${NC}  Wordlist mode, read words from FILE or stdin\n"
	printf "|                    ${YELLOW}--pipe${NC}   like --stdin, but bulk reads, and allows rules\n"
	printf "|  ${YELLOW}--loopback[=FILE]${NC}   Like --wordlist, but extract words from a .pot file\n"
	printf "|  ${YELLOW}--show[=left]${NC}              Show cracked passwords [if =left, then uncracked]\n"
	printf "|  ${YELLOW}--incremental[=MODE]${NC}       \"Incremental\" mode [using section MODE]\n"
    printf "+${BLUE}usage${NC}: john ${WHITE} [OPTIONS] [PASSWORD-FILES]\n"
    read -e -p "└─Command > " cmd
    tmux split-window -v
    tmux send-keys "${cmd};read;exit" C-m
    tmux select-pane -t "${TITLE}".0
    # eval $cmd
}