#!/usr/bin/bash

source kp.conf
source $MODULES_PATH/misc_module.sh

function menu_searchsploit(){
    clear
    figlet SearchSploit
    num3 0 "Attack"
    num5 3 "Search_Exploit" " (searchsploit)"
    num1 6 "Search"
    num2 6 "Automatic_Search" " (Miscellaneous_Automation)"
    num9 6 "Back"
    read -n 1 -s NUM
    case $NUM in
    1)
        cmd_search
        ;;
    2)
        cmd_autosearch
        ;;
    9)
        menu_attack
        ;;
    *)
        ;;
    esac
}

function cmd_search(){
    clear
    figlet SearchSploit
    cmd="searchsploit"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}${USER}@${HOSTNAME}${NC}:${YELLOW}[3]Attack${NC} > ${PURPLE}[5]Search_Exploit${NC} > ${RED}[1]Search${NC}\n"
    printf "+${BLUE}Options${NC}:\n"
    printf "|  ${YELLOW}-t${NC}, ${YELLOW}--title${NC}    [Term]      Search JUST the exploit title (Default is title AND the file's path)\n"
    echo "|"
    printf "+${RED}Example${NC}:\n"
    echo "|  searchsploit afd windows local"
    echo "|"
    read -p  "> Enter Search Word: " WORD
    cmd="${cmd} -t ${WORD}"
    echo "└─Command > $cmd"
    echo ""
    echo "> You ready?"
    num1 0 "No"
    num2 0 "Yes"
    echo ""
    read -n 1 -s ANS
    if [ ! -z "$ANS" ];then
        if [ $ANS = "2" ];then
            show_number 351 "searchsploit Search"
            eval $cmd
            cmd_copypaste
        else
            :
        fi
    else
        :
    fi
}

function cmd_copypaste(){
    cmd="searchsploit"
    echo ""
    printf "+${BLUE}Options${NC}:\n"
    printf "|  ${YELLOW}-m${NC}, ${YELLOW}--mirror${NC}   [EDB-ID]    Mirror (aka copies) an exploit to the current working directory\n"
    printf "|  ${YELLOW}-x${NC}, ${YELLOW}--examine${NC}  [EDB-ID]    Examine (aka opens) the exploit using PAGER\n"
    echo "> Copy or Open?"
    num1 0 "Copy"
    num2 0 "Open"
    read -n 1 -s ANS
    echo "|"
    if [ ! -z $ANS ];then
        if [ $ANS = "1" ];then
            echo "> === Copy Exploit Code ==="
            printf "> ${YELLOW}Copy and paste${NC} the path shown next to the exploit title.\n"
            read -e -p "> Enter path: " EXPLOITPATH
            cmd="${cmd} -m ${EXPLOITPATH}"
        else
            echo "> === Open Exploit Code ==="
            printf "> ${YELLOW}Copy and paste${NC} the path shown next to the exploit title.\n"
            read -e -p "> Enter path: " EXPLOITPATH
            cmd="${cmd} -x ${EXPLOITPATH}"
        fi
    fi
    echo "└─Command > $cmd"
    echo ""
    echo "> You ready?"
    num1 0 "No"
    num2 0 "Yes"
    echo ""
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

function cmd_autosearch(){
    clear
    figlet SearchSploit
    cmd="searchsploit"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}${USER}@${HOSTNAME}${NC}:${YELLOW}[3]Attack${NC} > ${PURPLE}[5]Search_Exploit${NC} > ${GREEN}[2]AutoSearch${NC}\n"
    printf "+${BLUE}Options${NC}:\n"
    printf "|  ${YELLOW}--nmap${NC}     [file.xml]  Checks all results in Nmap's XML output with service version\n"
    echo "|"
    read -e -p "> Enter the path to Nmap's XML output file: " EXPLOITPATH
    cmd="${cmd} --nmap ${EXPLOITPATH}"
    echo "└─Command > $cmd"
    echo ""
    echo "> You ready?"
    num1 0 "No"
    num2 0 "Yes"
    read -n 1 -s ANS
    if [ ! -z "$ANS" ];then
        if [ $ANS = "2" ];then
            show_number 352 "searchsploit Automatic_Search"
            eval $cmd
        else
            :
        fi
    else
        :
    fi

}

