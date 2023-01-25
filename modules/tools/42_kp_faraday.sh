#!/bin/bash

# source kp.conf
source ../../kp.conf
# source $MODULES_PATH/misc_module.sh
source ../misc_module.sh

function menu_faraday(){
    clear
    figlet Faraday
    num4 0 "Reports"
    num2 5 "faraday"
    num1 10 "open wab"
    num2 10 "faraday-cli"
    num9 10 "Back"
    read -n 1 -s NUM
    case $NUM in
    1)
        cmd_faraday1
        ;;
    2)
        cmd_faraday2
        ;;
    9)
        menu_reports
        ;;
    *)
        ;;
    esac

}

function cmd_faraday1(){
    clear
	figlet Faraday
    cmd="faraday"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}${USERNAME}@${HOSTNAME}${NC}:${BLUE}[4]Reports${NC} > ${GREEN}[2]faraday${NC} > ${RED}[1]faraday(web)${NC}\n"
    printf "|${RED}  ####  Caution!  ####${NC}\n"
    printf "|${RED}  Faraday ${WHITE}is a Web application. It can't be displayed on a remote console.\n"
    printf "|  If you want to continue with CUI, you can choose ${RED}faraday-cli.${NC}\n"
    echo "|"
    echo "└─Command > $cmd"
	echo ""
	echo "> You ready?"
	num1 0 "No"
	num2 0 "Yes"
    read -n 1 -s ANS
    if [ ! -z "$ANS" ];then
        if [ $ANS = "2" ];then
            show_number 421 "Faraday Web"
            tmux split-window -v
            tmux send-keys "sudo ${cmd};read;exit" C-m
            tmux select-pane -t "${TITLE}".0
            # eval $cmd
        else
            :
        fi
    else
        :
    fi
}
"""
Core
------------------------------------------------------------------------------------------------------
auth                  Authenticate with a faraday server                                              
exit                  exit the application. Shorthand: Ctrl-D.                                        
status                Show Cli status                                                                 
version               Faraday cli version                                                             

Objects
------------------------------------------------------------------------------------------------------
agent                 agent actions                                                                   
executive_report      executive_report actions                                                        
host                  host actions                                                                    
service               service actions                                                                 
tool                  tool actions                                                                    
vuln                  vulnerabilities actions                                                         
workspace             workspace actions                                                               

Stats
------------------------------------------------------------------------------------------------------
stats                 Different statistics about the information on Faraday                           

Uncategorized
------------------------------------------------------------------------------------------------------
help                  List available commands or provide detailed help for a specific command         
history               View, run, edit, save, or clear previously entered commands                     
quit                  Exit this application                                                           
set                   Set a settable parameter or show current settings of parameters 
"""

function cmd_faraday2(){
    clear
    figlet Faraday
    cmd="faraday-cli"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}${USERNAME}@${HOSTNAME}${NC}:${BLUE}[4]Reports${NC} > ${GREEN}[2]faraday${NC} > ${GREEN}[1]faraday-cli${NC}\n"
    printf "|\n"
    
}
menu_faraday