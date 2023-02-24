# Security overview

📖 **Suggested reading**:

- [Database of publicized software vulnerabilities](https://cve.mitre.org/)
- [SQL Injection](https://portswigger.net/web-security/sql-injection)

The internet allows us to socially connect, conduct financial transactions, and provide access to sensitive individual, corporate, and government data. It is also accessible from every corner of the planet. This positions the internet as a tool that can make the world a much better place, but it also makes a very attractive target for those who would seek to do harm. Preventing that potential for harm needs to be in the forefront of you mind whenever you create or use a web application.

You can see bad actors at work on your very own server by using `ssh` to open a console to your server and reviewing the authorization log. The authorization log captures all of the attempts to create a session on your server.

```sh
sudo less +G /var/log/auth.log
```

The last entry in the log will be from your connection to the server.

```sh
Feb 23 16:26:54 sshd[319071]: pam_unix(sshd:session): session opened for user ubuntu(uid=1000) by (uid=0)
Feb 23 16:26:54 systemd-logind[480]: New session 1350 of user ubuntu.
Feb 23 16:26:54 systemd: pam_unix(systemd-user:session): session opened for user ubuntu(uid=1000) by (uid=0)
```

However, you will see lots of other attempts with random user names that allow access using common exploits. These all should be failing to connect, but if your server is not configured properly then an unauthorized access is possible. The sample of attempts below show attacker's IP address as well as the user name that they attempted to use.

```sh
Feb 19 02:34:28 sshd[298185]: Invalid user developer from 27.1.253.142
Feb 19 02:37:12 sshd[298193]: Invalid user minecraft1 from 27.1.253.142
Feb 23 14:26:19 sshd[318868]: Invalid user siteadmin 174.138.72.191
Feb 23 14:22:18 sshd[318845]: Invalid user tester 174.138.72.191
```

As an experiment, one of our TAs created a test server with a user named `admin` with password `password`. Within 15 minutes, an attacker had logged in, bypassed all the restrictions that were in place, and started using the server to guess ssh passwords elsewhere on the internet.

Even if you don't think there is anything needing security on your system, you might be creating a security problem on other systems. For example, if you make a simple game web application where a user provides a username and password in order to play the game. If your application's data is then compromised, then an attacker could use the password used on your website to gain access to other websites where the user might have used the same password. For example, social networking sites, their work account, or their bank.

## Security terminology

Here is a list of commonly used phrases that are used by the security community.

- **Hacking** - The process of making a system do something it's not supposed to do.
- **Attack Vector** - The method that a hacker employs to hack a computer.
- **Attack Surface** - The exposed parts of a system that an attacker can access. For example, open ports (22, 443, 80), service endpoints, or user accounts.
- **Exploit** - Code or input that takes advantage of a programming or configuration flaw.
- **Input sanitization** - "Cleaning" any input of potentially malicious data.
- **Payload** - The actual piece of data that a hacker uses to hack a system.
- **Penetration Tester** - A professional tester that attempts to find and report security vulnerabilities in a web application.

The following lists some common methods used by an attacker to exploit or disrupt a system.

- **Denial of Service (DoS)** - Overload a system so that it cannot function properly.
- **Ransomeware** - Encrypt a system's data for extortion.
- **Data exfiltration** - Privately extract, or publicly expose, a system's data.
- **Cryptomalware** - Use a system's computing resources to mine cryptocurrency.
- **Botnet** - Use a system to exploit other systems.
- **Social engineering** - Appealing to a human's desire to help give unauthorized access or information to an attacker.

Web application security, (often called application security or AppSec) is a subset of cybersecurity that specifically focuses on preventing security vulnerabilities within end-user applications. In the context of this course, this means securing both the code running on your customer's browser and your own server.

## Examples of security failures

Here is a list of events where companies failed to properly prevent attacks to their systems.

- [$100 million dollars stolen through insider trading using SQL injection vulnerability](https://www.theverge.com/2018/8/22/17716622/sec-business-wire-hack-stolen-press-release-fraud-ukraine)
- [Log4Shell remote code execution vulnerability, 93% of cloud vulnerable at time of discovery, dubbed "the most severe vulnerability ever"](https://en.wikipedia.org/wiki/Log4Shell)
- [Russian hackers install backdoor on 18,000 government and Fortune 500 computers](https://www.npr.org/2021/04/16/985439655/a-worst-nightmare-cyberattack-the-untold-story-of-the-solarwinds-hack)
- [State-sponsored hackers infect 20+ Texas towns' computers with ransomware](https://www.usnews.com/news/national-news/articles/2019-08-20/hackers-hold-computers-of-23-texas-towns-for-ransom)

The technology industry has learned the hard way what happens when security isn't taken seriously. Building a web application that looks good, is a lot less important than building an application that is secure.

## Common hacking techniques

There are a few exploitation techniques that you should need to be aware of:

**SQL/NoSQL Injection**: When a user interacts with a database on the backend, a programmer will often take their input and concatenate it directly into a search query. If implemented incorrectly a hacker can use a specially crafted query to make the database reveal hidden information or delete the database.

**Cross-Site Scripting (XSS)**: A very broad category of attacks where an attacker can make malicious javascript execute on a different user's browser. If successful, an attacker can turn a website a user trusts into one that can steal passwords and hijack a user's account.

**Denial of Service**: Any attack where the main goal is to render any service inaccessible. This can be done by deleting a database using an SQL injection, by sending unexpected data to a service endpoint that causes the program to crash, or by simply making more requests than a server can handle.

**Credential Stuffing**: People have a tendency to reuse passwords or variations of passwords on different websites. If a hackers has a user's credentials from a previous data breach on a website, there's a good chance that they can try those credentials on a different website to successfully log in. A hacker can also try to brute force attack a system by trying every possible combination of input.

## What can I do about it?

Taking the time to learn the techniques a hacker uses to attack a system is the first step in preventing them from exploiting your systems. From there, develop a security mindset, where you always assume any attack surface will be used against you. Make security a consistent part of your application design and feature discussions. Here is a list of common security practices you should include in your applications.

- **Sanitize input data** - Always assume that any data you receive from outside your system may be used to exploit your system. Consider if the input data can be turned into an executable expression, or can overload computing, bandwidth, or storage resources.
- **Logging** - It is not possible to think of every way that your system can be exploited, but you can create an immutable log of requests that will expose when a system is being exploited. You then create alerts, and periodically review the logs for unexpected activity.
- **Traps** - Create what appears to be valuable information and then alert when the data is accessed.
- **Educate** - Teach yourself, your users, and everyone you work with, to be security minded. Anyone who has access to your system should understand how to prevent physical, social, and software attacks.
- **Reduce attack surfaces** - Do not open access anymore than is necessary to properly provide your service. This includes what network ports are open, what account privileges are allowed, where you can access the system from, and what endpoints are available.
- **Layered security** - Do not assume that one safeguard is enough. Create multiple layers of security that each take different approaches. For example, secure your physical environment, secure your network, secure your server, secure your public network traffic, secure your private network traffic, encrypt your storage, separate your production systems from your development systems, put your payment information in a separate environment from your application environment. Do not allow data from one layer to move to other layers. For example, do not allow an employee to take data out of the production system.
- **Least access policy** - Do not give any one user all the credentials necessary to access the system. Only give a user what access they need to do the work they are required to do.
- **Safeguard credentials** - Do not store credentials in accessible locations such as a public GitHub repository or a sticky note taped to a monitor. Automatically rotate credentials in order to limit the impact of an exposure. Only award credentials that are necessary to do a specific task.
- **Public review** - Do not rely on obscurity to keep your system safe. Assume instead that an attacker knows everything about your system and make it difficult for anyone to exploit the system. If you can attack your system, then a hacker will be able to also. By soliciting public review and the work of external penetration testers you will be able to discover and remove potential exploits.
