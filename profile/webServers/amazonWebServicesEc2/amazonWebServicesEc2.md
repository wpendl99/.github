# Amazon Web Services - EC2

Now that you know all about web servers, it is time for you to rent your own. In theory you could contact your ISP and rent an IP address that you would associate with your laptop. You could then use your laptop as a web server. But this has the downside of requiring your laptop to always be available, have enough bandwidth to support your millions of fans, and creates a significant security risk for your laptop. Instead we want to use a cloud provider that can give you an inexpensive small computer that you can experiment with and throw away any time that you would like. This is actually exactly what many web companies do with their core business and so it should work fine for you.

We are going to use Amazon Web Services (AWS) for your work with this instruction. There are lots of other great vendors out there, but AWS is by far the leader in the space and so it is good for you to get experience with them. This will require you to have an account with AWS.

## What is this going to cost you?

There is no cost to create an account with AWS, you only pay for what you use, and in many cases they will give you a significant starting credit and [some services are free](https://aws.amazon.com/free) for a short period of time or monthly usage. The services we are going to use include the following:

| Service        | Purpose                              | Estimated Cost (subject to change)                                |
| -------------- | ------------------------------------ | ----------------------------------------------------------------- |
| EC2            | Server                               | t3.nano $0.0052 an hour, ($3.50/month)                            |
| EC2 Elastic IP | Keep your IP address between reboots | First one is free if you keep it associated with a running server |
| Route53        | Domain name                          | $3 a for `click` tld. More for others                             |
| Route53        | DNS records                          | $0.50 a month for each root domain                                |
|                |                                      | Estimated total: $15 for the course                               |

As mentioned before, there are lots of ways to get free usage of services. For example, as of when this was written, you can get a 750 hours a month, for 12 months, of a Linux t2.micro or t3.micro server instance.

## AWS Credit Grants and AWS Educate Starter Account

AWS has a couple of programs to help students try out their services. If you don't want to supply a credit card you can enroll in a 3rd party administrated program called AWS Educate Starter Account. This program allows you to create an account that comes with a $75 credit and doesn't require a credit card. Alternatively, if you already have an AWS account or want to just get a regular account without involving a 3rd party, you can apply for a $100 grant from AWS and apply it to your account.

Refer to [this article]https://it.newschool.edu/services/learning-resources/aws-amazon-web-services/claim-your-aws-educate-grant) for the details on these programs.

## AWS Server

Once you have an AWS account it is time to create your web server.

### Creating an instance

1. Navigate to the EC2 service.
1. Select the option to `Launch instance`.
1. Give your instance a meaningful name. Perhaps use a convention such as <owner>-<purpose>-<version>.
1. Select Ubuntu for the operating system. !!TODO!! specify the course AMI to skip Caddy install.
1. Select t3.nano for the instance type. You can always change this later if you need more power.
1. Create a new key pair. Make sure you save the key pair to your development environment. You will need this every time you secure shell (ssh) into this server (production environment).
1. For your security group allow SSH, HTTP, and HTTPS traffic from anywhere. Make sure auto-assign public IP address is enabled.
1. Select the option to `Launch instance`.

1. Assign an elastic IP Address so you can shutdown your server without loosing the IP address

## Connecting to the server

SSH into your server and take a screen shot of the console.
