#!/bin/bash

source kp.conf
source $MODULES_PATH/misc_module.sh
source $TOP10_PATH/3_kp_crackmapexec.sh
source $TOP10_PATH/6_kp_metasploit.sh
source $ATTACK_PATH/31_kp_setoolkit.sh
source $ATTACK_PATH/32_kp_msfpc.sh
source $ATTACK_PATH/33_kp_searchsploit.sh

function menu_attack(){
    clear
    figlet Attack
    num3 0 " Attack"
    num1 5 " Exploit" " (Metasploit)"
    num2 5 " Social-Engineering" " (setoolkit)"
    num3 5 " Brute-force" " (crackmapexec)"
    num4 5 " Payload_Creator" " (msfpc)"
    num5 5 " Search Exploit" " (searchsploit)"
    num9 5 " Main"
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
    9)
        mainmenu
        ;;
    *)
        ;;
    esac
}