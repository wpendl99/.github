# PM2

When you run a program from the console the program will automatically terminate when you close the console or if the computer restarts. In order to keep programs running after a shutdown you need to register it as a `deamon`. The term deamon comes from the idea of something working in the background that is always there.

We want our web services to continue running as a deamon. We would also like a easy to start and stop our services. [That is what a Package Manager 2](https://www.npmjs.com/package/pm2) (PM2) does.

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
