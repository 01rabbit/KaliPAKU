#!/bin/bash

source kp.conf
source $MODULES_PATH/misc_module.sh

function menu_sqlmap(){
	clear
	figlet sqlmap
    num1 0 "Kali-tools-top10"
    num4 5 "sqlmap"
    num1 10 "GET_request"
    num2 10 "POST_request"
    num3 10 "Find_out_what_databases_exist" " with_SQL_injection"
    num4 10 "Find_out_what_table_exist" " with_SQL_injection"
    num5 10 "Display_table_contents" " with_SQL_injection"
    num6 10 "Manual"
    num9 10 "Back"
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
    6)
        cmd_sqlmap6
        ;;
    9)
        kalitoolstop10_menu1
        ;;
    *)
        ;;
    esac

}

function cmd_sqlmap1(){
	clear
	figlet sqlmap
    cmd="sqlmap"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}${USERNAME}@${HOSTNAME}${NC}:${RED}[1]Kali-tools-top10${NC} > ${BLUE}[4]$cmd${NC} > ${RED}[1]GET request${NC}\n"
    printf "+${BLUE}Options${NC}:\n"
    printf "|  ${YELLOW}-u URL, --url=URL${NC}   Target URL (e.g. \"http://www.site.com/vuln.php?id=1\")\n"
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

function cmd_sqlmap2(){
	clear
	figlet sqlmap
    cmd="sqlmap"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}${USERNAME}@${HOSTNAME}${NC}:${RED}[1]Kali-tools-top10${NC} > ${BLUE}[4]sqlmap${NC} > ${GREEN}[2]POST request${NC}\n"
    printf "+${BLUE}Options${NC}:\n"
    printf "|  ${YELLOW}-u URL, --url=URL${NC}   Target URL (e.g. \"http://www.site.com/vuln.php?id=1\")\n"
    read -p "> Input Target URL: " URL
    echo "|"
    printf "+${BLUE}Request${NC}:\n"
    echo "|  These options can be used to specify how to connect to the target URL"
    printf "|  ${YELLOW}--data=DATA${NC}         Data string to be sent through POST (e.g. \"id=1\")\n"
    read -p "> Input POST parameter:" POST
    echo "|"
    cmd="${cmd} -u \"$URL\" --data $POST" 
    printf "+${BLUE}Detection${NC}:\n"
    echo "|  These options can be used to customize the detection phase"
    printf "|  ${YELLOW}--level=LEVEL${NC}       Level of tests to perform (1-5, default 1)\n"
    read -p "> Input Level(1-5, default 1): " LEVEL
    if [ ! -z $LEVEL ] && [ $LEVEL -le 5 ];then
        cmd+=" --level $LEVEL"
    else
        cmd+=" --level 1"
    fi
    echo "|"
    printf "|  ${YELLOW}--risk=RISK${NC}         Risk of tests to perform (1-3, default 1)\n"
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

function cmd_sqlmap3(){
	clear
	figlet sqlmap
    cmd="sqlmap"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}${USERNAME}@${HOSTNAME}${NC}:${RED}[1]Kali-tools-top10${NC} > ${BLUE}[4]sqlmap${NC} > ${YELLOW}[3]Find out what DB exist with SQLi${NC}\n"
    printf "+${BLUE}Options${NC}:\n"
    printf "|  ${YELLOW}-u URL, --url=URL${NC}   Target URL (e.g. \"http://www.site.com/vuln.php?id=1\")\n"
    read -p "> Input Target URL: " URL
    echo "|"
    printf "+${BLUE}Request${NC}:\n"
    echo "|  These options can be used to specify how to connect to the target URL"
    printf "|  ${YELLOW}--data=DATA${NC}         Data string to be sent through POST (e.g. \"id=1\")\n"
    read -p "> Input POST parameter:" POST
    echo "|"
    printf "+${BLUE}Detection${NC}:\n"
    echo "|  These options can be used to customize the detection phase"
    printf "|  ${YELLOW}--level=LEVEL${NC}       Level of tests to perform (1-5, default 1)\n"
    cmd="${cmd} -u \"$URL\" --data $POST" 
    read -p "> Input Level(1-5, default 1): " LEVEL
    if [ ! -z $LEVEL ] && [ $LEVEL -le 5 ];then
        cmd+=" --level $LEVEL"
    else
        cmd+=" --level 1"
    fi
    echo "|"
    printf "|  ${YELLOW}--risk=RISK${NC}         Risk of tests to perform (1-3, default 1)\n"
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
    printf "|  ${YELLOW}--dbs${NC}               Enumerate DBMS databases\n"
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

