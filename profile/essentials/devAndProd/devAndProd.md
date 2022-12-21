# Development and production environments

When working on a commercial web application, it is critical to separate where you `develop` your application, from where the `production` release of your application is made publicly available. Often times there are more environments than this, such as staging, internal testing, and external testing environments. If your company is seeking third party security certification (such as SOC2 compliance) they will require that these environments are strictly separated from each other. A developer will not have access to the production environment in order to prevent a developer from nefariously manipulating an entire company asset. Instead automated integration processes, called continuously integration (`CI`) processes, checkout the application code, lint it, build it, test it, stage it, test it more, and then finally, if everything checks out, pushes the application to the production environment, and notifies the different departments in the company of the release.

For our work, you will use and manage both your `development` (your personal computer) and `production` (your AWS server) environments. However, you should never consider your production environment as a place to develop, or experiment with, your application. You may shell into the production environment to configure your server or to debug a production problem, but the deployment of your application should happen using an automated CI process. For our CI process, we will use a very simple console shell script.

## Deployment

The advantage of using an automated deployment process is that it is reproducible. You don't delete a file, or misconfigure something with an accidental keystroke. Also, having a automated script encourages you to iterate quickly because it is so much easier to deploy your code. You can add a small feature, deploy it out to production, and get feedback within minutes from your users.

Our deployment scripts change with each new technology that we have to deploy. Initially, they just copy up a directory of HTML files, but soon they include the ability modify the configuration of your web server, run transpiler tools, and bundle your code in to a deployable package. You always run the deployment script from your development environment and provide it with the credentials necessary to access your production environment. This will make more sense as we gradually build up our technologies but we can discuss our simon-service deployment script as an example of what they will do. You can view the [entire file here](https://github.com/webprogramming260/simon-service/blob/main/deployService.sh), but we will take things in parts. It isn't critical that you understand everything in the deployment script, but the more you do understand the easier it will be for you to track down and fix problems when they arise.

The first part of the script simply parses the command line parameters so that we can pass in the production environment's security key (or PEM key), the hostname of your domain, the name of the service you are deploying, and the HTTP port that you want the service to be available from.

```sh
while getopts k:h:s:p: flag
do
    case "${flag}" in
        k) key=${OPTARG};;
        h) hostname=${OPTARG};;
        s) service=${OPTARG};;
        p) port=${OPTARG};;
    esac
done

if [[ -z "$key" || -z "$hostname" || -z "$service" || -z "$port" ]]; then
    printf "\nMissing required parameter.\n"
    printf "  syntax: deployService.sh -k <pem key file> -h <hostname> -s <service> -p <port>\n\n"
    exit 1
fi

hostname=$service.$hostname

printf "\n----> Deploying $service to $hostname on internal port $port with $key \n"
```

Next the script copies all of the applicable source files into a distribution directory in preparation for copying that directory to your production server.

```sh
# Step 1
printf "\n----> Build the distribution package\n"
rm -rf dist
mkdir dist
cp -r application dist
cp *.js dist
cp package* dist
```

The directory on your production environment is deleted so that the new one can replace it. This is done by executing commands remotely using the secure shell program (`ssh`).

```sh
# Step 2
printf "\n----> Clearing out previous distribution on the target\n"
ssh -i $key ubuntu@$hostname << ENDSSH
rm -rf services/${service}
mkdir -p services/${service}
ENDSSH
```

The distribution directory is then copied to the production environment using the secure copy program (`scp`).

```sh
# Step 3
printf "\n----> Copy the distribution package to the target\n"
scp -r -i $key dist/* ubuntu@$hostname:services/$service
```

We then use `ssh` again to execute some commands on the production environment. The Caddy web server config file (Caddyfile) is examined to see if this is a new service that needs to be registered, or if we can just restart the service to put it into use. If we need register a new service then we modify both `Caddy` (the web server) and `pm2` (the daemon node process) that handles running your web service.

```sh
# Step 4
printf "\n----> Deploy the service on the target\n"
ssh -i $key ubuntu@$hostname << ENDSSH
cd services/${service}
npm install
if cat /etc/caddy/Caddyfile | grep -q ${hostname}; then
  printf "\n----> Updating existing service\n"
  pm2 restart ${service}
elif cat /etc/caddy/Caddyfile | grep -q ${port}; then
  printf "\n---->  Failure\nExisting service already using port ${port}\n"
  rm -rf ~/services/${service}
else
  printf "\n---->  Installing new service\n"
  pm2 start index.js --name ${service}  -- ${port}
  pm2 save
  cd ~
  sudo sh -c 'printf "\n\n${hostname} {\n\treverse_proxy * localhost:${port}\n}\n" >> Caddyfile'
  sudo service caddy restart
fi
ENDSSH
```

Finally we clean up our development environment by deleting the distribution package.

```sh
# Step 5
printf "\n----> Removing local copy of the distribution package\n"
rm -rf dist
```

Can you imagine if you had to do all of that by hand every time? You would dread deploying and would most likely make several time consuming mistakes during the process.

A deployment script exist for each of the Simon projects and you can use them, as is, for your start up application as long as you are doing a similar thing that the Simon application does.

If you want to learn more about shell scripting you can [read this tutorial](https://ryanstutorials.net/bash-scripting-tutorial/bash-script.php). Shell scripting is a powerful tool for automating common development tasks and is well worth adding to your bucket of skills.
