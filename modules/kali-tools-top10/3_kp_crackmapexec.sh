#!/bin/bash

source kp.conf
source $MODULES_PATH/misc_module.sh

function menu_crackmapexec(){
	clear
	figlet crackmapexec
    num1 0 "Kali-tools-top10"
    num3 5 "crackmapexec(SMB)"
    num1 10 "Target_format(Basic)"
    num2 10 "Null_session"
    num3 10 "Connect_to_target_using_local_account"
    num4 10 "Path_the_hash_against_a_subnet"
    num5 10 "Brutefocing_&_Password_Spraying"
    num6 10 "Manual"
	num9 10 "Back"
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
    6)
        cmd_crackmapexec6
        ;;
    9)
        kalitoolstop10_menu1
        ;;
    *)
        ;;
	esac
}

function cmd_crackmapexec1(){
    local cmd="" TARGET="" ANS="" NUM=""
	clear
	figlet crackmapexec
    cmd="crackmapexec"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}${USERNAME}@${HOSTNAME}${NC}:${RED}[1]Kali-tools-top10${NC} > ${YELLOW}[3]$cmd${NC} > ${RED}[1]Target format(Basic)${NC}\n"
    printf "+${BLUE}positional arguments${NC}:\n"
    printf "|  ${YELLOW}target${NC}      the target IP(s), range(s), CIDR(s), hostname(s), FQDN(s),\n"
    echo "|              file(s) containing a list of targets, NMap XML or .Nessus file(s)"
    read -e -p "> Enter target IP address: " TARGET
    echo "|"
    echo "> Use which Service?"
    num1 0 "smb"
    num2 0 "ssh"
    num3 0 "winrm"
    num4 0 "ldap"
    num5 0 "mssql"
    read -n 1 -s SERV_NUM
    case $SERV_NUM in
    1)
        SERVICE="smb"
        ;;
    2)
        SERVICE="ssh"
        ;;
    3)
        SERVICE="winrm"
        ;;
    4)
        SERVICE="ldap"
        ;;
    5)
        SERVICE="mssql"
        ;;
    *)
        ;;
    esac
    printf "+${BLUE}usage${NC}: crackmapexec ${SERVICE} [target ...]\n"
    cmd="${cmd} $SERVICE $TARGET"
    echo "└─Command > $cmd"
    echo ""
    echo "> You ready?"
    num1 0 "No"
    num2 0 "Yes"
    read -n 1 -s ANS
    if [ ! -z "$ANS" ];then
        if [ $ANS = "2" ];then
            show_number 131 "crackmapexec Target_format"
            tmux split-window -v -p 30
            tmux send-keys "${cmd};read;exit" C-m
            tmux select-pane -t "${TITLE}".0
            # eval $cmd
            # read
        else
            :
        fi
    else
        :
    fi
}

function cmd_crackmapexec2(){
    local cmd="" TARGET="" ANS=""
	clear
	figlet crackmapexec
    cmd="crackmapexec"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}${USERNAME}@${HOSTNAME}${NC}:${RED}[1]Kali-tools-top10${NC} > ${YELLO}[3]$cmd${NC} > ${GREEN}[2]Null session${NC}\n"
    printf "+${BLUE}positional arguments${NC}:\n"
    printf "|  ${YELLOW}target${NC}      the target IP(s), range(s), CIDR(s), hostname(s), FQDN(s),\n"
    echo "|              file(s) containing a list of targets, NMap XML or .Nessus file(s)"
    read -e -p "> Enter target IP address: " TARGET
    echo "|"
    SERVICE="smb"
    printf "+${BLUE}usage${NC}: crackmapexec smb [target ...] -u "" up ""\n"
    cmd="${cmd} $SERVICE $TARGET -u \"\" up \"\""
    echo "└─Command > $cmd"
    echo ""
    echo "> You ready?"
    num1 0 "No"
    num2 0 "Yes"
    read -n 1 -s ANS
    if [ ! -z "$ANS" ];then
        if [ $ANS = "2" ];then
            show_number 132 "crackmapexec(SMB) Null_session"
            tmux split-window -v -p 30
            tmux send-keys "${cmd};read;exit" C-m
            tmux select-pane -t "${TITLE}".0
            # eval $cmd
            # read
        else
            :
        fi
    else
        :
    fi
}

