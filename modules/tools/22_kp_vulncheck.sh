#!/bin/bash

source kp.conf
source $MODULES_PATH/misc_module.sh

function menu_vulncheck(){
    clear
    figlet VulnCheck
    num2 0 " Tools"
    num2 5 " VulnCheck"
    num1 10 " Check"
    num9 10 " Back"
    read -n 1 -s NUM
    case $NUM in
    1)
        cmd_vulncheck
        ;;
    9)
        menu_tools
        ;;
    *)
        ;;
    esac

}

function cmd_vulncheck(){
    clear
    figlet Check Vulns
    printf "┌─(${PURPLE}$TITLE${NC})${RED}${USERNAME}@${HOSTNAME}${NC}:${GREEN}[2]Tools${NC} > ${GREEN}[2]VulnCheck${NC} > ${RED}[1]Check${NC}\n"
    printf "+${RED}Command${NC}:\n"
    printf "|  ${WHITE}vuln.sh${NC}  Auther:${WHITE}01rabbit${NC}\n"
    echo "|"
    printf "+${BLUE}Usage${NC}: vuln.sh [-h] [-d DIR| -f FILE] \n"
    echo "|"
    printf "+${BLUE}Options${NC}:\n"
    printf "|   ${YELLOW}-h${NC} : Shows usage.\n"
    printf "|   ${YELLOW}-d DIR${NC} : Examines nmap files in the specified directory.\n"
    printf "|   ${YELLOW}-f FILE${NC} : Examines the specified nmap file.\n"
    cmd="bash $TOOL_PATH/vuln.sh -d result"
    echo "└─Command > $cmd"
    echo ""
    echo "> You ready?"
    num1 0 "No"
    num2 0 "Yes"
    read -n 1 -s ANS
    if [ $ANS = "2" ];then
        show_number 221 "Check Vulns"
        tmux split-window -v
        tmux send-keys "${cmd};read;exit" C-m
        tmux select-pane -t "${TITLE}".0
        # eval $cmd
        # read
    else
        :
    fi

}
