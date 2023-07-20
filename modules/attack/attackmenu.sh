#!/bin/bash

source kp.conf
source $MODULES_PATH/misc_module.sh
source $TOP10_PATH/3_kp_crackmapexec.sh
source $TOP10_PATH/6_kp_metasploit.sh
source $ATTACK_PATH/31_kp_setoolkit.sh
source $ATTACK_PATH/32_kp_msfpc.sh
source $ATTACK_PATH/33_kp_searchsploit.sh
source $ATTACK_PATH/34_kp_wifite.sh

function menu_attack(){
    clear
	header
    num3 0 "Attack"
    num1 3 "Exploit" " (Metasploit)"
    num2 3 "Social-Engineering" " (setoolkit)"
    num3 3 "Brute-force" " (crackmapexec)"
    num4 3 "Payload_Creator" " (msfpc)"
    num5 3 "Search Exploit" " (searchsploit)"
    num6 3 "Wi-Fi Attack" " (wifite)"
    num9 3 " Main"
    read -n 1 -s n
    case $n in
    1)
        menu_metasploit
        ;;
    2)
        menu_setoolkit
        ;;
    3)
        menu_crackmapexec
        ;;
    4)
        menu_msfpc
        ;;
    5)
        menu_searchsploit
        ;;
    6)
        menu_wifite
        ;;
    9)
        mainmenu
        ;;
    *)
        ;;
    esac
}