function cmd_crackmapexec3(){
    local cmd="" TARGET="" USERNAME="" PASSWORD="" ANS=""
	clear
	figlet crackmapexec
    cmd="crackmapexec"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}${USERNAME}@${HOSTNAME}${NC}:${RED}[1]Kali-tools-top10${NC} > ${YELLOW}[3]$cmd${NC} > ${YELLOW}[3]Connect to target using local account${NC}\n"
    printf "+${BLUE}positional arguments${NC}:\n"
    printf "|  ${YELLOW}target${NC}      the target IP(s), range(s), CIDR(s), hostname(s), FQDN(s),\n"
    echo "|              file(s) containing a list of targets, NMap XML or .Nessus file(s)"
    read -e -p "> Enter target IP address: " TARGET
    echo "|"
    echo "> Use which Service?"
    num1 0 "smb"
    num2 0 "ssh"
    num3 0 "winrm"
    num4 0 "ldap"
    num5 0 "mssql"
    read -n 1 -s NUM
    case $NUM in
    1)
        SERVICE="smb" ;;
    2)
        SERVICE="winrm" ;;
    3)
        SERVICE="ldap" ;;
    4)
        SERVICE="mssql" ;;
    *)
        ;;
    esac
    printf "+${BLUE}options:${NC}\n"
    printf "|  ${YELLOW}-u USERNAME [USERNAME ...]${NC}\n"
    echo "|              username(s) or file(s) containing usernames"
    read -e -p "> Enter Username: " USERNAME
    echo "|"
    printf "|  ${YELLOW}-p PASSWORD [PASSWORD ...]${NC}\n"
    echo "|              password(s) or file(s) containing passwords"
    read -e -p "> Enter Password: " PASSWORD
    echo "|"
    printf "|  ${YELLOW}--local-auth${NC}          authenticate locally to each target\n"
    echo "|"
    printf "+${BLUE}usage${NC}: crackmapexec ${SERVICE} [target ...] [-u USERNAME [USERNAME ...]] [-p PASSWORD [PASSWORD ...]] [--local-auth]\n"
    cmd="${cmd} $SERVICE $TARGET -u $USERNAME -p $PASSWORD --local-auth"
    echo "└─Command > $cmd"
    echo ""
    echo "> You ready?"
    num1 0 "No"
    num2 0 "Yes"
    read -n 1 -s ANS
    if [ ! -z "$ANS" ];then
        if [ $ANS = "2" ];then
            show_number 133 "CME(SMB) Connect_to_target"
            tmux split-window -v -p 30
            tmux send-keys "${cmd};read;exit" C-m
            tmux select-pane -t "${TITLE}".0
            # eval $cmd
            # read
        else
            :
        fi
    else
        :
    fi
}

function cmd_crackmapexec4(){
    local cmd="" TARGET="" USERNAME="" HASH="" AUTH="" ANS=""
	clear
	figlet crackmapexec
    cmd="crackmapexec "
    printf "┌─(${PURPLE}$TITLE${NC})${RED}${USERNAME}@${HOSTNAME}${NC}:${RED}[1]Kali-tools-top10${NC} > ${YELLOW}[3]$cmd${NC} > ${BLUE}[4]Path the hash against a subnet${NC}\n"
    printf "+${BLUE}positional arguments${NC}:\n"
    printf "|  ${YELLOW}target${NC}      the target IP(s), range(s), CIDR(s), hostname(s), FQDN(s),\n"
    echo "|              file(s) containing a list of targets, NMap XML or .Nessus file(s)"
    read -e -p "> Enter target IP address: " TARGET
    echo "|"
    echo "> Use which Service?"
    num1 0 "smb"
    num2 0 "ssh"
    num3 0 "winrm"
    num4 0 "ldap"
    num5 0 "mssql"
    read -n 1 -s NUM
    case $NUM in
    1)
        SERVICE="smb" ;;
    2)
        SERVICE="ssh" ;;
    3)
        SERVICE="winrm" ;;
    4)
        SERVICE="ldap" ;;
    5)
        SERVICE="mssql" ;;
    *)
        ;;
    esac
    printf "+${BLUE}options:${NC}\n"
    printf "|  ${YELLOW}-u USERNAME [USERNAME ...]${NC}\n"
    echo "|              username(s) or file(s) containing usernames"
    read -e -p "> Enter Username: " USERNAME
    echo "|"
    printf "|  ${YELLOW}-H HASH [HASH ...], --hash HASH [HASH ...]${NC}\n"
    echo "|              NTLM hash(es) or file(s) containing NTLM hashes"
    read -e -p "> Enter HASH(LMHASH:NTHASH|NTHASH): " HASH
    echo "> Which HASH Type was used?"
    num1 0 "LMHASH:NTHASH"
    num2 0 "NTHASH"
    read -n 1 -s NUM
    case $NUM in
        1)
            AUTH="--local-auth"
            ;;
        2)
            AUTH=""
            ;;
    esac
    echo "|"
    printf "+${BLUE}usage${NC}: crackmapexec ${SERVICE} [target ...] [-u USERNAME [USERNAME ...]] [-H HASH [HASH ...]] [--local-auth]\n"
    cmd="${cmd} $SERVICE $TARGET -u $USERNAME -H '$HASH' $AUTH"
    echo "└─Command > $cmd"
    echo ""
    echo "> You ready?"
    num1 0 "No"
    num2 0 "Yes"
    read -n 1 -s ANS
    if [ ! -z "$ANS" ];then
        if [ $ANS = "2" ];then
            show_number 134 "CME(SMB) Path_the_hash"
            tmux split-window -v -p 30
            tmux send-keys "${cmd};read;exit" C-m
            tmux select-pane -t "${TITLE}".0
            # eval $cmd
            # read
        else
            :
        fi
    else
        :
    fi
}

