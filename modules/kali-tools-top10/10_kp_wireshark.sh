#!/bin/bash

source kp.conf
source $MODULES_PATH/misc_module.sh

function menu_wireshark(){
	clear
	figlet wireshark
	num1 0 "Kali-tools-top10"
	num5 5 "wireshark(tshark)"
	num1 10 "wireshark"
    num2 10 "tshark"
	num9 10 "Back"
    read -n 1 -s NUM
	case $NUM in
    1)
        cmd_wireshark
        ;;
    2)
        cmd_tshark
        ;;
    9)
        kalitoolstop10_menu2
        ;;
    *)
        ;;
    esac
}

function cmd_wireshark(){
    clear
    show_number 1051 "wireshark(tshark) wireshark"
    cmd="wireshark"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}${USERNAME}@${HOSTNAME}${NC}:${RED}[1]Kali-tools-top10${NC} > ${PURPLE}[5]wireshark(tshark)${NC} > ${RED}[1]wireshark${NC}\n"
    printf "|${RED}  ####  Caution!  ####${NC}\n"
    printf "|${RED}  Wireshark ${WHITE}is a GUI application. It can't be displayed on a remote console.\n"
    printf "|  If you want to continue with CUI, you can choose ${RED}tshark.${NC}\n"
    echo "|"
    echo "└─Command > $cmd"
	echo ""
	echo "> You ready?"
	num1 0 "No"
	num2 0 "Yes"
    read -n 1 -s ANS
    echo ""
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

function cmd_tshark(){
    clear
    show_number 1052 "wireshark(tshark) tshark"
    cmd="tshark"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}${USERNAME}@${HOSTNAME}${NC}:${RED}[1]Kali-tools-top10${NC} > ${PURPLE}[5]wireshark(tshark)${NC} > ${GREEN}[2]tshark${NC}\n"
    printf "+${BLUE}Capture interface${NC}:\n"
    printf "|  ${YELLOW}-i <interface>, --interface <interface>${NC}\n"
    printf "|                           name or idx of interface (def: first non-loopback)\n"
    printf "|  ${YELLOW}-f <capture filter>${NC}      packet filter in libpcap filter syntax\n"
    printf "+${BLUE}Input file${NC}:\n"
    printf "|  ${YELLOW}-r <infile>, --read-file <infile>${NC}\n"
    printf "|                           set the filename to read from (or '-' for stdin)\n"
    printf "+${BLUE}Processing${NC}:\n"
    printf "|  ${YELLOW}-2${NC}                       perform a two-pass analysis\n"
    printf "+${BLUE}Output${NC}:\n"
    printf "|  ${YELLOW}-w <outfile|->${NC}           write packets to a pcapng-format file named \"outfile\"\n"
    printf "|                           (or '-' for stdout)\n"
    printf "|  ${YELLOW}--elastic-mapping-filter <protocols>${NC} If -G elastic-mapping is specified, put only the\n"
    printf "                            specified protocols within the mapping file\n"
    printf "+${BLUE}Miscellaneous${NC}:\n"
    printf "|  ${YELLOW}-h, --help${NC}               display this help and exit\n"
    printf "|  ${YELLOW}-G [report]${NC}              dump one of several available reports and exit\n"
    printf "|                           default report=\"fields\"\n"
    printf "|                           use \"-G help\" for more help\n"
    printf "|\n"
    printf "+${BLUE}usage${NC}: tshark [ -i <capture interface>|- ] [ -f <capture filter> ] [ -2 ] [ -r <infile> ] [ -w <outfile>|- ] [ options ] [ <filter> ]\n"
    printf "+${BLUE}usage${NC}: tshark -G [ <report type> ] [ --elastic-mapping-filter <protocols> ]\n"
    read -e -p "└─Command > " cmd
    eval $cmd
}
