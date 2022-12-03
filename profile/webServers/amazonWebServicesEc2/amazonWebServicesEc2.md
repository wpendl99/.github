# Amazon Web Services - EC2

Now that you know all about web servers, it is time for you to rent your own. In theory you could contact your ISP and rent an IP address that you would associate with your laptop. You could then use your laptop as a web server. But this has the downside of requiring your laptop to always be available, have enough bandwidth to support your millions of fans, and creates a significant security risk for your laptop. Instead we want to use a cloud provider that can give you an inexpensive small computer that you can experiment with and throw away any time that you would like. This is actually exactly what many web companies do with their core business and so it should work fine for you.

We are going to use Amazon Web Services (AWS) for your work with this instruction. There are lots of other great vendors out there, but AWS is by far the leader in the space and so it is good for you to get experience with them. This will require you to get an account with AWS and so grab your credit card and head over there right now and sign up.

## What is this going to cost you?

There is no cost to create an account with AWS, you only pay for what you use and in many cases they will give you a [significant starting credit and some services are free](https://aws.amazon.com/free) for a short period of time or monthly usage. The services we are going to use include the following:

| Service | Purpose     | Estimated Cost (subject to change)     |
| ------- | ----------- | -------------------------------------- | ----------------------------------------------------------------- |
| EC2     | Server      | t3.nano $0.0052 an hour, ($3.50/month) |
| EC2     | Elastic IP  | Keep your IP address between reboots   | First one is free if you keep it associated with a running server |
| Route53 | Domain name | $3 for `click` tld                     |
| Route53 | DNS         | $0.50 a month for each root domain     |

As mentioned before, there are lots of ways to get free usage of services. For example, as of when this was written, you can get a 750 hours a month, for 12 months, of a Linux t2.micro or t3.micro server instance.

## AWS Server

1. Get an account
1. Create an EC2 instance (a t3.micro should be fine)
1. Set up the security groups to let in ports 22, 80, and 443
1. Assign an elastic IP Address so you can shutdown your server without loosing the IP address
1. Puchase a domain name using Route53
1. Assign a DNS record to your server using Route53

## AMI

Consider creating a public AMI that can be preloaded with all the software.

## Connecting to the server

SSH into your server and take a screen shot of the console.
