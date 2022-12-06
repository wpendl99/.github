# Ports

When you connect to a device on the internet you need both an IP address and a numbered port. Port numbers allow a single device to support multiple protocols (e.g. HTTP, HTTPS, FTP, SSH) as well as different types of services (e.g. search, document, image). The ports may be exposed externally, or they may only be used internally on the device. For example, the HTTPS port (443) might be available for the world to connect to, the SSH port (22) might be only available to computers at your school, and a service defined port (say 3000) may be only allowed access from processes running on the device.

The internet governing body, IANA, defines the standard usage for port numbers. ports from 0 to 1023 represent standard protocols. Generally a web service should avoid these ports unless it is providing the protocol represented by the standard. Ports from 1024 to 49151 represent ports that have been assigned to requesting entities. However, it is very common for these ports to be used by services running internally on a device. Ports from 49152 to 65535 are considered dynamic and are used dynamic connections to a device.

Here is a list of common port numbers that you will probably come across.

| Port | Protocol                                                                            |
| ---- | ----------------------------------------------------------------------------------- |
| 20   | File Transfer Protocol (FTP) Data Transfer                                          |
| 22   | Secure Shell (SSH)                                                                  |
| 25   | Simple Mail Transfer Protocol (SMTP) E-mail Routing                                 |
| 53   | Domain Name System (DNS) service                                                    |
| 80   | Hypertext Transfer Protocol (HTTP) used in World Wide Web                           |
| 110  | Post Office Protocol (POP3) used by e-mail clients to retrieve e-mail from a server |
| 123  | Network Time Protocol (NTP)                                                         |
| 143  | Internet Message Access Protocol (IMAP) Management of Digital Mail                  |
| 161  | Simple Network Management Protocol (SNMP)                                           |
| 194  | Internet Relay Chat (IRC)                                                           |
| 443  | HTTP Secure (HTTPS) HTTP over TLS/SSL                                               |

## Your ports

As an example of how ports are used we can look at your web server. When you built your web server you externally exposed port 22 so that you could use SSH to create a remote console on the server, port 443 for secure HTTP communication, and port 80 for unsecure HTTP communications.

Internally to your web server, you can have as many web services running as you would like. However, you must make sure that each one uses a different port to communicate on. If you start up your Simon service on port 3000 then you **cannot** use port 3000 for your start up service. Instead you might use port 4000 for your start up. It does not matter what high range port you use. It only matters that you are consistent and unique.

Your web service, Caddy, is listening on ports 80 and 443. When Caddy gets a request on port 80, it automatically redirects the request to port 443 so that a secure connection is used. When Caddy gets a request on port 443 it examines the path provided in the HTTP request (as defined by the URL) and if the path matches a static file, it reads the file off disk and returns its. If the HTTP path matches on of the gateway definitions it has for a gateway service, Caddy makes a connection on that service's port (e.g. 3000 or 4000) passes the request onto the service.
