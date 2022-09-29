#! /bin/bash

source kp.conf

function cmd_wifite(){
	clear
	figlet wifite
    cmd="wifite "
    printf "┌─(${PURPLE}$TITLE${NC})${RED}`whoami`@`hostname`${NC}:${BLUE}[1]Kali-tools-top10${NC} > ${BLUE}[1]$cmd${NC}\n"
    printf "${BLUE}usage${NC}: wifite (${RED}Run as Root${NC})\n"
    printf "  wifite ${WHITE}[option|SETTINGS]${NC}\n"
    echo "options:"
	echo "  -h, --help              show this help message and exit"
	echo ""
	echo "SETTINGS:"
	echo "  -v, --verbose           Shows more options (-h -v). Prints commands and outputs."
	echo "                           (default:quiet)"
	echo "  -i [interface]          Wireless interface to use, e.g. wlan0mon (default: ask)"
	echo "  -c [channel]            Wireless channel to scan e.g. 1,3-6 (default: all 2Ghz channels)"
	echo "  -ab, --allbands         Include both 2.4Ghz and 5Ghz bands (default: off)"
	echo "  -2, --2ghz              Include 2.4Ghz channels (default: off)"
	echo "  -5, --5ghz              Include 5Ghz channels (default: off)"
	echo "  -inf, --infinite        Enable infinite attack mode. Modify scanning time with -p (default:off)"
	echo "  -mac, --random-mac      Randomize wireless card MAC address (default: off)"
	echo "  -p [scan_time]          Pillage: Attack all targets after scan_time (seconds)"
    echo "└─Command? > $cmd"
    read -n 1 -p "You ready? y|n > " ANS
    echo ""
    if [ $ANS = "y" ] || [ $ANS = "y" ];then
        cmd="$cmd &"
        eval $cmd
    fi
}
