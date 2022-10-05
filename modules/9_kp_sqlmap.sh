#!/bin/bash

source kp.conf

function menu_sqlmap(){
	clear
	figlet sqlmap
    num1 0 " Kali-tools-top10"
    num4 5 " sqlmap"
    num1 10 " GET_request"
    num2 10 " POST_request"
    num3 10 " Find_out_what_databases_exist" " with_SQL_injection"
    num4 10 " Find_out_what_table_exist" " with_SQL_injection"
    num5 10 " Display_table_contents" " with_SQL_injection"
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
    cmd="sqlmap"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}`whoami`@`hostname`${NC}:${RED}[1]Kali-tools-top10${NC} > ${BLUE}[4]$cmd${NC} > ${RED}[1]GET request${NC}\n"
    printf "+${BLUE}Options${NC}:\n"
    echo "|  -u URL, --url=URL   Target URL (e.g. \"http://www.site.com/vuln.php?id=1\")"
    read -p "> Input Target URL: " URL
    echo "|"
    printf "+${BLUE}usage${NC} :sqlmap  ${WHITE}[options]${NC}\n"
    cmd="${cmd} -u \"$URL\"" 
    echo "└─Command > $cmd"
    echo ""
    echo "> You ready?"
    num1 0 "No"
    num2 0 "Yes"
    read -n 1 -s ANS
    if [ $ANS = "2" ];then
        eval $cmd
    fi
}

function cmd_sqlmap2(){
	clear
	figlet sqlmap
    cmd="sqlmap"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}`whoami`@`hostname`${NC}:${RED}[1]Kali-tools-top10${NC} > ${BLUE}[4]sqlmap${NC} > ${GREEN}[2]POST request${NC}\n"
    printf "+${BLUE}Options${NC}:\n"
    echo "|  -u URL, --url=URL   Target URL (e.g. \"http://www.site.com/vuln.php?id=1\")"
    read -p "> Input Target URL: " URL
    echo "|"
    printf "+${BLUE}Request${NC}:\n"
    echo "|  These options can be used to specify how to connect to the target URL"
    echo "|  --data=DATA         Data string to be sent through POST (e.g. \"id=1\")"
    read -p "> Input POST parameter:" POST
    echo "|"
    cmd="${cmd} -u \"$URL\" --data $POST" 
    printf "+${BLUE}Detection${NC}:\n"
    echo "|  These options can be used to customize the detection phase"
    echo "|  --level=LEVEL       Level of tests to perform (1-5, default 1)"
    read -p "> Input Level(1-5, default 1): " LEVEL
    if [ ! -z $LEVEL ] && [ $LEVEL -le 5 ];then
        cmd+=" --level $LEVEL"
    else
        cmd+=" --level 1"
    fi
    echo "|"
    echo "|  --risk=RISK         Risk of tests to perform (1-3, default 1)"
    read -p "> Input Risk(1-3, default 1): " RISK
    if [ ! -z $RISK ] && [ $RISK -le 3 ];then
        cmd+=" --risk $RISK"
    else
        cmd+=" --risk 1"
    fi
    printf "+${BLUE}usage${NC} :sqlmap  ${WHITE}[options]${NC}\n"
    echo "└─Command > $cmd"
    echo ""
    echo "> You ready?"
    num1 0 "No"
    num2 0 "Yes"
    read -n 1 -s ANS
    if [ $ANS = "2" ];then
        eval $cmd
    fi
}

function cmd_sqlmap3(){
	clear
	figlet sqlmap
    cmd="sqlmap"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}`whoami`@`hostname`${NC}:${RED}[1]Kali-tools-top10${NC} > ${BLUE}[4]sqlmap${NC} > ${YELLOW}[3]Find out what DB exist with SQLi${NC}\n"
    printf "+${BLUE}Options${NC}:\n"
    echo "|  -u URL, --url=URL   Target URL (e.g. \"http://www.site.com/vuln.php?id=1\")"
    read -p "> Input Target URL: " URL
    echo "|"
    printf "+${BLUE}Request${NC}:\n"
    echo "|  These options can be used to specify how to connect to the target URL"
    echo "|  --data=DATA         Data string to be sent through POST (e.g. \"id=1\")"
    read -p "> Input POST parameter:" POST
    echo "|"
    printf "+${BLUE}Detection${NC}:\n"
    echo "|  These options can be used to customize the detection phase"
    echo "|  --level=LEVEL       Level of tests to perform (1-5, default 1)"
    cmd="${cmd} -u \"$URL\" --data $POST" 
    read -p "> Input Level(1-5, default 1): " LEVEL
    if [ ! -z $LEVEL ] && [ $LEVEL -le 5 ];then
        cmd+=" --level $LEVEL"
    else
        cmd+=" --level 1"
    fi
    echo "|"
    echo "|  --risk=RISK         Risk of tests to perform (1-3, default 1)"
    read -p "> Input Risk(1-3, default 1): " RISK
    if [ ! -z $RISK ] && [ $RISK -le 3 ];then
        cmd+=" --risk $RISK"
    else
        cmd+=" --risk 1"
    fi
    echo "|"
    printf "+${BLUE}Enumeration${NC}:\n"
    echo "|  These options can be used to enumerate the back-end database"
    echo "|  management system information, structure and data contained in the tables"
    echo "|  --dbs               Enumerate DBMS databases"
    echo "> Enumerate DBMS databases? "
    num1 0 "No"
    num2 0 "Yes"
    read -n 1 -s DBS
    if [ $DBS = 2 ];then
        cmd+=" --dbs"
    fi
    echo "|"
    printf "+${BLUE}usage${NC} :sqlmap  ${WHITE}[options]${NC}\n"
    echo "└─Command > $cmd"
    echo ""
    echo "> You ready?"
    num1 0 "No"
    num2 0 "Yes"
    read -n 1 -s ANS
    if [ $ANS = "2" ];then
        eval $cmd
    fi
}

