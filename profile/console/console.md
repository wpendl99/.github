# The Console

**Required reading**: [MDN - Command line crash course](https://developer.mozilla.org/en-US/docs/Learn/Tools_and_testing/Understanding_client-side_tools/Command_line)

Also know as the command line, shell, or terminal, the console is an essential web development tool. The console provides access to the file system and allows for the execution of command line applications.

There are many console applications that you can chose from. All operating systems come with a default console, but you will probably want to install one in order to get the best experience. Here is an example of [Warp](https://www.warp.dev/) running on a Mac.

<img src="warp.png" >

## Make sure you have a console application

In order for you to successfully use the console for web programming it must be [POSIX](https://en.wikipedia.org/wiki/POSIX) compliant. POSIX compliance means that it supports a standard set of console commands. Both Mac and Linix support POSIX. That means any necessary console commands will work on those operating systems. On Microsoft Windows, you can get a reasonable console application by installing [Git for Windows](https://gitforwindows.org/).

Open your console application and make sure you can run a simple POSIX compliant command such as `pwd` (present working directory). If this displays the name directory you are currently working in then you are on the right track.

## Viewing the file system

One of the primary purposes of a console application is to view the files on the computer. The files on a computer are organized into a tree structure of nodes called directories. At any given point in time your console is located at one of the directories in the file system. You can see which directory you are in with the `pwd` (present working directory) command.

```bash
➜  pwd
/Users/student/byu/cs260/2023winter/source/webprogramming260
```

You can list all of the files in the directory with `ls` (list files). Most command line applications take parameters that are specified after you type the application name. For example, `ls` can list all files (even hidden ones) in a long format if you provide the parameter `-la`.

```bash
➜ ls -la
total 16
-rw-r--r--  1 lee  staff   1.0K Nov 19 08:47 LICENSE
-rw-r--r--  1 lee  staff    82B Nov 19 08:47 README.md
drwxr-xr-x  4 lee  staff   128B Nov 19 08:48 profile
drwxr-xr-x  4 lee  staff   128B Nov 19 08:47 react
```

Experiment with the file system commands of the console. Open a console window and create a junk directory that you can experiement in with the command `mkdir junk` (make directory). Then execute the command `cd junk` to move into that directory. Here you can safely execute commands, as you will delete it when you are done. Try the following sequence of commands:

```
mkdir junk
cd junk
pwd
ls
ls -la
ls ../
touch test.txt
ls -l
cp test.txt other.txt
ls
rm test.txt
ls
mkdir subdir
cd subdir
pwd
cd ../..
ls
rm -rf junk
ls
```

## Executing commands

The other primary purpose of the console is to execute commands. You already did this in the previous section when you executed commands for working with the file system. However, console commands can perform any operation. Here are some basic commands that you show experiment with.

- **echo** - Output the parameters of the command
- **cd** - Change directory
- **mkdir** - Make directory
- **rmdir** - Remove directory
- **rm** - Remove file(s)
- **mv** - Move file(s)
- **cp** - Copy files
- **ls** - List files
- **curl** - Command line client URL browser
- **top** - View running processes with CPU and memory usage
- **df** - View disk statistics
- **cat** - Print out the contents of a file
- **less** - Same as cat but allows for scrolling in the file
- **wc** - Count the words in a file
- **ps** - View the currently running processes
- **kill** - Kill a currently running process
- **sudo** - Execute a command as a super user (admin)
- **ssh** - Create a secure shell on a remote computer
- **scp** - Securely copy files to a remote computer
- **history** - Show the history of commands.

There are also keystokes that have special meaning in the console.

- `CTRL-R` - Use type ahead to find previous commands
- `CTRL-C` - Kill the currently running command
