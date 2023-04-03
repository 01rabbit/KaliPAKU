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
source $MODULES_PATH/misc_module.sh


function kalitoolstop10_menu1(){
	local NUM=""
	clear
	figlet kali-tools-top10
    num1 0 "Kali-tools-top10"
    num1 3 "wifite(aircrack-ng)"
    num2 3 "burpsuite"
    num3 3 "crackmapexec(SMB)"
    num4 3 "hydra"
    num5 3 "john"
    num0 3 "Next"
	num9 3 "Main"
	printf "${NC}"
	read -n 1 -s NUM
	case $NUM in
	1)
		menu_wifite
		;;
    2)
        menu_burpsuite
        ;;
	3)
		menu_crackmapexec
		;;
	4)
		menu_hydra
		;;
	5)
		menu_john
		;;
    0)
        kalitoolstop10_menu2
        ;;
	9)
		mainmenu
		;;
	*)
		;;
	esac
}

function kalitoolstop10_menu2(){
	local NUM=""
	clear
	figlet kali-tools-top10
    num1 0 "Kali-tools-top10"
    num1 3 "metasploit-framework"
    num2 3 "nmap"
    num3 3 "responder"
    num4 3 "sqlmap"
    num5 3 "wireshark(tshark)"
    num0 3 "Back"
	num9 3 "Main"
    read -n 1 -s NUM
	case $NUM in
	1)
		menu_metasploit
		;;
	2)
		menu_nmap
		;;
	3)
		menu_responder
		;;
	4)
		menu_sqlmap
		;;
	5)
        menu_wireshark
		;;
	0)
		kalitoolstop10_menu1
		;;
    9)
        mainmenu
        ;;
	*)
		;;
	esac
}
