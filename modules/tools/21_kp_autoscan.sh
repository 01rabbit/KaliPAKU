#!/bin/bash

source kp.conf
source $MODULES_PATH/misc_module.sh

function menu_autoscan(){
    clear
    figlet AutoScan
    num2 0 " Tools"
    num1 5 " AutoScan"
    num1 10 " Install"
    num2 10 " Scan"
    num9 10 " Back"
    read -n 1 -s NUM
    case $NUM in
    1)
        install_autoscan
        ;;
    2)
        cmd_autoscan1
        ;;
    9)
        menu_tools
        ;;
    *)
        ;;
    esac
}

function install_autoscan(){
    clear
    figlet AutoScan
    cd $TOOL_PATH
    printf "┌─(${PURPLE}$TITLE${NC})${RED}${USERNAME}@${HOSTNAME}${NC}:${GREEN}[2]Tools${NC} > ${RED}[1]AutoScan${NC} > ${RED}[1]Install${NC}\n"
    if ! which git ;then
        printf "|${RED}  ####  Caution!  ####${NC}\n"
        printf "|${WHITE}  git is not installed. Stop work.${NC}\n"
    else
        printf "+${BLUE}Install${NC}\n"
        echo "|  Clone nmapAutomator..."
        git clone https://github.com/21y4d/nmapAutomator.git
        if ! which ffuf ;then
            sudo apt update
            sudo apt install ffuf -y
        fi
        if ! which gobuster ;then
            sudo apt update-alternatives
            sudo apt install gobuster -y
        fi
        echo "└─Command > Complete"
    fi
    # finaly
    cd ../../
}

function cmd_autoscan1(){
    clear
    figlet AutoScan
    printf "┌─(${PURPLE}$TITLE${NC})${RED}${USERNAME}@${HOSTNAME}${NC}:${GREEN}[2]Tools${NC} > ${RED}[1]AutoScan${NC} > ${GREEN}[2]Scan${NC}\n"
    printf "+${RED}Command${NC}:\n"
    printf "|  ${WHITE}nmapAutomator.sh${NC}  Auther:${WHITE}21y4d${NC}  https://github.com/21y4d/nmapAutomator\n"
    echo "|"
    printf "+${BLUE}Optional${NC}: [-r/--remote <REMOTE MODE>] [-d/--dns <DNS SERVER>] [-o/--output <OUTPUT DIRECTORY>]\n"
    printf "|          [-s/--static-nmap <STATIC NMAP PATH>]\n"
    echo "|"
    printf "+${BLUE}Scan Types${NC}:\n"
    printf "|   ${YELLOW}[1]Network${NC} : Shows all live hosts in the host's network (~15 seconds)\n"
    printf "|   ${YELLOW}[2]Port${NC}    : Shows all open ports (~15 seconds)\n"
    printf "|   ${YELLOW}[3]Script${NC}  : Runs a script scan on found ports (~5 minutes)\n"
    printf "|   ${YELLOW}[4]Full${NC}    : Runs a full range port scan, then runs a script scan on new ports (~5-10 minutes)\n"
    num1 0 "Network"
    num2 0 "Port"
    num3 0 "Script"
    num4 0 "Full"
    num0 0 "Next"
    num9 0 "Back"
    read -n 1 -s NUM
    case $NUM in
    1)
        cmd="$AUTOSCAN_PATH/nmapAutomator.sh -t Network"
        ;;
    2)
        cmd="$AUTOSCAN_PATH/nmapAutomator.sh -t Port"
        ;;
    3)
        cmd="$AUTOSCAN_PATH/nmapAutomator.sh -t Script"
        ;;
    4)
        cmd="$AUTOSCAN_PATH/nmapAutomator.sh -t Full"
        ;;
    0)
        cmd_autoscan2
        ;;
    9)
        menu_autoscan
        ;;
    *)
        ;;
    esac
    read -e -p "> Input Target: " TARGET
    echo "|"
    cmd="$cmd -H $TARGET -o result/$TARGET"
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

function cmd_autoscan2(){
    clear
    figlet AutoScan
    printf "┌─(${PURPLE}$TITLE${NC})${RED}${USERNAME}@${HOSTNAME}${NC}:${GREEN}[2]Tools${NC} > ${RED}[1]AutoScan${NC} > ${GREEN}[2]Scan${NC}\n"
    printf "+${RED}Command${NC}:\n"
    printf "|  ${WHITE}nmapAutomator.sh${NC}  Auther:${WHITE}21y4d${NC}  https://github.com/21y4d/nmapAutomator\n"
    echo "|"
    printf "+${BLUE}Optional${NC}: [-r/--remote <REMOTE MODE>] [-d/--dns <DNS SERVER>] [-o/--output <OUTPUT DIRECTORY>]\n"
    printf "|          [-s/--static-nmap <STATIC NMAP PATH>]\n"
    echo "|"
    printf "+${BLUE}Scan Types${NC}:\n"
    printf "|   ${YELLOW}[1]UDP${NC}     : Runs a UDP scan \"requires sudo\" (~5 minutes)\n"
    printf "|   ${YELLOW}[2]Vulns${NC}   : Runs CVE scan and nmap Vulns scan on all found ports (~5-15 minutes)\n"
    printf "|   ${YELLOW}[3]Recon${NC}   : Suggests recon commands, then prompts to automatically run them\n"
    printf "|   ${YELLOW}[4]All${NC}     : Runs all the scans (~20-30 minutes)\n"
    num1 0 "UDP"
    num2 0 "Vulns"
    num3 0 "Recon"
    num4 0 "All"
    num0 0 "Next"
    num9 0 "Back"
    read -n 1 -s NUM
    case $NUM in
    1)
        cmd="$AUTOSCAN_PATH/nmapAutomator.sh -t UDP"
        ;;
    2)
        cmd="$AUTOSCAN_PATH/nmapAutomator.sh -t Vulns"
        ;;
    3)
        cmd="$AUTOSCAN_PATH/nmapAutomator.sh -t Recon"
        ;;
    4)
        cmd="$AUTOSCAN_PATH/nmapAutomator.sh -t All"
        ;;
    0)
        cmd_autoscan1
        ;;
    9)
        menu_autoscan
        ;;
    *)
        ;;
    esac
    read -e -p "> Input Target: " TARGET
    echo "|"
    cmd="$cmd -H $TARGET -o result/$TARGET"
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