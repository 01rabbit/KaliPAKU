# KaliPAKU: Training Tool for Penetration Testing Using Kali Linux

![KaliPAKU_logo](img/KaliPAKU_logo.png)
![Mark](https://img.shields.io/badge/PAKURI-Mark%20V-green)
![License](https://img.shields.io/github/license/01rabbit/KaliPAKU)
![release-date](https://img.shields.io/github/release-date/01rabbit/KaliPAKU)
![sns](https://img.shields.io/twitter/follow/PAKURI9?label=PAKURI&style=social)

## What's KaliPAKU

I call it "KaliPAKU" with a hint of irony, since it looks like a tool I made myself, using tools included in Kali Linux and adding a little PAKURI control.
Incidentally, "karipaku" in Japanese slang indicates embezzling something borrowed.
> 借りパク (rōmaji karipaku)
> To take something borrowed and make it one's own property. Or to have it done to you by the other party.
> [Wikitonary:かりぱく](https://en.wiktionary.org/wiki/%E3%81%8B%E3%82%8A%E3%81%B1%E3%81%8F "かりぱく")

---

## Overview

![overview](https://user-images.githubusercontent.com/16553787/229039110-d749063f-e245-48a4-b5c2-e94d8d2db760.png)
KaliPAKU is a command-line tool for Kali Linux that provides an easy-to-use menu-driven interface to run various security tools. The tool is designed to simplify the process of running popular security tools and includes the top 10 tools from the Kali Linux distribution.
One of the unique features of KaliPAKU is its intuitive menu system, which is based on the Ten-Key Numbering System. This allows users to quickly select the tool they want to run by typing the corresponding number on the keypad. This menu system is designed to be easy to use and can be quickly mastered even by those who are new to Kali Linux.
Overall, KaliPAKU is a powerful and easy-to-use tool for anyone looking to simplify the process of running popular security tools on Kali Linux.

### What's Ten-key Numbering System

The Ten-key Numbering System enables even beginners to execute Kali Linux commands without typing them out. It is also useful for simplifying commands, even for experienced users. Key features include:

1. Commands can be executed by inputting 3 to 5 digit numbers.
2. It reduces input errors when typing out commands.
3. By using numbers to execute commands, instructions within a team become more concise.
4. It enables people with physical disabilities to participate in penetration testing if they can operate the ten-key pad.

## Description

KaliPAKU is a Bash shell script that allows users to easily access the Kali Linux tools included in the kali-tools-top10 package. One of its unique features is the Ten-Key Numbering System, which allows users to execute commands by simply typing numbers on the numeric keypad. This system is similar to the finger numbers used when learning to play a musical instrument, and is designed to make it easier for beginners to use Kali Linux.  
In addition to its easy-to-use interface, KaliPAKU also includes an educational aspect. Whenever a command is executed, an explanation of the options used is displayed, helping users to learn more about the commands and options available.  
KaliPAKU is based on the guidelines provided in NIST SP 800-115, which outlines the process and procedures for conducting penetration testing. As such, it includes the necessary Kali Linux tools to facilitate penetration testing, and assists users by providing step-by-step guidance.  
To use KaliPAKU, simply download and run the script in the terminal. From there, users can select the desired Kali Linux tool from the numbered list and enter any necessary options. The tool will then execute and display the results.  
KaliPAKU is a powerful tool for anyone looking to improve their penetration testing skills, and its user-friendly interface makes it accessible to people of all backgrounds and skill levels.  

|CAUTION|
|:--- |
|If you are interested, please use them in an environment under your control and at your own risk. And, if you execute the KaliPAKU on systems that are not under your control, it may be considered an attack and you may have legally liabillity for your action.|
---

## Your benefits

The benefits of using our KaliPAKU include

- Red Team  
  1. Efficiency: With the Ten-Key Numbering System, Red Team members can quickly execute commands without the need to remember complex syntax.
  2. Education: KaliPAKU includes explanations of the commands and options used, which can help Red Team members to better understand the tools they are using.
  3. Consistency: By using KaliPAKU, Red Team members can ensure that they are consistently using the same set of tools and commands, which can help to reduce errors and improve their overall effectiveness.

- Blue Team  
  1. Monitoring: The assisting features provided by KaliPAKU help them understand the tools and procedures an attacker might use. This allows Blue Teams to detect and respond to signs of an attack earlier.
  2. Reverse Investigations: Blue Teams can use KaliPAKU to perform reverse investigations. This allows them to identify and remediate potential vulnerabilities and attack vectors.
  3. Training: KaliPAKU allows blue team members to perform validation procedures similar to those used by attackers. This allows the blue team to better assess the risk of an attack from a different perspective.

- Beginners & Scriptkiddy  
  1. Ease of use: By using the Ten-Key Numbering System, beginners do not need to learn complicated commands.
  2. Learning: KaliPAKU includes explanations of commands and options so that beginners can better understand the tools they are using.
  3. Motivation: KaliPAKU makes it easy for beginners to perform tasks. This allows them to take the next step with confidence and increases their motivation to learn.

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
Enter "kp" or "kalipaku" at the KaliPAKU terminal or enter the magic number "4649" to activate the KaliPAKU menu.  
    ![KaliPAKU menu](https://user-images.githubusercontent.com/16553787/229037118-80dd7e8e-0a5d-4040-99c5-fd9c54a93048.png)  
4. KaliPAKU Cheatsheet  
Here is a partial cheat sheet of commands that can be called up in the KaliPAKU menu. To check the cheat sheet, use "cs", "cheat", or "cheatsheet". You can also use the magic number "4936".  
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
- Other Kali tools
  1. [tshark](https://www.kali.org/tools/wireshark/#tshark)
  2. [set](https://www.kali.org/tools/set/#setoolkit)
  3. [msfpc](https://www.kali.org/tools/msfpc/)
  4. [searchsploit](https://www.kali.org/tools/exploitdb/#searchsploit)
  5. [python-faraday](https://www.kali.org/tools/python-faraday)
  6. [Kali Undercover](https://www.kali.org/docs/introduction/kali-undercover/)
  7. [gobuster](https://www.kali.org/tools/gobuster/)
  8. [Netcat](https://www.kali.org/tools/netcat/)

### Added tools

- Github tools
  1. [nmapAutorecon](https://github.com/21y4d/nmapAutomator)

- Original
  1. vulncheck

---

## How to use

1. To scan with Nmap, start KaliPAKU and activate the KaliPAKU menu. The magic number to type is "4649". The magic number is "4649", which means "greetings" in Japanese.  
    ![KaliPAKU Menu](https://user-images.githubusercontent.com/16553787/229037118-80dd7e8e-0a5d-4040-99c5-fd9c54a93048.png)  
2. Then enter the magic number "1022" if you want to perform an Intense Scan of Nmap(It takes only about 0.5 seconds to transition to this screen)  
   ![nmap](https://user-images.githubusercontent.com/16553787/200163893-d712c21e-da9c-460c-91d3-1f39a363e5f0.png)  

3. You will then be prompted to enter the IP address of the destination.  
    ![nmap2](https://user-images.githubusercontent.com/16553787/200163894-cb256bf1-1ddf-46ca-a3b0-acfd83a120fb.png)  
4. Then, press "2" for "Yes" after the final confirmation if it is OK.  
This completes the process. Now wait for the result.  

## Demo

### Demo1 From Recon to Exploit

1. port scan
2. vulnerability scan
3. vulnerability enumeration
4. Exploit code investigation
5. Exploit Execution

Perform the above steps against metasploitable2 using KaliPAKU. Notice how concise and intuitive the behavior is using the ten-key numbering system!

[![demo1](https://user-images.githubusercontent.com/16553787/220332167-1b802cd4-0b19-4cab-b812-fa5c68104c87.png)
](https://youtu.be/da9q_re48XM)

### Demo2 Password List Attack

1. Using Faraday to Aggregate Information
2. Service Enumeration
3. Password List Attack

Use Faraday to effectively use the reconnaissance information collected in Demo1. See the procedure for starting Faraday and importing data using a ten-key numbering system.

[![demo2](https://user-images.githubusercontent.com/16553787/220333705-847f55eb-9171-4bec-809b-9ac69c364240.png)
](https://youtu.be/F5w3mfQElBk)

## Operation check environment

- OS: Kali Linux 2023.1
- Memory: 2048MB

## Contributors

If you have some new idea about this project, issue, feedback or found some valuable tool feel free to open an issue for just DM me via [@Mr.Rabbit](https://twitter.com/01ra66it) or [@PAKURI](https://twitter.com/PAKURI9).