function cmd_crackmapexec5(){
    local cmd="" TARGET="" USERNAME="" PASSWORD="" HASH="" ANS=""
	clear
	figlet crackmapexec
    cmd="crackmapexec "
    printf "┌─(${PURPLE}$TITLE${NC})${RED}${USERNAME}@${HOSTNAME}${NC}:${RED}[1]Kali-tools-top10${NC} > ${YELLOW}[3]crackmapexec${NC} > ${PURPLE}[5]Brutefocing & Password Spraying${NC}\n"
    printf "+${BLUE}positional arguments${NC}:\n"
    printf "|  ${YELLOW}target${NC}      the target IP(s), range(s), CIDR(s), hostname(s), FQDN(s),\n"
    echo "|              file(s) containing a list of targets, NMap XML or .Nessus file(s)"
    read -e -p "> Enter target IP address: " TARGET
    echo "|"
    echo "> Use which Service?"
    num1 0 "smb"
    num2 0 "ssh"
    num3 0 "winrm"
    num4 0 "ldap"
    num5 0 "mssql"
    read -n 1 -s NUM
    case $NUM in
    1)
        SERVICE="smb" ;;
    2)
        SERVICE="ssh" ;;
    3)
        SERVICE="winrm" ;;
    4)
        SERVICE="ldap" ;;
    5)
        SERVICE="mssql" ;;
    *)
        ;;
    esac
    printf "+${BLUE}options:${NC}\n"
    printf "|  ${YELLOW}-u USERNAME [USERNAME ...]${NC}\n"
    echo "|                        username(s) or file(s) containing usernames"
    read -e -p "> Enter Username: " USERNAME
    echo "|"
    printf "|  ${YELLOW}-p PASSWORD [PASSWORD ...]${NC}\n"
    echo "|                        password(s) or file(s) containing passwords"
    printf "|  ${YELLOW}-H HASH [HASH ...], --hash HASH [HASH ...]${NC}\n"
    echo "|                        NTLM hash(es) or file(s) containing NTLM hashes"
    echo "> Password or HASH? " 
    num1 0 "Password"
    num2 0 "Hash"
    read -n 1 -s PASS_HASH
    if [ $PASS_HASH = 1 ];then
        read -e -p "> Enter Password: " PASSWORD
        cmd="${cmd} $SERVICE $TARGET -u $USERNAME -p $PASSWORD"
    else
        read -e -p "> Enter HASH(LMHASH:NTHASH|NTHASH): " HASH
        cmd="${cmd} $SERVICE $TARGET -u $USERNAME -H '$HASH'"
    fi
    echo "|"
    printf "+${BLUE}usage${NC}: crackmapexec ${SERVICE} [target ...] [-u USERNAME [USERNAME ...]] [[-p PASSWORD [PASSWORD ...]]|[-H HASH [HASH ...]]]\n"
    echo "└─Command > $cmd"
    echo ""
    echo "> You ready?"
    num1 0 "No"
    num2 0 "Yes"
    read -n 1 -s ANS
    if [ ! -z "$ANS" ];then
        if [ $ANS = "2" ];then
            show_number 135 "crackmapexec(SMB) Bf_&_PS"
            tmux split-window -v -p 30
            tmux send-keys "${cmd};read;exit" C-m
            tmux select-pane -t "${TITLE}".0
            # eval $cmd
            # read
        else
            :
        fi
    else
        :
    fi
}

