#!/bin/bash

source kp.conf

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
    cmd="${cmd} -u \"$URL\"" 
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
    cmd="${cmd} -u \"$URL\" --data $POST" 
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
    cmd="${cmd} -u \"$URL\" --data $POST" 
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
    cmd="${cmd} -u \"$URL\" --data $POST" 
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
    cmd="${cmd} -u \"$URL\" --data $POST" 
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
