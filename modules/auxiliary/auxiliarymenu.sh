#!/bin/bash

source kp.conf
source $MODULES_PATH/misc_module.sh
source $AUXILIARY_PATH/51_kp_undercover.sh
source $AUXILIARY_PATH/52_kp_netcat.sh

function menu_auxiliary(){
    clear
    figlet Auxiliary
    num5 0 "Auxiliary"
    num1 5 "kali-undercover"
    num2 5 "Netcat"
    num9 5 "Main"
    read -n 1 -s NUM
	case $NUM in
	1)
        menu_undercover
        ;;
    2)
        menu_netcat
        ;;
    9)
        mainmenu
        ;;
    *)
        ;;
    esac
}
