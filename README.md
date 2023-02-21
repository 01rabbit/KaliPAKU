# KaliPAKU:Kali linux with PAKURI

![KaliPAKU_logo](img/KaliPAKU_logo.png)
![Mark](https://img.shields.io/badge/PAKURI-Mark%20V-green)
![License](https://img.shields.io/github/license/01rabbit/KaliPAKU)
![release-date](https://img.shields.io/github/release-date/01rabbit/KaliPAKU)
![sns](https://img.shields.io/twitter/follow/PAKURI9?label=PAKURI&style=social)

## Overview

KaliPAKU allows novice penetration testers and script kiddies to use the tools included with Kali linux to investigate networks, enumerate hosts and services, search for vulnerabilities, and execute exploits with a simple keypad entry of numbers. At the same time, the tool is used to learn a series of operations and improve penetration testing skills.

### What's KaliPAKU

I call it "KaliPAKU" with a hint of irony, since it looks like a tool I made myself, using tools included in Kali Linux and adding a little PAKURI control.
Incidentally, "karipaku" in Japanese slang indicates embezzling something borrowed.
> 借りパク (rōmaji karipaku)
> To take something borrowed and make it one's own property. Or to have it done to you by the other party.
> [Wikitonary:かりぱく](https://en.wiktionary.org/wiki/%E3%81%8B%E3%82%8A%E3%81%B1%E3%81%8F "かりぱく")

---

## Description

This tool is a Bash shell script.  
Beginners can use the tools included in "kali-tools-top10" without typing commands so that they do not have trouble using Kali linux.  
The feature of this tool is to execute commands only by entering numbers using the numeric keypad. The commands are executed by number, just like the finger numbers you first learn when learning a musical instrument such as the piano. By simply looking at the cheat sheet and entering the numbers corresponding to the command you want to execute, you can assemble the command in the background and advance it to the execution stage.  
Players who start using the tool will be able to perform simple operations in Kalil inux by simply entering numbers. The tool also has a training aspect. Whenever a command is used, a description of the option to be used is always displayed. This means that the player is constantly being lectured by the tool on the commands and options.  
Once the player is familiar with the tool, he/she can actually enter the commands manually. They will be able to demonstrate the skills they have acquired in their previous training.  
In addition to helping with Kali Linux, this tool will also assist beginners with penetration testing. It scans, checks the results, and helps find vulnerabilities. I found a great tool on Github for network scanning. You can even accomplish the penetration test by entering numbers on a numeric keypad.  
This tool is a very simple mechanism. Anyone could have made it. But nobody did, so I made it. The result is a tool that gives players the opportunity to learn by using it. Also, this tool is easy to use, so it can be used by people of any background, gender, or age. The same is true for people with physical handicaps. The tool is so easy to use that even those with limited mobility can use it.  
This tool makes penetration testing easy and fun.  

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
Enter "kp" or "kalipaku" at the KaliPAKU terminal or enter the magic number "4649" to activate the KaliPAKU menu.  
    ![KaliPAKU menu](https://user-images.githubusercontent.com/16553787/200162700-e34f1a4d-14f3-4b47-8cf4-0fd454158026.png)  
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

- OS: Kali Linux 2022.4
- Memory: 8.0GB

## Contributors

If you have some new idea about this project, issue, feedback or found some valuable tool feel free to open an issue for just DM me via [@Mr.Rabbit](https://twitter.com/01ra66it) or [@PAKURI](https://twitter.com/PAKURI9).
