#!/bin/bash

source kp.conf
source $MODULES_PATH/misc_module.sh

function menu_gobuster() {
    clear
    figlet gobuster
    num2 0 "Tools"
    num3 3 "gobuster"
    num1 6 "Install"
    num2 6 "Directory/File Enumeration"
    num3 6 "DNS subdomain Enumeration"
    num9 6 "Back"
    read -n 1 -s NUM
    case $NUM in
    1)
        install_gobuster
        ;;
    2)
        cmd_gobuster1
        ;;
    3)
        cmd_gobuster2
        ;;
    9)
        menu_tools
        ;;
    *)
        ;;
    esac
}

function install_gobuster() {
    clear
    figlet gobuster
    printf "┌─(${PURPLE}$TITLE${NC})${RED}${USERNAME}@${HOSTNAME}${NC}:${GREEN}[2]Tools${NC} > ${YELLOW}[3]gobuster${NC} > ${RED}[1]Install${NC}\n"
    echo ">Install gobuster. Are you ready?"
    num1 0 "No"
    num2 0 "Yes"
    read -n 1 -s ANS
    if [ ! -z "$ANS" ];then
        if [ $ANS = "2" ];then
            show_number 231 "gobuster Install"
            if ! which gobuster ;then
                sudo apt update
                sudo apt install gobuster -y
                sleep 1
            fi
            echo "└─Command > Complete"
        else
            :
        fi
    else
        :
    fi
}

function cmd_gobuster1(){
    clear
    figlet gobuster
    printf "┌─(${PURPLE}$TITLE${NC})${RED}${USERNAME}@${HOSTNAME}${NC}:${GREEN}[2]Tools${NC} > ${YELLOW}[3]gobuster${NC} > ${GREEN}[2]Directory/File Enumeration${NC}\n"
    printf "+${BLUE}Available Commands:${NC}:\n"
    printf "|  ${YELLOW}dir${NC}:                               Uses directory/file enumeration mode\n"
    printf "+${BLUE}Flags:${NC}:\n"
    printf "|  ${YELLOW}-u, --url string${NC}:                  The target URL\n"
    printf "|  ${YELLOW}-w, --wordlist string${NC}:             Path to the wordlist\n"
    printf "|  ${YELLOW}-x, --extensions string${NC}:           File extension(s) to search for\n"
    read -p "> Enter Target URL: " TARGET
    echo "|"
    echo "> Select Wordlist"
    printf "|  ${YELLOW}[1]/usr/share/dirb/wordlists/common.txt${NC} \n"
    printf "|  ${YELLOW}[2]/usr/share/dirb/wordlists/big.txt${NC} \n"
    printf "|  ${YELLOW}[3]/usr/share/dirbuster/wordlists/directory-list-2.3-small.txt${NC} \n"
    printf "|  ${YELLOW}[4]/usr/share/dirbuster/wordlists/directory-list-2.3-medium.txt${NC} \n"
    read -p "> Select ${YELLOW}1${NC}-${YELLOW}4${NC}: " NUM
    case $NUM in
    1)
        WORDLIST="/usr/share/dirb/wordlists/common.txt"
        ;;
    2)
        WORDLIST="/usr/share/dirb/wordlists/big.txt"
        ;;
    3)
        WORDLIST="/usr/share/dirbuster/wordlists/directory-list-2.3-small.txt"
        ;;
    4)
        WORDLIST="/usr/share/dirbuster/wordlists/directory-list-2.3-medium.txt"
        ;;
    *)
        WORDLIST="/usr/share/dirb/wordlists/common.txt"
        ;;
    esac
    echo "|"
    cmd="gobuster dir -u $TARGET -w $WORDLIST"
    echo "> Do you want to specify a file extension?"
    num1 0 "No"
    num2 0 "Yes"
    read -n 1 -s ANS
    if [ ! -z "$ANS" ];then
        if [ $ANS = "2" ];then
            read -p "> Enter the extension. If multiple extensions are specified, separate them with commas:" EXTENSION
            cmd="$cmd -x $EXTENSION"
        else
            :
        fi
    else
        :
    fi
    echo "└─Command > $cmd"
    echo ""
    echo "> You ready?"
    num1 0 "No"
    num2 0 "Yes"
    read -n 1 -s ANS
    if [ ! -z "$ANS" ];then
        show_number 232 "gobuster Dir/File Enum"
        tmux split-window -v
        tmux send-keys "${cmd};read;exit" C-m
        tmux select-pane -t "${TITLE}".0

        # eval $cmd
    else
        :
    fi

}