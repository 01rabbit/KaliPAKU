#!/bin/bash

source kp.conf
source $MODULES_PATH/misc_module.sh

function side_menu(){
    while :; do
        if [ "$SIDE_ACT" == "EXIT" ];then
            tmux send-keys -t 2 "EXIT" C-m
            exit
        fi
        clear
        printf "${WHITE}NIST SP 800-115\n"
        printf "Technical Guide to Information Security Testing and Assessment${NC}\n"
        echo ""
        printf "${WHITE}Target Identification and Analysis Techniques${NC} \n"
        if [ "$SIDE_ACT" == "S1" ];then
            printf "${YELLOW}"
            tmux send-keys -t 2 "S1" C-m
        fi
        printf "1 Network Discovery${NC} \n"
        if [ "$SIDE_ACT" == "S2" ];then
            printf "${YELLOW}"
            tmux send-keys -t 2 "S2" C-m
        fi
        printf "2 Network Port and Service Identification${NC} \n"
        if [ "$SIDE_ACT" == "S3" ];then
            printf "${YELLOW}"
            tmux send-keys -t 2 "S3" C-m
        fi
        printf "3 Vulnerability Scanning${NC} \n"
        printf "${WHITE}Target Vulnerability Validation Techniques${NC} \n"
        if [ "$SIDE_ACT" == "S4" ];then
            printf "${YELLOW}"
            tmux send-keys -t 2 "S4" C-m
        fi
        printf "4 Password Cracking${NC} \n"
        printf "${WHITE}Penetration Testing${NC} \n"
        if [ "$SIDE_ACT" == "S5-1" ];then
            printf "${YELLOW}"
            tmux send-keys -t 2 "S5-1" C-m
        fi
        printf "5-1 Discovery Phase${NC} \n"
        if [ "$SIDE_ACT" == "S5-2" ];then
            printf "${YELLOW}"
            tmux send-keys -t 2 "S5-2" C-m
        fi
        printf "5-2 Attack Phase${NC} \n"
        printf "   - Gaining Access \n"
        printf "   - Escalating Privileges \n"
        printf "   - System Browsing \n"
        printf "   - Install Additional Tools \n"
        printf "${WHITE}Summary${NC} \n"
        if [ "$SIDE_ACT" == "S6" ];then
            printf "${YELLOW}"
        fi
        printf "6 Reporting${NC} \n"
        read SIDE_ACT
    done
}

function ctrl_message(){
    printf "${RED}+---+         ${GREEN}+---+         ${YELLOW}+---+         ${BLACK}+---+\n"
    printf "${RED}| 1 | Back    ${GREEN}| 2 | Next    ${YELLOW}| 3 | AutoRun ${BLACK}| 9 | Exit\n"
    printf "${RED}+---+         ${GREEN}+---+         ${YELLOW}+---+         ${BLACK}+---+${NC}\n"
}

function ctrl_message_top(){
    printf "              ${GREEN}+---+         ${YELLOW}+---+         ${BLACK}+---+\n"
    printf "              ${GREEN}| 2 | Next    ${YELLOW}| 3 | AutoRun ${BLACK}| 9 | Exit\n"
    printf "              ${GREEN}+---+         ${YELLOW}+---+         ${BLACK}+---+${NC}\n"
}

function ctrl_message_end(){
    printf "${RED}+---+                       ${YELLOW}+---+         ${BLACK}+---+\n"
    printf "${RED}| 1 | Back                  ${YELLOW}| 3 | AutoRun ${BLACK}| 9 | Exit\n"
    printf "${RED}+---+                       ${YELLOW}+---+         ${BLACK}+---+${NC}\n"
}

