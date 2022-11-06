# KaliPAKU:Kali linux with PAKURI

![KaliPAKU_logo](img/KaliPAKU.png)
![Mark](https://img.shields.io/badge/PAKURI-Mark%20V-green)
![License](https://img.shields.io/github/license/01rabbit/KaliPAKU)
![release-date](https://img.shields.io/github/release-date/01rabbit/KaliPAKU)
![sns](https://img.shields.io/twitter/follow/PAKURI9?label=PAKURI&style=social)

## Overview

The KaliPAKU is a tool that allows novice penetration testers and script kiddies to use the tools provided with Kali linux to improve their penetration testing skills by learning simple investigation, enumeration, and exploits on the keypad.

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

The benefits of using our KaliPAKU include

- For the Red Team
For Red Teams, you can easily perform information enumeration, vulnerability scanning, and simple exploitation.

- For the Blue Team
Blue Team allows users without penetration testing skills to experience a simulated cyber attack simply by operating a numeric keypad based on a cheat sheet.

- For beginners & Scriptkiddy
KaliPAKU was created to support the initial stages of penetration testing. These are useful for training beginner pen testers as they are based on Kali-Tools-top10. They can also dramatically improve the results of on-the-job training.

---

## usage

1. Just start kalipaku.sh. Installation is not required in principle.  

    ``` shell
    ┌──(kali㉿kali)-[~/KaliPAKU]
    └─$ ./kalipaku.sh
    ```

2. KaliPAKU Terminal will be activated.  
    ![KaliPAKU Terminal](https://user-images.githubusercontent.com/16553787/200162688-e8f11bce-890b-4af2-b58b-a284145ac24b.png)  
3. KaliPAKU Terminal
Enter "5963" or "kp" or "kalipaku" in the kalipaku terminal to activate the KaliPAKU menu.  
    ![KaliPAKU Terminal2](https://user-images.githubusercontent.com/16553787/200162695-00673373-877b-423d-9121-0aa2fb5fd6f2.png)  
    ![KaliPAKU menu](https://user-images.githubusercontent.com/16553787/200162700-e34f1a4d-14f3-4b47-8cf4-0fd454158026.png)  
4. KaliPAKU Smart menu  
Entering the numeric key corresponding to the command to be used will build and execute the command. Also, press tab. The "Smart Menu" will open.  
    ![KaliPAKU smart menu](https://user-images.githubusercontent.com/16553787/200162705-aa160b18-2f7c-4bc3-aa2c-4c6d361d1ab1.png)  
5. KaliPAKU Cheatsheet  
Here is a partial cheat sheet of commands that can be called up in the KaliPAKU menu. To check the cheat sheet, use "cs", "cheat", or "cheatsheet". You can also use the magic number "4649".  
    ![cheatsheet](https://user-images.githubusercontent.com/16553787/200162706-4f6231c5-d96e-4788-8d64-786f949c2ff1.png)

---

## Tools used

### Installed on kali linux

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
  11. [set](https://www.kali.org/tools/set/#setoolkit)
  12. [msfpc](https://www.kali.org/tools/msfpc/)
  13. [searchsploit](https://www.kali.org/tools/exploitdb/#searchsploit)

### Added tools

- Github tools
  1. [nmapAutorecon](https://github.com/21y4d/nmapAutomator)

- Original
  1. vulncheck

---

## How to use

1. If you want to scan using Nmap, start KaliPAKU and activate the KaliPAKU menu.  
    ![KaliPAKU Menu](https://user-images.githubusercontent.com/16553787/200162700-e34f1a4d-14f3-4b47-8cf4-0fd454158026.png)  
2. Then enter the magic number "1022" if you want to perform an Intense Scan of Nmap(It takes only about 0.5 seconds to transition to this screen)  
   ![nmap](https://user-images.githubusercontent.com/16553787/200163893-d712c21e-da9c-460c-91d3-1f39a363e5f0.png)  

3. You will then be asked for the IP address of the target and enter it.  
    ![nmap2](https://user-images.githubusercontent.com/16553787/200163894-cb256bf1-1ddf-46ca-a3b0-acfd83a120fb.png)  
4. Then, press "2" for "Yes" after the final confirmation if it is OK.  
This completes the process. Now wait for the result.  

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
