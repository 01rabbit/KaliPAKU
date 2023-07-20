#!/bin/bash

source kp.conf
source $MODULES_PATH/misc_module.sh
source $AUXILIARY_PATH/51_kp_undercover.sh
source $AUXILIARY_PATH/52_kp_netcat.sh
source $AUXILIARY_PATH/53_kp_httpserver.sh

function menu_auxiliary(){
    clear
	header
    num5 0 "Auxiliary"
    num1 3 "kali-undercover"
    num2 3 "Netcat"
    num3 3 "Python HTTP Server"
    num9 3 "Main"
    read -n 1 -s NUM
	case $NUM in
	1)
        menu_undercover
        ;;
    2)
        menu_netcat
        ;;
    3)
        menu_httpserver
        ;;
    9)
        mainmenu
        ;;
    *)
        ;;
    esac
}
