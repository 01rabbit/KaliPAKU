#!/bin/bash

source kp.conf
source $MODULES_PATH/misc_module.sh
source $TOOL_PATH/41_kp_results.sh
source $TOOL_PATH/42_kp_faraday.sh


function menu_reports(){
    clear
    figlet Reports
    num4 0 "Reports"
    num1 5 "results"
    num2 5 "Faraday"
    num9 5 "Main"
    read -n 1 -s NUM
	case $NUM in
	1) 
        menu_results
        ;;
    2) 
        menu_faraday
        ;;
    9) 
        mainmenu
        ;;
    *) 
        ;;
    esac
}