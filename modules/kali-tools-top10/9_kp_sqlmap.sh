#!/bin/bash

source kp.conf
source $MODULES_PATH/misc_module.sh

function menu_sqlmap(){
	clear
	figlet sqlmap
    num1 0 "Kali-tools-top10"
    num4 5 "sqlmap"
    num1 10 "Enume_all_dbs"
    num2 10 "Enume_all_tables"
    num3 10 "Enume_table_columns"
    num4 10 "Table_columns_dump"
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
    printf "┌─(${PURPLE}$TITLE${NC})${RED}${USERNAME}@${HOSTNAME}${NC}:${RED}[1]Kali-tools-top10${NC} > ${BLUE}[4]$cmd${NC} > ${RED}[1]Enumerate all dbs${NC}\n"
    printf "+${BLUE}Options${NC}:\n"
    printf "|  ${YELLOW}-u URL, --url=URL${NC}   Target URL (e.g. \"http://www.site.com/vuln.php?id=1\")\n"
    read -p "> Enter Target URL: " URL
    echo "|"
    printf "+${BLUE}Request${NC}:\n"
    echo "|  These options can be used to specify how to connect to the target URL"
    printf "|  ${YELLOW}--cookie=DATA${NC}         HTTP Cookie header value (e.g. \"PHPSESSID=a8d127e..\")\n"
    read -p "> Enter Cookie: " Cookie
    echo "|"
    cmd="${cmd} -u \"$URL\" --cookie=\"${Cookie}\"" 
    printf "+${BLUE}Detection${NC}:\n"
    echo "|  These options can be used to customize the detection phase"
    printf "|  ${YELLOW}--level=LEVEL${NC}       Level of tests to perform (1-5, default 1)\n"
    echo "|"
    read -p "> Enter Level(1-5, default 1): " LEVEL
    if [ ! -z $LEVEL ] && [ $LEVEL -le 5 ];then
        cmd+=" --level=\"$LEVEL\""
    else
        cmd+=" --level=1"
    fi
    echo "|"
    printf "|  ${YELLOW}--risk=RISK${NC}         Risk of tests to perform (1-3, default 1)\n"
    read -p "> Enter Risk(1-3, default 1): " RISK
    if [ ! -z $RISK ] && [ $RISK -le 3 ];then
        cmd+=" --risk=\"$RISK\""
    else
        cmd+=" --risk=1"
    fi
    echo "|"
    printf "+${BLUE}Enumeration${NC}:\n"
    echo "|  These options can be used to enumerate the back-end database"
    echo "|  management system information, structure and data contained in the tables"
    printf "|  ${YELLOW}--dbs${NC}               Enumerate DBMS databases\n"
    echo "|"
    cmd+=" --dbs" 
    printf "+${BLUE}usage${NC} :sqlmap  ${WHITE}[options]${NC}\n"
    echo "|"
    echo "└─Command > $cmd"
    echo ""
    echo "> You ready?"
    num1 0 "No"
    num2 0 "Yes"
    read -n 1 -s ANS
    if [ ! -z "$ANS" ];then
        if [ $ANS = "2" ];then
            show_number 1041 "sqlmap Enume_all_dbs"
            tmux split-window -v
            tmux send-keys "${cmd};read;exit" C-m
            tmux select-pane -t "${TITLE}".0

            # eval $cmd
            read
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
    printf "┌─(${PURPLE}$TITLE${NC})${RED}${USERNAME}@${HOSTNAME}${NC}:${RED}[1]Kali-tools-top10${NC} > ${BLUE}[4]$cmd${NC} > ${GREEN}[2]Enumerate all tables${NC}\n"
    printf "+${BLUE}Options${NC}:\n"
    printf "|  ${YELLOW}-u URL, --url=URL${NC}   Target URL (e.g. \"http://www.site.com/vuln.php?id=1\")\n"
    read -p "> Enter Target URL: " URL
    echo "|"
    printf "+${BLUE}Request${NC}:\n"
    echo "|  These options can be used to specify how to connect to the target URL"
    printf "|  ${YELLOW}--cookie=DATA${NC}         HTTP Cookie header value (e.g. \"PHPSESSID=a8d127e..\")\n"
    read -p "> Enter Cookie: " Cookie
    echo "|"
    cmd="${cmd} -u \"$URL\" --cookie=\"${Cookie}\"" 
    printf "+${BLUE}Detection${NC}:\n"
    echo "|  These options can be used to customize the detection phase"
    printf "|  ${YELLOW}--level=LEVEL${NC}       Level of tests to perform (1-5, default 1)\n"
    echo "|"
    read -p "> Enter Level(1-5, default 1): " LEVEL
    if [ ! -z $LEVEL ] && [ $LEVEL -le 5 ];then
        cmd+=" --level=\"$LEVEL\""
    else
        cmd+=" --level=1"
    fi
    echo "|"
    printf "|  ${YELLOW}--risk=RISK${NC}         Risk of tests to perform (1-3, default 1)\n"
    read -p "> Enter Risk(1-3, default 1): " RISK
    if [ ! -z $RISK ] && [ $RISK -le 3 ];then
        cmd+=" --risk=\"$RISK\""
    else
        cmd+=" --risk=1"
    fi
    echo "|"
    printf "+${BLUE}Enumeration${NC}:\n"
    echo "|  These options can be used to enumerate the back-end database"
    echo "|  management system information, structure and data contained in the tables"
    printf "|  ${YELLOW}-D DB${NC}               DBMS database to enumerate\n"
    read -p "> Enter Database Name: " DATABASE_NAME
    cmd+=" -D \"$DATABASE_NAME\""
    echo "|"
    printf "|  ${YELLOW}--tables${NC}            Enumerate DBMS database tables\n"
    cmd+=" --tables"
    echo "|"
    printf "+${BLUE}usage${NC} :sqlmap  ${WHITE}[options]${NC}\n"
    echo "|"
    echo "└─Command > $cmd"
    echo ""
    echo "> You ready?"
    num1 0 "No"
    num2 0 "Yes"
    read -n 1 -s ANS
    if [ ! -z "$ANS" ];then
        if [ $ANS = "2" ];then
            show_number 1042 "sqlmap Enume_all_tables"
            tmux split-window -v
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

function cmd_sqlmap3(){
	clear
	figlet sqlmap
    cmd="sqlmap"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}${USERNAME}@${HOSTNAME}${NC}:${RED}[1]Kali-tools-top10${NC} > ${BLUE}[4]$cmd${NC} > ${YELLOW}[3]Enume table columns${NC}\n"
    printf "+${BLUE}Options${NC}:\n"
    printf "|  ${YELLOW}-u URL, --url=URL${NC}   Target URL (e.g. \"http://www.site.com/vuln.php?id=1\")\n"
    read -p "> Enter Target URL: " URL
    echo "|"
    printf "+${BLUE}Request${NC}:\n"
    echo "|  These options can be used to specify how to connect to the target URL"
    printf "|  ${YELLOW}--cookie=DATA${NC}         HTTP Cookie header value (e.g. \"PHPSESSID=a8d127e..\")\n"
    read -p "> Enter Cookie: " Cookie
    echo "|"
    cmd="${cmd} -u \"$URL\" --cookie=\"${Cookie}\"" 
    printf "+${BLUE}Detection${NC}:\n"
    echo "|  These options can be used to customize the detection phase"
    printf "|  ${YELLOW}--level=LEVEL${NC}       Level of tests to perform (1-5, default 1)\n"
    echo "|"
    read -p "> Enter Level(1-5, default 1): " LEVEL
    if [ ! -z $LEVEL ] && [ $LEVEL -le 5 ];then
        cmd+=" --level=\"$LEVEL\""
    else
        cmd+=" --level=1"
    fi
    echo "|"
    printf "|  ${YELLOW}--risk=RISK${NC}         Risk of tests to perform (1-3, default 1)\n"
    read -p "> Enter Risk(1-3, default 1): " RISK
    if [ ! -z $RISK ] && [ $RISK -le 3 ];then
        cmd+=" --risk=\"$RISK\""
    else
        cmd+=" --risk=1"
    fi
    echo "|"
    printf "+${BLUE}Enumeration${NC}:\n"
    echo "|  These options can be used to enumerate the back-end database"
    echo "|  management system information, structure and data contained in the tables"
    printf "|  ${YELLOW}-D DB${NC}               DBMS database to enumerate\n"
    read -p "> Enter Database Name: " DATABASE_NAME
    cmd+=" -D \"$DATABASE_NAME\""
    echo "|"
    printf "|  ${YELLOW}-T TBL${NC}              DBMS database table(s) to enumerate\n"
    read -p "Enter Tables: " TABLE_NAME
    cmd+=" -T \"$TABLE_NAME\""
    echo "|"
    printf "|  ${YELLOW}--columns${NC}              Enumerate DBMS database table columns\n"
    cmd+=" --columns"
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
            show_number 1043 "sqlmap Enume_table_columns"
            tmux split-window -v
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

function cmd_sqlmap4(){
	clear
	figlet sqlmap
    cmd="sqlmap"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}${USERNAME}@${HOSTNAME}${NC}:${RED}[1]Kali-tools-top10${NC} > ${BLUE}[4]$cmd${NC} > ${BLUE}[4]Table columns dump${NC}\n"
    printf "+${BLUE}Options${NC}:\n"
    printf "|  ${YELLOW}-u URL, --url=URL${NC}   Target URL (e.g. \"http://www.site.com/vuln.php?id=1\")\n"
    read -p "> Enter Target URL: " URL
    echo "|"
    printf "+${BLUE}Request${NC}:\n"
    echo "|  These options can be used to specify how to connect to the target URL"
    printf "|  ${YELLOW}--cookie=DATA${NC}         HTTP Cookie header value (e.g. \"PHPSESSID=a8d127e..\")\n"
    read -p "> Enter Cookie: " Cookie
    echo "|"
    cmd="${cmd} -u \"$URL\" --cookie=\"${Cookie}\"" 
    printf "+${BLUE}Detection${NC}:\n"
    echo "|  These options can be used to customize the detection phase"
    printf "|  ${YELLOW}--level=LEVEL${NC}       Level of tests to perform (1-5, default 1)\n"
    echo "|"
    read -p "> Enter Level(1-5, default 1): " LEVEL
    if [ ! -z $LEVEL ] && [ $LEVEL -le 5 ];then
        cmd+=" --level=\"$LEVEL\""
    else
        cmd+=" --level=1"
    fi
    echo "|"
    printf "|  ${YELLOW}--risk=RISK${NC}         Risk of tests to perform (1-3, default 1)\n"
    read -p "> Enter Risk(1-3, default 1): " RISK
    if [ ! -z $RISK ] && [ $RISK -le 3 ];then
        cmd+=" --risk=\"$RISK\""
    else
        cmd+=" --risk=1"
    fi
    echo "|"
    printf "+${BLUE}Enumeration${NC}:\n"
    echo "|  These options can be used to enumerate the back-end database"
    echo "|  management system information, structure and data contained in the tables"
    printf "|  ${YELLOW}-D DB${NC}               DBMS database to enumerate\n"
    read -p "> Enter Database Name: " DATABASE_NAME
    cmd+=" -D $DATABASE_NAME"
    echo "|"
    printf "|  ${YELLOW}-T TBL${NC}              DBMS database table(s) to enumerate\n"
    read -p "Enter Tables: " TABLE_NAME
    cmd+=" -T $TABLE_NAME"
    echo "|"
    printf "|  ${YELLOW}-C COL${NC}              DBMS database table column(s) to enumerate\n"
    read -p "> Enter Columns(e.g. user,password): " COLUMNS
    cmd+=" -C $COLUMNS --dump"
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
            show_number 1044 "sqlmap Table_columns_dump"
            tmux split-window -v
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

function cmd_sqlmap6(){
	clear
    show_number 1046 "sqlmap Manual"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}${USERNAME}@${HOSTNAME}${NC}:${RED}[1]Kali-tools-top10${NC} > ${BLUE}[4]sqlmap${NC} > ${LIGHTBLUE}[6]Manual${NC}\n"
    printf "+${BLUE}Options${NC}:\n"
    printf "|  ${YELLOW}-u URL, --url=URL${NC}   Target URL (e.g. \"http://www.site.com/vuln.php?id=1\")\n"
    echo "|"
    printf "+${BLUE}Request${NC}:\n"
    echo "|  These options can be used to specify how to connect to the target URL"
    printf "|  ${YELLOW}--cookie=DATA${NC}         HTTP Cookie header value (e.g. \"PHPSESSID=a8d127e..\")\n"
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
    printf "|  ${YELLOW}--columns${NC}              Enumerate DBMS database table columns\n"
    printf "|  ${YELLOW}--dump${NC}              Dump DBMS database table entries\n"
    echo "|"
    printf "+${BLUE}usage: sqlmap [options]\n${NC}"
    read -e -p "└─Command > " cmd
    eval $cmd
    read
}