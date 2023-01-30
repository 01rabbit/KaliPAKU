#! /bin/bash
function cmd_faraday-cli4(){
    clear
    figlet Faraday
    cmd="faraday-cli"
    printf "┌─(${PURPLE}$TITLE${NC})${RED}${USERNAME}@${HOSTNAME}${NC}:${BLUE}[4]Reports${NC} > ${GREEN}[2]Faraday${NC} > ${BLUE}[4]faraday-cli${NC} > ${BLUE}[4]Import${NC}\n"
    printf "+${BLUE}Objects${NC}\n"
    printf "|  ----------------------------------------------------------------------------------------------------\n"
    printf "|  tool                  tool actions                                                                    \n"
    printf "|  ${YELLOW}usage${NC}: tool ${WHITE}[-h] {report}${NC} ...\n"
    echo "|"
    printf "+${BLUE}options${NC}:\n"
    printf "|  -h, --help            show this help message and exit\n"
    echo "|"
    printf "+${BLUE}action${NC}:\n"
    printf "|  report      process a report from a tool\n"
    echo ""
    BASE=`pwd`
    cd result
    REPORT_FILE=""
    while :;do
        PS3="└─Please Select report file > "
        select FILE in * "Exit" ;do
        echo ""
        break
        done
        printf "+You selected was : ${YELLOW}${FILE}${NC}\n"
        echo "|"
        if [ ${FILE} = "Exit" ];then
            break
        elif [ -d ${FILE} ];then
            cd ${FILE}
        elif [ -f ${FILE} ];then
            DIR_PATH=`pwd`
            REPORT_FILE="${DIR_PATH}/${FILE}"
            cd $BASE
            break
        fi
    done
    cmd="$cmd tool report $REPORT_FILE"
    echo "└─Command > $cmd"
    echo ""
    echo "> You ready?"
    num1 0 "No"
    num2 0 "Yes"
    read -n 1 -s ANS
    if [ ! -z "$ANS" ];then
        if [ $ANS = "2" ];then
            show_number 4244 "faraday-cli Import Report"
            # tmux split-window -v
            # tmux send-keys "${cmd};read;exit" C-m
            # tmux select-pane -t "${TITLE}".0
            eval $cmd
        else
            :
        fi
    else
        :
    fi
}
cmd_faraday-cli4
