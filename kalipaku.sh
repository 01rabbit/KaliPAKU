#!/bin/bash

source kp.conf
source $TOP10_PATH/1_kp_wifite.sh
source $TOP10_PATH/2_kp_burpsuite.sh
source $TOP10_PATH/3_kp_crackmapexec.sh
source $TOP10_PATH/4_kp_hydra.sh
source $TOP10_PATH/5_kp_john.sh
source $TOP10_PATH/6_kp_metasploit.sh
source $TOP10_PATH/7_kp_nmap.sh
source $TOP10_PATH/8_kp_responder.sh
source $TOP10_PATH/9_kp_sqlmap.sh
source $TOP10_PATH/10_kp_wireshark.sh
source $TOOL_PATH/21_kp_autoscan.sh
source $TOOL_PATH/22_kp_vulncheck.sh
source $TOOL_PATH/31_kp_setoolkit.sh
source $TOOL_PATH/32_kp_msfpc.sh
source $TOOL_PATH/33_kp_searchsploit.sh
source $TOP10_PATH/top10menu.sh
source $MODULES_PATH/misc_module.sh
source $TOOL_PATH/toolsmenu.sh
source $TOOL_PATH/attackmenu.sh


function mainmenu(){
	clear
	figlet KaliPAKU
    num1 0 "Kali-tools-top10"
    num2 0 "Tools"
    num3 0 "Attack"
    num9 0 "Exit"
    read -n 1 -s n
    case $n in
    1)
        kalitoolstop10_menu1
        ;;
    2)
        menu_tools
        ;;
    3)
        menu_attack
        ;;
    9)
        exit 0
        ;;
    *)
        ;;
    esac
    unset NUM
}

function whiptail_menu(){
    var=$(whiptail --title "SmartMenu" --backtitle "${TITLE}" --menu "Simple Smart Menu" 0 0 0 \
    1 "kp_wifite        Wi-Fi Attack" \
    2 "kp_burpsuite     Local Web Proxy"\
    3 "kp_crackmapexec  Post Exploitation Tool"\
    4 "kp_hydra         Online Password Crack" \
    5 "kp_john          Offline Password Crack" \
    6 "kp_metasploit    Exploit Tool" \
    7 "kp_nmap          Port Scanner" \
    8 "kp_responder     NBT-NS,LLMNR MDNS Responder"\
    9 "kp_sqlmap        Automatic SQL injection tool"\
    10 "kp_wireshark     Packet Scanner" \
    11 "kp_autoscan      nmapAutomator" \
    12 "kp_vulncheck     Vulnerability Check" \
    13 "kp_setoolkit     Social Engineering Tool" \
    14 "kp_msfpc         Payload Creator" \
    15 "kp_searchsploit  Search Exploit Code" \
    3>&1 1>&2 2>&3 )
    case $var in
    1) menu_wifite ;;
    2) cmd_burpsuite ;;
    3) menu_crackmapexec ;;
    4) menu_hydra ;;
    5) menu_john ;;
    6) menu_metasploit ;;
    7) menu_nmap ;;
    8) menu_responder ;;
    9) menu_sqlmap ;;
    10) cmd_wireshark ;;
    11) menu_autoscan ;;
    12) menu_vulncheck ;;
    13) menu_setoolkit ;;
    14) menu_msfpc ;;
    15) menu_searchsploit ;;
    esac
}
set -o emacs
bind -x '"\t":"whiptail_menu"'

# Rockyou Check
FILE="rockyou.txt"

if [ ! -e $FILE ];then
    cp /usr/share/wordlists/rockyou.txt.gz .
    if [ -e "rockyou.txt.gz" ];then
        gunzip rockyou.txt.gz
    fi
fi

# Banner
clear
banner
read -t 1
clear

while :;do
	printf "┌─(${PURPLE}${TITLE}${NC})${RED}${USER}@${HOSTNAME}${NC}:${BLUE}`pwd`${NC}\n"
	read -e -p "└─Command? > " str
    case $str in
    "kp"|"k"|"pakuri"|"kalipakuri"|"menu"|5963)
		mainmenu
        ;;
	"exit"|"q"|"quit")
		exit 0
        ;;
	*)
		eval $str
        ;;
    esac
done