function cmd_sqlmap4(){
	clear
	figlet sqlmap
    cmd="sqlmap"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}`whoami`@`hostname`${NC}:${RED}[1]Kali-tools-top10${NC} > ${BLUE}[4]sqlmap${NC} > ${BLUE}[4]Find out what table exist with SQLi${NC}\n"
    printf "+${BLUE}Options${NC}:\n"
    echo "|  -u URL, --url=URL   Target URL (e.g. \"http://www.site.com/vuln.php?id=1\")"
    read -p "> Input Target URL: " URL
    echo "|"
    printf "+${BLUE}Request${NC}:\n"
    echo "|  These options can be used to specify how to connect to the target URL"
    echo "|  --data=DATA         Data string to be sent through POST (e.g. \"id=1\")"
    read -p "> Input POST parameter:" POST
    echo "|"
    printf "+${BLUE}Detection${NC}:\n"
    echo "|  These options can be used to customize the detection phase"
    echo "|  --level=LEVEL       Level of tests to perform (1-5, default 1)"
    cmd="${cmd} -u \"$URL\" --data $POST" 
    read -p "> Input Level(1-5, default 1): " LEVEL
    if [ ! -z $LEVEL ] && [ $LEVEL -le 5 ];then
        cmd+=" --level $LEVEL"
    else
        cmd+=" --level 1"
    fi
    echo "|"
    echo "|  --risk=RISK         Risk of tests to perform (1-3, default 1)"
    read -p "> Input Risk(1-3, default 1): " RISK
    if [ ! -z $RISK ] && [ $RISK -le 3 ];then
        cmd+=" --risk $RISK"
    else
        cmd+=" --risk 1"
    fi
    echo "|"
    printf "+${BLUE}Enumeration${NC}:\n"
    echo "|  These options can be used to enumerate the back-end database"
    echo "|  management system information, structure and data contained in the tables"
    echo "|  -D DB               DBMS database to enumerate"
    read -p "> Input Database Name: "DATABASE_NAME
    cmd+=" -D \"$DATABASE_NAME\""
    echo "|"
    echo "|  --tables            Enumerate DBMS database tables"
    echo "> Enumerate DBMS database tables?"
    num1 0 "No"
    num2 0 "Yes"
    read -n 1 -s $TABLE
    if [ $TABLE = 2 ];then
        cmd+=" --tables"
    fi
    echo "|"
    printf "${BLUE}usage${NC} :sqlmap  ${WHITE}[options]${NC}\n"
    echo "└─Command > $cmd"
    echo ""
    echo "> You ready?"
    num1 0 "No"
    num2 0 "Yes"
    read -n 1 -s ANS
    if [ $ANS = "2" ];then
        eval $cmd
    fi
}

function cmd_sqlmap5(){
	clear
	figlet sqlmap
    cmd="sqlmap"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}`whoami`@`hostname`${NC}:${RED}[1]Kali-tools-top10${NC} > ${BLUE}[4]sqlmap${NC} > ${PURPLE}[5]FDisplay table contents with SQLi${NC}\n"
    printf "+${BLUE}Options${NC}:\n"
    echo "|  -u URL, --url=URL   Target URL (e.g. \"http://www.site.com/vuln.php?id=1\")"
    read -p "> Input Target URL: " URL
    echo "|"
    printf "+${BLUE}Request${NC}:\n"
    echo "|  These options can be used to specify how to connect to the target URL"
    echo "|  --data=DATA         Data string to be sent through POST (e.g. \"id=1\")"
    read -p "> Input POST parameter:" POST
    echo "|"
    printf "+${BLUE}Detection${NC}:\n"
    echo "|  These options can be used to customize the detection phase"
    echo "|  --level=LEVEL       Level of tests to perform (1-5, default 1)"
    cmd="${cmd} -u \"$URL\" --data $POST" 
    read -p "> Input Level(1-5, default 1): " LEVEL
    if [ ! -z $LEVEL ] && [ $LEVEL -le 5 ];then
        cmd+=" --level $LEVEL"
    else
        cmd+=" --level 1"
    fi
    echo "|"
    echo "|  --risk=RISK         Risk of tests to perform (1-3, default 1)"
    read -p "> Input Risk(1-3, default 1): " RISK
    if [ ! -z $RISK ] && [ $RISK -le 3 ];then
        cmd+=" --risk $RISK"
    else
        cmd+=" --risk 1"
    fi
    printf "+${BLUE}Enumeration${NC}:\n"
    echo "|  These options can be used to enumerate the back-end database"
    echo "|  management system information, structure and data contained in the tables"
    echo "|  -D DB               DBMS database to enumerate"
    read -p "> Input Database Name: " DATABASE_NAME
    cmd+=" -D \"$DATABASE_NAME\""
    echo "|"
    echo "|  -T TBL              DBMS database table(s) to enumerate"
    read -p "Input Tables: " TABLE_NAME
    cmd+=" -T \"$TABLE_NAME\""
    echo "|"
    echo "|  --dump              Dump DBMS database table entries"
    echo "> Dump DBMS database table entries? "
    num1 0 "No"
    num2 0 "Yes"
    read -n 1 -s DUMP
    if [ $DUMP = 2 ];then
        cmd+=" --dump"
    fi
    echo "|"
    printf "+${BLUE}usage${NC} :sqlmap  ${WHITE}[options]${NC}\n"
    echo "└─Command > $cmd"
    echo ""
    echo "> You ready?"
    num1 0 "No"
    num2 0 "Yes"
    read -n 1 -s ANS
    if [ $ANS = "2" ];then
        eval $cmd
    fi
}
