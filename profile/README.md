# BYU **Web Programming**  `cs260`

<img src="https://github.com/webprogramming260/.github/blob/065f97641b19d6471b1acc91a8c2123d42805611/profile/webprogrammingcover.jpg" width="500">

The account hosts all the repositories for the class assignments. You can view the example projects on the [course website](https://demo.cs260.click).

# Technologies

* [Console](https://developer.mozilla.org/en-US/docs/Learn/Tools_and_testing/Understanding_client-side_tools/Command_line)
* [HTML](https://developer.mozilla.org/en-US/docs/Web/HTML)
* [CSS](https://developer.mozilla.org/en-US/docs/Web/CSS)
* [JavaScript](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Language_Overview)
* [HTTP](https://developer.mozilla.org/en-US/docs/Web/HTTP)


# Server Setup

## AWS Server

1. Get an account
1. Create an EC2 instance (a t3.micro should be fine)
1. Set up the security groups to let in ports 22, 80, and 443
1. Assign an elastic IP Address so you can shutdown your server without loosing the IP address
1. Puchase a domain name using Route53
1. Assign a DNS record to your server using Route53

## AMI

Consider creating a public AMI that can be preloaded with all the software.

## Node.js

You need to install node.js on your server since that is used to run your services.

```
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash

. ~/.nvm/nvm.sh

nvm install --lts
```

## PM2

We need to install [PM2](https://www.npmjs.com/package/pm2) so that your services can keep running even when you are not logged into the server.

```
sudo npm install pm2 -g

```

Useful commands for PM2 include

- **pm2 ls** - List all of the hosted node processes
- **pm2 monit** - Visual monitor
- **pm2 start index.js -n simon-server** - Add a new process with an explicit name
- **pm2 stop simon-server** - Stop a process
- **pm2 restart simon-server** - Restart a process
- **pm2 delete simon-server** - Delete a process from being hosted
- **pm2 save** - Save the current processes across reboot
- **pm2 reload all** - Reload all of the processes

## Caddy

Caddy is a web server that listens for incoming HTTP requests. Caddy then either serves up the requested static files or routes the request to another web server. This ability to route requests is called a `reverse proxy` and allows us to expose multiple web services (i.e. your project services) as a single external web service (i.e. Caddy).

### Install

In order to install Caddy,

1. Use ssh to get a console window on your server
1. Install Caddy using teh following commands.

   ```
   sudo apt update -y && apt upgrade -y

   sudo apt install -y debian-keyring debian-archive-keyring apt-transport-https

   sudo curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/gpg.key' | sudo gpg --dearmor -o /usr/share/keyrings/caddy-stable-archive-keyring.gpg

   sudo curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/debian.deb.txt' | sudo tee /etc/apt/sources.list.d/caddy-stable.list

   sudo apt update

   sudo apt install caddy
   ```

[Tutorial on installation](https://www.hostnextra.com/kb/how-to-install-caddy-on-ubuntu-20-04/)

### Important Caddy file locations

In your ssh console window to your server view the contents of the following locaitons so you can be familiar with how Caddy installed.

- **Caddy HTML files**: /usr/share/caddy
- **Caddy program**: /usr/bin/caddy
- **Caddy website configuration file**: /etc/caddy/`Caddyfile`

### Make it easy to know where your files are

We want to make it easy to get to the files we need to configure Caddy and so we are going to create some linux symbolic links in our user directory so that we can easily find them.

In your ssh console window to your server make sure you are in your home directory (`cd ~`) and then create a link to the `Caddyfile`.

```
ln -s /etc/caddy/Caddyfile Caddyfile
```

Give your user rights to the directory that Caddy uses to host HTML files and then create a link in your user directory for easy access.

```
sudo chown ubuntu /usr/share/caddy /usr/share/caddy/index.html

ln -s /usr/share/caddy public_html
```

### Modify the Caddyfile

The `Caddyfile` contains all of the information for controlling how Caddy hosts information.

We want to change the hostname in the `Caddyfile` so that Caddy will generate a certificate and handle HTTPS requests. You must have a DNS record pointing to your server before this change is made otherwise Caddy cannot verify that you own the server.

```
sudo vi ~/Caddyfile
```

Replace `:80` with your domain name.

```
:80 {
        root * /usr/share/caddy

        file_server
}
```

After saving the Caddy file restart Caddy

```
sudo service caddy restart
```

# Mongo

[Mongo Atlas](https://www.mongodb.com/atlas/database)


