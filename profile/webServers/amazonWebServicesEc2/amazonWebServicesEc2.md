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

## Creating an AWS server instance

Once you have an AWS account it is time to create your web server.

⚠ Note that the AWS interface changes all of the time and so the images given below may not match what you see. However, the concepts they represent should all be there in some shape or form.

1. Navigate to the EC2 service.
1. Select the option to `Launch instance`.
1. Give your instance a meaningful name. Perhaps use a convention such as [owner]-[purpose]-[version].
   ![AWS Instance name](webServerAWSName.jpg)
1. Select Ubuntu for the operating system. !!TODO!! specify the course AMI to skip Caddy install.
   ![AWS Instance name](webServerAWSAmi.jpg)
1. Select t3.nano for the instance type. You can always change this later if you need more power.
   ![AWS Instance name](webServerAWSType.jpg)
1. Create a new key pair. Make sure you save the key pair to your development environment. You will need this every time you secure shell (ssh) into this server (production environment). Note that you don't have to create a new key pair every time you launch an instance. You can use one that you created previously so that all of the servers you create can be accessed with the same key file.
   ![AWS Instance name](webServerAWSkeyPair.jpg)
1. For your security group allow SSH, HTTP, and HTTPS traffic from anywhere. Make sure auto-assign public IP address is enabled.

   ![AWS Instance name](webServerAWSNetwork.jpg)

1. Select the option to `Launch instance`.

It will take a few minutes for the instance to start up but once it is marked as `running`. Look at the properties for the instance and note the public IP address. Go to your console window and use SSH to shell into your new web server. You will need to supply the public IP address and the location of your key pair file that you created/used when you launched your instance.

```sh
➜  ssh -i [key pair file] ubuntu@[ip address]
```

⚠ You may get a warning that your key pair file permissions are too open. If so then you can restrict the permissions on your file so that they are not accessible to all uses by running the `chmod` console command: `chmod  600 [key pair file]`.

⚠ As it connects to the server it might should warn you that it hasn't seen this server before. You can confidently say yes since you are sure of where this server is coming from.

Once it has connected you are now looking at a console window for the web server that you just launched and you should be in the ubuntu user's home directory. If you run `ls -l` you should see the following.

```sh
ls -l
total 4
lrwxrwxrwx 1 ubuntu ubuntu   20 Nov 17 23:03 Caddyfile -> /etc/caddy/Caddyfile
lrwxrwxrwx 1 ubuntu ubuntu   16 Nov 17 03:42 public_html -> /usr/share/caddy
drwxrwxr-x 6 ubuntu ubuntu 4096 Nov 30 22:42 services
```

The `Caddyfile` is your configuration file for your web service gateway. The `public_html` directory contains all of the static files that your are serving up directly through Caddy when using it as a web service. The `services` directory is the place where you are going to install all of your web services once you build them.

1. Assign an elastic IP Address so you can shutdown your server without loosing the IP address

## Connecting to the server

SSH into your server and take a screen shot of the console.