function cmd_sqlmap4(){
	clear
	figlet sqlmap
    cmd="sqlmap"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}${USERNAME}@${HOSTNAME}${NC}:${RED}[1]Kali-tools-top10${NC} > ${BLUE}[4]sqlmap${NC} > ${BLUE}[4]Find out what table exist with SQLi${NC}\n"
    printf "+${BLUE}Options${NC}:\n"
    printf "|  ${YELLOW}-u URL, --url=URL${NC}   Target URL (e.g. \"http://www.site.com/vuln.php?id=1\")\n"
    read -p "> Input Target URL: " URL
    echo "|"
    printf "+${BLUE}Request${NC}:\n"
    echo "|  These options can be used to specify how to connect to the target URL"
    printf "|  ${YELLOW}--data=DATA${NC}         Data string to be sent through POST (e.g. \"id=1\")\n"
    read -p "> Input POST parameter:" POST
    echo "|"
    printf "+${BLUE}Detection${NC}:\n"
    echo "|  These options can be used to customize the detection phase"
    printf "|  ${YELLOW}--level=LEVEL${NC}       Level of tests to perform (1-5, default 1)\n"
    cmd="${cmd} -u \"$URL\" --data $POST" 
    read -p "> Input Level(1-5, default 1): " LEVEL
    if [ ! -z $LEVEL ] && [ $LEVEL -le 5 ];then
        cmd+=" --level $LEVEL"
    else
        cmd+=" --level 1"
    fi
    echo "|"
    printf "|  ${YELLOW}--risk=RISK${NC}         Risk of tests to perform (1-3, default 1)\n"
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
    printf "|  ${YELLOW}-D DB${NC}               DBMS database to enumerate\n"
    read -p "> Input Database Name: "DATABASE_NAME
    cmd+=" -D \"$DATABASE_NAME\""
    echo "|"
    printf "|  ${YELLOW}--tables${NC}            Enumerate DBMS database tables\n"
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

function cmd_sqlmap5(){
	clear
	figlet sqlmap
    cmd="sqlmap"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}${USERNAME}@${HOSTNAME}${NC}:${RED}[1]Kali-tools-top10${NC} > ${BLUE}[4]sqlmap${NC} > ${PURPLE}[5]FDisplay table contents with SQLi${NC}\n"
    printf "+${BLUE}Options${NC}:\n"
    printf "|  ${YELLOW}-u URL, --url=URL${NC}   Target URL (e.g. \"http://www.site.com/vuln.php?id=1\")\n"
    read -p "> Input Target URL: " URL
    echo "|"
    printf "+${BLUE}Request${NC}:\n"
    echo "|  These options can be used to specify how to connect to the target URL"
    printf "|  ${YELLOW}--data=DATA${NC}         Data string to be sent through POST (e.g. \"id=1\")\n"
    read -p "> Input POST parameter:" POST
    echo "|"
    printf "+${BLUE}Detection${NC}:\n"
    echo "|  These options can be used to customize the detection phase"
    printf "|  ${YELLOW}--level=LEVEL${NC}       Level of tests to perform (1-5, default 1)\n"
    cmd="${cmd} -u \"$URL\" --data $POST" 
    read -p "> Input Level(1-5, default 1): " LEVEL
    if [ ! -z $LEVEL ] && [ $LEVEL -le 5 ];then
        cmd+=" --level $LEVEL"
    else
        cmd+=" --level 1"
    fi
    echo "|"
    printf "|  ${YELLOW}--risk=RISK${NC}         Risk of tests to perform (1-3, default 1)\n"
    read -p "> Input Risk(1-3, default 1): " RISK
    if [ ! -z $RISK ] && [ $RISK -le 3 ];then
        cmd+=" --risk $RISK"
    else
        cmd+=" --risk 1"
    fi
    printf "+${BLUE}Enumeration${NC}:\n"
    echo "|  These options can be used to enumerate the back-end database"
    echo "|  management system information, structure and data contained in the tables"
    printf "|  ${YELLOW}-D DB${NC}               DBMS database to enumerate\n"
    read -p "> Input Database Name: " DATABASE_NAME
    cmd+=" -D \"$DATABASE_NAME\""
    echo "|"
    printf "|  ${YELLOW}-T TBL${NC}              DBMS database table(s) to enumerate\n"
    read -p "Input Tables: " TABLE_NAME
    cmd+=" -T \"$TABLE_NAME\""
    echo "|"
    printf "|  ${YELLOW}--dump${NC}              Dump DBMS database table entries\n"
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

function cmd_sqlmap6(){
	clear
	figlet sqlmap
    cmd="sqlmap"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}${USERNAME}@${HOSTNAME}${NC}:${RED}[1]Kali-tools-top10${NC} > ${BLUE}[4]sqlmap${NC} > ${LIGHTBLUE}[6]Manual${NC}\n"
    printf "+${BLUE}Options${NC}:\n"
    printf "|  ${YELLOW}-u URL, --url=URL${NC}   Target URL (e.g. \"http://www.site.com/vuln.php?id=1\")\n"
    echo "|"
    printf "+${BLUE}Request${NC}:\n"
    echo "|  These options can be used to specify how to connect to the target URL"
    printf "|  ${YELLOW}--data=DATA${NC}         Data string to be sent through POST (e.g. \"id=1\")\n"
    echo "|"
    printf "+${BLUE}Detection${NC}:\n"
    echo "|  These options can be used to customize the detection phase"
    printf "|  ${YELLOW}--level=LEVEL${NC}       Level of tests to perform (1-5, default 1)\n"
    printf "|  ${YELLOW}--risk=RISK${NC}         Risk of tests to perform (1-3, default 1)\n"
    echo "|"
    printf "+${BLUE}Enumeration${NC}:\n"
    echo "|  These options can be used to enumerate the back-end database"
    echo "|  management system information, structure and data contained in the tables"
    printf "|  ${YELLOW}--dbs${NC}               Enumerate DBMS databases\n"
    printf "|  ${YELLOW}-D DB${NC}               DBMS database to enumerate\n"
    printf "|  ${YELLOW}--tables${NC}            Enumerate DBMS database tables\n"
    printf "|  ${YELLOW}-T TBL${NC}              DBMS database table(s) to enumerate\n"
    printf "|  ${YELLOW}--dump${NC}              Dump DBMS database table entries\n"
    echo "|"
    printf "+${BLUE}usage: sqlmap [options]\n"
    read -e -p "└─Command > " cmd
    eval $cmd
}