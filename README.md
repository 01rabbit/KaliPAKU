# KaliPAKU:Kali linux with PAKURI

![KaliPAKU_logo](img/KaliPAKU.png)
![Mark](https://img.shields.io/badge/PAKURI-Mark%20V-green)
![License](https://img.shields.io/github/license/01rabbit/KaliPAKU)
![release-date](https://img.shields.io/github/release-date/01rabbit/KaliPAKU)
![sns](https://img.shields.io/twitter/follow/PAKURI9?label=PAKURI&style=social)

## Overview

It is a tool that allows novice penetration testers and script kiddies to learn while using Kali linux, using commands, simple investigations, enumerations and attacks with keypad operations implemented in PAKURI.

### What's KaliPAKU

I call it "KaliPAKU" with a hint of irony, since it looks like a tool I made myself, using tools included in Kali Linux and adding a little PAKURI control.
Incidentally, "karipaku" in Japanese slang indicates embezzling something borrowed.
> 借りパク (rōmaji karipaku)
> To take something borrowed and make it one's own property. Or to have it done to you by the other party.
> [Wikitonary:かりぱく](https://en.wiktionary.org/wiki/%E3%81%8B%E3%82%8A%E3%81%B1%E3%81%8F "かりぱく")

---

## Description

KaliPAKU is a semi-automated, user-friendly framework for penetration testing tools. Using only the keypad, you can use the penetration test tool like a game.  
It's also a great introductory tool for beginners. Learn the flow of penetration testing with KaliPAKU without having to wrestle with confusing command lines and tools.  
The first step is to get used to it. Experience and learn penetration testing by executing commands with combinations of numbers.  
The next step is to understand. KaliPAKU displays help for the commands and options to be executed. By learning its contents little by little, players can improve their own skills. KaliPAKU also has a simplified menu called the "Smart Menu". Combine that menu with number input to increase the learning effect.  
The last step is actual practice. KaliPAKU also supports manual command input. Check the help for the commands you have used so far and perform a penetration test by actually entering the commands manually.

|CAUTION|
|:--- |
|If you are interested, please use them in an environment under your control and at your own risk. And, if you execute the KaliPAKU on systems that are not under your control, it may be considered an attack and you may have legally liabillity for your action.|
---

## Your benefits

By using our KaliPAKU, you will benefit from the following.

For redteam:
(a) Red Teams can easily perform operations such as information enumeration and vulnerability scanning.
(b) Visualizing the survey results is possible only with the numeric keypad.

For blueteam:
(c) The Blue Team can experience a dummy attack by simply operating the numeric keypad even they do not have any penetration testing skill.

For beginner:
(d) KaliPAKU has been created to support the early stages of penetration testing. These can be achieved with what is included in Kali-Tools. It can be useful for training the entry level pentesters.

---

## usage

1. Just start kalipaku.sh. Installation is not required in principle.  

``` shell
┌──(kali㉿kali)-[~/KaliPAKU]
└─$ ./kalipaku.sh
```

2. KaliPAKU Terminal will be activated.

```shell
┌─(KaliPAKU)kali@kali:/home/kali/KaliPAKU
└─Command? > 

```

3. KaliPAKU Terminal

Enter "5963" or "kp" or "kalipaku" in the kalipaku terminal to activate the KaliPAKU menu.

``` shell
 _  __     _ _ ____   _    _  ___   _ 
| |/ /__ _| (_)  _ \ / \  | |/ / | | |
| ' // _` | | | |_) / _ \ | ' /| | | |
| . \ (_| | | |  __/ ___ \| . \| |_| |
|_|\_\__,_|_|_|_| /_/   \_\_|\_\\___/ 
                                      
  |  +---+
  +--| 1 | Kali-tools-top10
  |  +---+ 
  |  +---+
  +--| 2 | Tools
  |  +---+ 
  |  +---+
  +--| 3 | Attack
  |  +---+ 
  |  +---+
  +--| 9 | Exit
     +---+ 
```

Entering the numeric key corresponding to the command to be used will build and execute the command. Also, press tab. The "Smart Menu" will open.

## Feature

- kali-tools-top10
    1. [wifite](https://www.kali.org/tools/wifite/)
    2. [burpsuite](https://www.kali.org/tools/burpsuite/)
    3. [crackmapexec](https://www.kali.org/tools/crackmapexec/)
    4. [hydra](https://www.kali.org/tools/hydra/)
    5. [john](https://www.kali.org/tools/john/)
    6. [metasploit-framework](https://www.kali.org/tools/metasploit-framework/)
    7. [nmap](https://www.kali.org/tools/nmap/)
    8. [responder](https://www.kali.org/tools/responder/)
    9. [sqlmap](https://www.kali.org/tools/sqlmap/)
    10. [wireshark](https://www.kali.org/tools/wireshark/)
- tools
    1. [nmapAutorecon](https://github.com/21y4d/nmapAutomator)
    2. [set](https://www.kali.org/tools/set/#setoolkit)
    3. [msfpc](https://www.kali.org/tools/msfpc/)
    4. [searchsploit](https://www.kali.org/tools/exploitdb/#searchsploit)

## Cheatsheet

- KaliPAKU Terminal

    | Command | Description |
    | --- | --- |
    | 5963 | Show KaliPAKU Menu |
    | 4649 | Show Cheatsheet |

- KaliPAKU Menu

    | Number | Category | Command | Description |
    | --- | --- | --- | --- |
    | 111 | Kali-tools-top10 | wifite(aircrack-ng) | Execute |
    | 112 | Kali-tools-top10 | wifite(aircrack-ng) | Manual |
    | 112 | Kali-tools-top10 | burpsuite | Execute |
    | 131 | Kali-tools-top10 | crackmapexec(SMB) | Target_format(Basic) |
    | 132 | Kali-tools-top10 | crackmapexec(SMB) | Null_session |
    | 133 | Kali-tools-top10 | crackmapexec(SMB) | Connect_to_target_using_local_account |
    | 134 | Kali-tools-top10 | crackmapexec(SMB) | Path_the_hash_against_a_subnet |
    | 135 | Kali-tools-top10 | crackmapexec(SMB) | Brutefocing_&_Password_Sprayin |
    | 136 | Kali-tools-top10 | crackmapexec(SMB) | Manual |
    | 141 | Kali-tools-top10 | hydra | Bruteforce_the_username_admin with_the_given_password_list |
    | 142 | Kali-tools-top10 | hydra | Bruteforce_SSH_with_user_and_password_lists against_target_IP_address |
    | 143 | Kali-tools-top10 | hydra | Manual |
    | 151 | Kali-tools-top10 | john  | Cracking_with_a_wordlist |
    | 152 | Kali-tools-top10 | john  | Attempt_to_crack_hash_file using_previously_cracked_passwords |
    | 153 | Kali-tools-top10 | john  | Show_cracked_passwords |
    | 154 | Kali-tools-top10 | john  | Attempt_to_crack_hash_using_incremental_mode(May_take_a_long_time) |
    | 155 | Kali-tools-top10 | john  | Manual |
    | 1011 | Kali-tools-top10 | metasploit-framework | Normal_Boot |
    | 1012 | Kali-tools-top10 | metasploit-framework | Create_Multi_handler (windows/meterpreter/reverse_tcp) |
    | 1013 | Kali-tools-top10 | metasploit-framework | Create_Payload (msfpc)|
    | 1021 | Kali-tools-top10 | nmap | Ping_Scan |
    | 1022 | Kali-tools-top10 | nmap | Intense_Scan |
    | 1023 | Kali-tools-top10 | nmap | Intense_Scan+UDP |
    | 1024 | Kali-tools-top10 | nmap | Intense_Scan_all_TCP_Port |
    | 1025 | Kali-tools-top10 | nmap | Vuln_Scan |
    | 1026 | Kali-tools-top10 | nmap | Manual |
    | 1031 | Kali-tools-top10 | responder | Basic_Usage |
    | 1032 | Kali-tools-top10 | responder | Analyze_mode |
    | 1033 | Kali-tools-top10 | responder | Poisoning_with_Responder |
    | 1034 | Kali-tools-top10 | responder | Basic_Authentication_&_WPAD |
    | 1035 | Kali-tools-top10 | responder | Manual |
    | 1041 | Kali-tools-top10 | sqlmap | GET_request |
    | 1042 | Kali-tools-top10 | sqlmap | POST_request |
    | 1043 | Kali-tools-top10 | sqlmap | Find_out_what_databases_exist with_SQL_injection |
    | 1044 | Kali-tools-top10 | sqlmap | Find_out_what_table_exist with_SQL_injection |
    | 1045 | Kali-tools-top10 | sqlmap | Display_table_contents with_SQL_injection |
    | 1046 | Kali-tools-top10 | sqlmap | Manual |
    | 1051 | Kali-tools-top10 | wireshark(tshark) | wireshark |
    | 1051 | Kali-tools-top10 | wireshark(tshark) | tshark |
    | 211 | Tools | AutoScan | Install |
    | 2121 | Tools | Autoscan | Scanning the network with nmapAutomator |
    | 2122 | Tools | Autoscan | Port scan with nmapAutomator |
    | 2123 | Tools | Autoscan | Scan Script with nmapAutomotr|
    | 2124 | Tools | Autoscan | Full port scan with nmapAutomator |
    | 21201 | Tools | Autoscan | UDP scan with nmapPutomator |
    | 21202 | Tools | Autoscan | Vulnerability Scanning with nmapAutomator|
    | 21203 | Tools | Autoscan | Reconnaissance scan with nmapAutomator |
    | 21204 | Tools | Autoscan | All scan with nmapAutomator |
    | 221 | Tools | VuknCheck |Check |
    | 31  | Attack | Exploit(Metasploit) | |
    | 321 | Attack | Social-Engineering | Website_Attack_Vectors(Credential_Harvester_Attack)|
    | 33 | Attack | Brute-force |
    | 341 | Attack | MSFvenom_Payload_Creator(msfpc) | Create_Payload |
    | 351 | Attack | Search_Exploit(searchsploit) |  Search |
    | 351 | Attack | Search_Exploit(searchsploit) | Automatic_Search(Miscellaneous_Automation)|

## Operation check environment

- OS: Kali Linux 2022.2
- Memory: 8.0GB

## Contributors
If you have some new idea about this project, issue, feedback or found some valuable tool feel free to open an issue for just DM me via [@Mr.Rabbit](https://twitter.com/01ra66it) or [@PAKURI](https://twitter.com/PAKURI9).