# Server Setup

!!TODO!!

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