function cmd_crackmapexec6(){
    local cmd="" 
	clear
    show_number 136 "crackmapexec Manual"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}${USERNAME}@${HOSTNAME}${NC}:${RED}[1]Kali-tools-top10${NC} > ${YELLOW}[3]crackmapexec${NC} > ${LIGHTBLUE}[6]Manual${NC}\n"
    printf "+${BLUE}positional arguments${NC}:\n"
    printf "|  ${YELLOW}target${NC}      the target IP(s), range(s), CIDR(s), hostname(s), FQDN(s),\n"
    echo "|              file(s) containing a list of targets, NMap XML or .Nessus file(s)"
    printf "+${BLUE}options:${NC}\n"
    printf "|  ${YELLOW}-h, --help${NC}            show this help message and exit\n"
    printf "|  ${YELLOW}-id CRED_ID [CRED_ID ...]${NC}  database credential ID(s) to use for authentication\n"
    printf "|  ${YELLOW}-u USERNAME [USERNAME ...]${NC} username(s) or file(s) containing usernames\n"
    printf "|  ${YELLOW}-p PASSWORD [PASSWORD ...]${NC} password(s) or file(s) containing passwords\n"
    printf "|  ${YELLOW}-k, --kerberos${NC}        Use Kerberos authentication from ccache file (KRB5CCNAME)\n"
    printf "|  ${YELLOW}--export EXPORT [EXPORT ...]${NC}   Export result into a file, probably buggy\n"
    printf "|  ${YELLOW}--aesKey AESKEY [AESKEY ...]${NC}   AES key to use for Kerberos Authentication (128 or 256 bits)\n"
    printf "|  ${YELLOW}--kdcHost KDCHOST${NC}     FQDN of the domain controller. If omitted it will use the domain part (FQDN) specified in the target parameter\n"
    printf "|  ${YELLOW}--gfail-limit LIMIT${NC}   max number of global failed login attempts\n"
    printf "|  ${YELLOW}--ufail-limit LIMIT${NC}   max number of failed login attempts per username\n"
    printf "|  ${YELLOW}--fail-limit LIMIT${NC}    max number of failed login attempts per host\n"
    printf "|  ${YELLOW}-M MODULE, --module MODULE${NC}     module to use\n"
    printf "|  ${YELLOW}-o MODULE_OPTION [MODULE_OPTION ...]${NC}   module options\n"
    printf "|  ${YELLOW}-L, --list-modules${NC}    list available modules\n"
    printf "|  ${YELLOW}--options${NC}             display module options\n"
    printf "|  ${YELLOW}--server {https,http}${NC}  use the selected server (default: https)\n"
    printf "|  ${YELLOW}--server-host HOST${NC}    IP to bind the server to (default: 0.0.0.0)\n"
    printf "|  ${YELLOW}--server-port PORT${NC}    start the server on the specified port\n"
    printf "|  ${YELLOW}--connectback-host CHOST${NC}   IP for the remote system to connect back to (default: same as server-host)\n"
    printf "|  ${YELLOW}--port PORT${NC}           defult port\n"
    printf "|  ${YELLOW}-H HASH [HASH ...], --hash HASH [HASH ...]${NC}     NTLM hash(es) or file(s) containing NTLM hashes\n"
    printf "+${BLUE}usage${NC}: crackmapexec [smb|ssh|winrm|ldap|mssql] [-h] [-id CRED_ID [CRED_ID ...]] [-u USERNAME [USERNAME ...]] [-p PASSWORD [PASSWORD ...]] [-k] [--export EXPORT [EXPORT ...]] [--aesKey AESKEY [AESKEY ...]] [--kdcHost KDCHOST]\n"
    printf "        [--gfail-limit LIMIT | --ufail-limit LIMIT | --fail-limit LIMIT] [-M MODULE] [-o MODULE_OPTION [MODULE_OPTION ...]] [-L] [--options] [--server {http,https}] [--server-host HOST] [--server-port PORT]\n"
    printf "        [--connectback-host CHOST] [-H HASH [HASH ...]] [--no-bruteforce] [--continue-on-success] [--port PORT] [-d DOMAIN | --local-auth]\n"
    read -e -p "└─Command > " cmd
    tmux split-window -v -p 30
    tmux send-keys "${cmd};read;exit" C-m
    tmux select-pane -t "${TITLE}".0

    # eval $cmd
}


# cmd_crackmapexec1