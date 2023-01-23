# OWASP
📖 **Suggested reading**: [OWASP 2021](https://owasp.org/www-project-top-ten/)

### OWASP LOGO

The Open Web Application Security Project is a non-profit research entity that publishes the keystone *Top Ten* document, which lists the top 10 most important security risks for developers to be aware of. This acts as an outline for companies to follow in order to create more secure web applications.

- **A01 Broken Access Control**: The application doesn't enforce proper permissions on users. This could mean that a non-admin user can act as an admin on a web interface, or admin accounts are improperly secured. This isn't only restricted to profile permissions on the front-end, but also securing your API endpoints from misuse.

- **A02 Cryptographic Failures**: Sensitive data is being transmitted either without encryption, with weak encryption protocols, or with improper implementation of cryptography. Hashing algorithms like MD5 and SHA-1 are now trivial to crack with modern hardware and tools.

    📖 **Suggested reading**: [Hashcat, hashing algorithm solver](https://hashcat.net/hashcat/)

- **A03 Injection**: User input is improperly sanitized before being used by an application. This can lead to any number of vulnerabilities, including revealing sensitive information in a database with SQL Injection or targeting specific accounts with cross-site scripting (XSS) attacks.

- **A04 Insecure Design**: This broadly refers to architectural flaws that are unique for individual systems, rather than implementation errors. This happens when a software team doesn't think about security when designing a system, or doesn't continuously evaluate their security.

- **A05 Security Misconfiguration**: This broadly refers to any configuration of a tech stack that allows an attacker to exploit a system. Some examples include using default passwords, not updating software, or using base or insecure configurations of software.

- **A06 Vulnerable and Outdated Components**: The longer a software is out, the more likely it is that exploits are discovered. Keeping a manifest of your software stack including versions, pay attention to security bulletins, and regularly updating software mitigate this threat.

- **A07 Identification and Authentication Failures**: Improperly implementing authentication methods. This happens by allowing an attacker to brute-force a list of passwords, using weakly encrypted passwords, allowing easy to guess passwords, or not implementing Multi-Factor Authentication.

- **A08 Software and Data Integrity Failure**: It is possible for an attacker to inject malicious code in a third-party package or update. This is a very complex attack so it is mostly done by [hacker groups associated with nation-states](https://www.gao.gov/blog/solarwinds-cyberattack-demands-significant-federal-and-private-sector-response-infographic). You can mitigate this by using tools called File Integrity Monitoring (FIM) and Security Information and Event Management (SIEM)

- **A09 Security Logging and Monitoring Failures**: Monitoring a system is critical to increasing it's security. It would be useful for a development team to have data on how and when endpoints are receiving suspicious input. Ensuring that logs are accessible and contain adequate information will provide actionable data to further secure an application and make responding to a cyberattack much easier.

- **A10 Server Side Request Forgery (SSRF)**: This is a rare incident where a web server fetches a user-supplied URL without verifying it's contents. Computers that live behind firewalls are almost always less secured than internet-facing computers. If an attacker can return information about these internal computers, it can enable an attacker to know how to attack certain computers.

