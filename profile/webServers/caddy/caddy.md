# Caddy

Caddy is a web server that listens for incoming HTTP requests. Caddy then either serves up the requested static files or routes the request to another web server. This ability to route requests is called a `reverse proxy` and allows us to expose multiple web services (i.e. your project services) as a single external web service (i.e. Caddy).

## Install

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

[Tutorial on installing Caddy](https://www.hostnextra.com/kb/how-to-install-caddy-on-ubuntu-20-04/)

## Important Caddy file locations

In your ssh console window to your server view the contents of the following locaitons so you can be familiar with how Caddy installed.

- **Caddy HTML files**: /usr/share/caddy
- **Caddy program**: /usr/bin/caddy
- **Caddy website configuration file**: /etc/caddy/`Caddyfile`

## Make it easy to know where your files are

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

## Modify the Caddyfile

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