function under_message(){
    while :; do
        read MSG_ACT
        case $MSG_ACT in
        "S1")
            clear
            printf "In the KaliPAKU menu, enter the magic number \"${GREEN}1021${NC}\" and run nmap's \"${WHITE}Ping Scan${NC}\" to find the target host in the network. \n"
            ctrl_message_top
            read -n 1 -s STEP
            if [ $STEP == "9" ];then
                tmux send-keys -t 1 "EXIT" C-m
            elif [ $STEP == "3" ];then
                tmux send-keys -t 0 "1021" 
                tmux send-keys -t 1 "S1" C-m
                tmux select-pane -t 0
            elif [ $STEP == "2" ];then
                tmux send-keys -t 1 "S2" C-m
            else
                tmux send-keys -t 1 "S1" C-m
            fi
            ;;
        "S2")
            clear
            printf "In the KaliPAKU menu, enter the magic number \"${GREEN}1022${NC}\" and run nmap's \"${WHITE}Intense Scan${NC}\" to perform a port scan of the target host. \n"
            ctrl_message
            read -n 1 -s STEP
            if [ $STEP == "2" ];then
                tmux send-keys -t 1 "S3" C-m
            elif [ $STEP == "1" ];then
                tmux send-keys -t 1 "S1" C-m
            elif [ $STEP == "3" ];then
                tmux send-keys -t 0 "1022" 
                tmux send-keys -t 1 "S2" C-m
                tmux select-pane -t 0
            elif [ $STEP == "9" ];then
                tmux send-keys -t 1 "EXIT" C-m
            else
                tmux send-keys -t 1 "S2" C-m
            fi
            ;;
        "S3")
            clear
            printf "In the KaliPAKU menu, enter the magic number \"${GREEN}1025${NC}\" and run nmap's \"${WHITE}Vuln Scan${NC}\" to perform a vulnerability scan of the target host. \n"
            ctrl_message
            read -n 1 -s STEP
            if [ $STEP == "2" ];then
                tmux send-keys -t 1 "S4" C-m
            elif [ $STEP == "1" ];then
                tmux send-keys -t 1 "S2" C-m
            elif [ $STEP == "3" ];then
                tmux send-keys -t 0 "1025" 
                tmux send-keys -t 1 "S3" C-m
                tmux select-pane -t 0
            elif [ $STEP == "9" ];then
                tmux send-keys -t 1 "EXIT" C-m
            else
                tmux send-keys -t 1 "S3" C-m
            fi
            ;;
        "S4")
            clear
            printf "If you want to perform a \"${WHITE}Dictionary Attack${NC}\" or \"${WHITE}Password Spray Attack${NC}\" against a remote service, enter \"${GREEN}141${NC}\" or \"${GREEN}142${NC}\" in the KaliPAKU menu. \n"
            ctrl_message
            read -n 1 -s STEP
            if [ $STEP == "2" ];then
                tmux send-keys -t 1 "S5-1" C-m
            elif [ $STEP == "1" ];then
                tmux send-keys -t 1 "S3" C-m
            elif [ $STEP == "3" ];then
                tmux send-keys -t 0 "14" 
                tmux send-keys -t 1 "S4" C-m
                tmux select-pane -t 0
            elif [ $STEP == "9" ];then
                tmux send-keys -t 1 "EXIT" C-m
            else
                tmux send-keys -t 1 "S4" C-m
            fi
            ;;
        "S5-1")
            clear
            printf "If you want to get a foothold in the attack based on the information found so far, you can use \"${WHITE}Search Sploit${NC}\": go to the KaliPAKU menu and type in the magic number \"${GREEN}351${NC}\" \n"
            ctrl_message
            read -n 1 -s STEP
            if [ $STEP == "2" ];then
                tmux send-keys -t 1 "S5-2" C-m
            elif [ $STEP == "1" ];then
                tmux send-keys -t 1 "S4" C-m
            elif [ $STEP == "3" ];then
                tmux send-keys -t 0 "351" 
                tmux send-keys -t 1 "S5-1" C-m
                tmux select-pane -t 0
            elif [ $STEP == "9" ];then
                tmux send-keys -t 1 "EXIT" C-m
            else
                tmux send-keys -t 1 "S5-1" C-m
            fi
            ;;
        "S5-2")
            clear
            printf "In the attack phase, use \"${WHITE}Metasploit${NC}\": start metasploit by typing the magic number \"${GREEN}10111${NC}\" in the KaliPAKU menu and enter the necessary parameters. \n"
            ctrl_message_end
            read -n 1 -s STEP
            if [ $STEP == "9" ];then
                tmux send-keys -t 1 "EXIT" C-m
            elif [ $STEP == "3" ];then
                tmux send-keys -t 0 "10111" 
                tmux send-keys -t 1 "S5-2" C-m
                tmux select-pane -t 0
            elif [ $STEP == "1" ];then
                tmux send-keys -t 1 "S5-1" C-m
            else
                tmux send-keys -t 1 "S5-2" C-m
            fi
            ;;
        "EXIT")
            exit
            ;;
        esac
    done
}

if [ "$1" = "menu" ];then
    clear
    side_menu
elif [ "$1" = "message" ];then
    clear
    under_message
fi

