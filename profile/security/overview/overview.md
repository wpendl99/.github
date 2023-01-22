# Security Overview
## BLACK HOODIE HACKER IMAGE OR MAYBE A DANGER SYMBOL
📖 **Suggested reading**: [Database of publicized software vulnerabilities](https://cve.mitre.org/)

📖 **Suggested reading**: [SQL Injection](https://portswigger.net/web-security/sql-injection)



The internet is a dangerous place. To prove it, look at the ```/var/log/auth.log``` file on your server using 
```bash
sudo cat /var/log/auth.log
```
This shows any attempts to ssh into your instance. Notice all of the random usernames and IP Addresses with recent time stamps? That's attackers trying to break into your computer as we speak!

An interesting story from one of our TAs: "I purposefully set up a user named ```admin``` with password ```password``` on my DigitalOcean instance from when I took this class in Winter 2022. Within 15 minutes, someone had gotten into it, bypassed all the restrictions I knew at the time to put in, and started using it to guess ssh passwords elsewhere on the internet."

You can see if your password has ever been leaked by inputting your email address into [haveibeenpwned.com](https://haveibeenpwned.com/). The older the email, the more likely it is that your password has been published on the internet.

Some of the key words you should know:
- *Hacking*: The process of making a system do something it's not supposed to do.
- *Attack Vector*: The method that a hacker employs to hack a computer.
- *Attack Surface*: The total amount of points an attacker can attempt to exploit a system. In the context of this course, this is your web-server and your API endpoints.
- *Exploit*: Code or input that takes advantage of a programming or configuration flaw.
- *Input sanitization*: "Cleaning" any input of potentially malicious data.
- *Payload*: The actual piece of data that a hacker uses to hack a system.
- *Penetration Tester*: a professional hacker who a company pays to hack their website and reveal security vulnerabilities.

Attackers can hack into a system using any number of methods to achieve any number of goals including:
- Bring down your IT Infrastructure (Denial of Service or DoS)
- Encrypt computers for extortion (Ransomware)
- Expose customer data (Data exfiltration)
- Mine crypto using your hardware and electricity (Cryptomalware)
- Carry out other attacks using your infrastructure (Botnet)

Web application security, (often called application security or AppSec) is a subset of cybersecurity that specifically focuses on preventing security vulnerabilities within end-user applications. In the context of this course, this means securing both the code running on your customer's browser and your own server.

## Security is part of programming
Instead of giving a list of hypothetical scenarios, here's a list of recent events that could've been prevented with secure programming within the last few years:
- [$100 million dollars stolen from insider trading using SQL injection vulnerability](https://www.theverge.com/2018/8/22/17716622/sec-business-wire-hack-stolen-press-release-fraud-ukraine)
- [Log4Shell remote code execution vulnerability, 93% of cloud vulnerable at time of discovery, dubbed "the most severe vulnerability ever"](https://en.wikipedia.org/wiki/Log4Shell)
- [Russian hackers install backdoor on 18,000 government and Fortune 500 computers](https://www.npr.org/2021/04/16/985439655/a-worst-nightmare-cyberattack-the-untold-story-of-the-solarwinds-hack)
- [State-sponsored hackers infect 20+ Texas towns' computers with ransomware](https://www.usnews.com/news/national-news/articles/2019-08-20/hackers-hold-computers-of-23-texas-towns-for-ransom)

The technology industry has learned the hard way what happens when security isn't taken seriously. Modern companies have realized that building a website that looks good is a lot less important than building a website that both works and is secure.

## Common hacking techniques
There are a few techniques that web programmers should be aware of:

**SQL/NoSQL Injection**: When a user interacts with a database on the backend, a programmer will often take their input and concatenate it directly into a search query. If implemented incorrectly a hacker can use a specially crafted query to make the database reveal hidden information or delete it's contents. Using a *sanitization* library is the best way to combat this threat.

**Cross-Site Scripting (XSS)**: A very broad category of attacks where an attacker can make malicious javascript execute on a different user's browser. If successful, an attacker can turn a website a user trusts into one that can steal passwords and hijack a user's account.

**Denial of Service**: Any attack where the main goal is to render any service inaccessible. This can be done by deleting a database using an SQL injection, by sending a specially-crafted HTTP request that brings down a poorly configured web server with a buffer overflow, or exploiting any number of software vulnerabilities.

**Distributed Denial of Service (DDos)**: An advanced form of Denial of Service where a hacker group uses multiple computers to flood a server with network traffic. With enough volume, the software and hardware can't keep up and shut down. This can be mitigated by implementing rate limits for network requests in the back end.

**Credential Stuffing**: People have a tendency to reuse passwords or variations of passwords on different websites. If a hackers has a user's credentials from a previous data breach on a website, there's a good chance that they can try those credentials on a different website to successfully log in. 

## What can I do about it?
Unfortunately, it is impossible to completely secure an application, but all hope is not lost. Taking effort to learn new attack methods and their defenses can save you and your company a lot of headaches, and even set you apart from less security-conscious developers in the field. You will learn more about common attacks in the web field, but be aware that attack vectors cover every field of computer science including [AI](https://www.technologyreview.com/2019/03/25/1216/emtech-digital-dawn-song-adversarial-machine-learning/), [CPU microarchitecture](https://mdsattacks.com/), and [networking](https://access.redhat.com/security/cve/cve-2022-3602).

As a web developer the most important thing you can do is **ALWAYS ASSUME BROWSERS ARE SENDING MALICIOUS DATA**

Malicious data can be found in
- Blog posts
- Hyperlinks
- File uploads
- Search queries
- Anything provided by a client's browser, including cookies

While you have complete control over your server, you don't control the client's browser, and they can make the code running on there do whatever they want. Often, they can sidestep the browser and attack your backend directly. You can lower the chance of getting hacked by making sure to *sanitize* any user input. 

When you do the ```Gruyere``` activity, you'll notice that almost all of the exploits resulted from the programmer mishandling user-provided data. 

Notes: 

Should I include CVE? I think it would be an excellent scare tactic and a great resource, but most CVE's are IT/Networking, or aren't related to web programming.

I think we remove either the 1st or 2nd paragraph, they both illustrate the same point. I like the 2nd better, with the story.