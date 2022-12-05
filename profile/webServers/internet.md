# The internet

📖 **Suggested reading**:

- [MDN How does the Internet work?](https://developer.mozilla.org/en-US/docs/Learn/Common_questions/How_does_the_Internet_work)
- [YouTube The Internet in 5 Minutes](https://youtu.be/7_LPdttKXPc)

The internet globally connects independent networks and computing devices using the TCP/IP model. At the top of the TCP/IP protocol is the application layer. It provide user functionality, such as the web (HTTP), mail (SMTP), files (FTP), remote shell (SSH), and chat (IRC). Underneath that is the transport layer which breaks the application layer's information into small chunks and sends the data. The actual connection is made using the internet layer. This finds the device you want to talk to and keeps the connection alive. Finally, at the bottom of the model is the link layer which deals with the physical connections and hardware.

### [TCP/IP](https://en.wikipedia.org/wiki/Internet_protocol_suite) layers

| Layer       | Example         | Purpose                               |
| ----------- | --------------- | ------------------------------------- |
| Application | HTTP            | Functionality like web browsing       |
| Transport   | TCP             | Moving connection information packets |
| Internet    | IP              | Establishing connections              |
| Link        | Fiber, hardware | Physical connections                  |

## Connections

When one device what to talk to another it must have an IP address. For example, `128.187.16.184` for BYU's address. Usually a human user will know a symbolic name, called a domain name, instead of an IP Address. A DNS lookup will convert the domain name into an IP address. You can see this using the `dig` console utility.

```sh
➜  dig byu.edu

byu.edu.		5755	IN	A	128.187.16.184
```

With the address in hand your device will now talk to the devices it is connected to asking for directions to the device. Eventually, after many hops the destination is discovered and the connection established. With the connection the transport and application layers start exchanging data.

You can determine the hops in a connection using the traceroute console command. In the following example we trace the route between a home computer and BYU. In the result you see the first address `192.168.1.1`. This is the address of the network router requesting device is connected to. From there it goes through a couple devices that do not identify themselves and then hits the Google Fiber gateway. Google Fiber is the internet service provider, or ISP, for the requesting device. Then we jump through a few more unidentified devices before finally arriving at BYU (`128.187.16.184`).

**Traceroute**

```sh
➜  traceroute byu.edu

traceroute to byu.edu (128.187.16.184), 64 hops max, 52 byte packets
 1  192.168.1.1 (192.168.1.1)  10.942 ms  4.055 ms  4.694 ms
 2  * * *
 3  * * *
 4  192-119-18-212.mci.googlefiber.net (192.119.18.212)  5.369 ms  5.576 ms  6.456 ms
 5  216.21.171.197 (216.21.171.197)  6.283 ms  6.767 ms  5.532 ms
 6  * * *
 7  * * *
 8  * * *
 9  byu.com (128.187.16.184)  7.544 ms !X *  40.231 ms !X

```

If I run traceroute again I might see a slightly different route since every connection through the internet. The ability to discover a route makes the internet resilient for connection devices failing or disappearing from the network.
