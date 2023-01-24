#! /bin/bash
 
    var=$(whiptail --title "SmartMenu" --backtitle "${TITLE}" --menu "Simple Smart Menu" 25 70 0 \
    0 "CeatSheet" \
    1 "kp_wifite         Wi-Fi Attack" \
    2 "kp_burpsuite      Local Web Proxy"\
    3 "kp_crackmapexec   Post Exploitation Tool"\
    4 "kp_hydra          Online Password Crack" \
    5 "kp_john           Offline Password Crack" \
    6 "kp_metasploit     Exploit Tool" \
    7 "kp_nmap           Port Scanner" \
    8 "kp_responder      NBT-NS,LLMNR MDNS Responder"\
    9 "kp_sqlmap         Automatic SQL injection tool"\
    10 "kp_wireshark     Packet Scanner" \
    11 "kp_autoscan      nmapAutomator" \
    12 "kp_check         Vulnerability & Results Check" \
    13 "kp_setoolkit     Social Engineering Tool" \
    14 "kp_msfpc         Payload Creator" \
    15 "kp_searchsploit  Search Exploit Code" \
    16 "kp_result        Show Result " \
    3>&1 1>&2 2>&3 )
    case $var in
    0) more cheatsheet.txt ;;
    1) menu_wifite ;;
    2) cmd_burpsuite ;;
    3) menu_crackmapexec ;;
    4) menu_hydra ;;
    5) menu_john ;;
    6) menu_metasploit ;;
    7) menu_nmap ;;
    8) menu_responder ;;
    9) menu_sqlmap ;;
    10) cmd_wireshark ;;
    11) menu_autoscan ;;
    12) menu_check ;;
    13) menu_setoolkit ;;
    14) menu_msfpc ;;
    15) menu_searchsploit ;;
    16 ) menu_result ;;
    esac