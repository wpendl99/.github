# Editors

The code editor is the workspace of a web application developer. Deeply learning an editor that makes you efficient and flexible will pay significant dividends in your ability to deliver quality work and greatly reduce frustration. A good editor should feel like a friend. If you are constantly arguing with your editor, then perhaps you need a relationship adjustment.

For your work with this instruction I would highly suggest you use two editors. The first one, Visual Studio Code, is your main workhorse for your daily coding activities. The second one, is VI. You will use VI when you are shelled into your production environment and need a simple, but powerful, console based editor for quickly editing text files.

## Visual Studio Code

<img src="essentialsVscodeIcon.png" width=75 />

**Website**: [VSCode](https://code.visualstudio.com/)

Created by Microsoft, Visual Studio Code (VSCode), is free and supported by a large community of open source developers. The [2021 Stack Overflow](https://insights.stackoverflow.com/survey/2021#section-most-popular-technologies-integrated-development-environment) developer survey put VSCode as the number one choice for 71% of professional developers.

![Editor survey](essentialsEditorSurvey.jpg)

VSCode is both simple to use and incredibly flexible and powerful. At its most basic level it represents files in a given directory on the left and an editor space for those files on the right. VSCode then adds excellent git support, auto-formatting, auto-suggestions, and debugging support for JavaScript right out of the box. You can then easily install a language server extension most major programming languages that provide coding, building, and debugging support. From there you have your choice of thousands of extensions to add whatever functionality you would like. This includes extensions such as an auto-reloading HTTP server for hosting your project code locally, an image editor, a spell checker, hex editor, testing frameworks, linters, code prettier, or even docker container management to compartmentalize your development of different projects.

![VSCode](essentialsVSCode.png)

So unless you are already a master of some other development environment, it is highly suggested you go and [install VSCode right now](https://code.visualstudio.com/).

### Live Server extension

This is one extension that is great for building web applications. You are going to build a lot of HTML, CSS, and JavaScript. You can do much of this on CodePen, but for your projects your are going to be working in your development environment. This means you will have a GitHub repository cloned to your personal development computer. When you open VSCode to the directory where your repository is located you can start creating HTML, CSS, and JavaScript, but when you want to see what it is going to actually do when it is served up by a web server you need to actually run a web server to deliver your files to the browser. That is where the Live Server extension comes in handy. With the press of the `Go Live` button on the bottom right status bar, your entire project directory is served up through your browser. Additionally, if you make any changes to a file the browser will automatically be updated.

To install the Live Server extension, open up VSCode and follow these three simple steps.

![LiveServer install](essentialsLiveServerInstall.png)

## GitLens

The basic support the VSCode offers for working with `git` is sufficient for most tasks, but if you really want to unleash the power of git, consider installing the `GitLens` extension. It makes reviewing the commit history, stashing, merging, and comparing so much easier. With over 18 million users, you might enjoy joining the party.

## VI

![Vi Logo](essentialsVimLogo.png)

VI, or technically vim, is one of the oldest console editors. It is extremely powerful and some incredibly talented software engineers use it as their sole development environment. The reason why you should learn VI is that it is available on every Linux server and can do anything that you will need. With that said it has a bit of an initial learning curve. However, once you have memorized a few basic commands you will be able to get around easily. If you take some time to really learn VI, you might find a new essential tool.

There are lots of tutorials for VI here are a few based on how you like to learn.

- [Textual](https://www.linuxfoundation.org/blog/blog/classic-sysadmin-vim-101-a-beginners-guide-to-vim)
- [Video](https://youtu.be/RZ4p-saaQkc)
- [Interactive](https://www.openvim.com/)
- [Game](https://vim-adventures.com/)
- `Console` - Type `vimtutor` in your console

However, the following will walk you through the basics and give you a few important commands to get started.

To use VI, open your console and change directory to one that holds some code you want to work on. For example, if you wanted to edit `index.html` you would type type:

```sh
vi index.html
```

![Vi](essentialsVi.png)

What you will immediately notice is that there is no menu bar or navigation aids. Instead works entirely by keyboard commands. There are two modes in Vi, command mode and insert mode. When you open Vi, you are in command mode and all of the command keystrokes will work. To edit a document use the command `i` to enter insert mode. Now your keystrokes will modify the document. To exit insert mode and type commands again press `ESC`.

The following short list of commands should allow you to do most of what you will ever want to do.

| keystroke | meaning                                                                                                                                        |
| --------- | ---------------------------------------------------------------------------------------------------------------------------------------------- |
| `:h`      | help                                                                                                                                           |
| `i`       | enter insert mode. This will allow you to type and delete text. Use ESC to exit insert mode. No other commands will work while in insert mode. |
| `u`1      | undo                                                                                                                                           |
| `CTRL-r`  | redo                                                                                                                                           |
| `gg`      | go to beginning of file                                                                                                                        |
| `G`       | go to end of file                                                                                                                              |
| `/`       | search for text that you type after /                                                                                                          |
| `n`       | next search match                                                                                                                              |
| `N`       | previous search match                                                                                                                          |
| `v`       | visually select text                                                                                                                           |
| `y`       | yank or copy selected text to clipboard                                                                                                        |
| `p`       | paste clipboard                                                                                                                                |
| `CTRL-wv` | Split window vertically                                                                                                                        |
| `CTRL-ww` | Toggle windows                                                                                                                                 |
| `CTRL-wq` | Close current window                                                                                                                           |
| `:e`      | Open a file. Type ahead available. If you open a directory you can navigate it in the window                                                   |
| `:w`      | write file (save)                                                                                                                              |
| `:q`      | quit. Use :q! to exit without saving                                                                                                           |

The great thing about learning these commands is that you will find that they work with a lot of the console utility programs. For example, with the quick file viewing console utility `less` you can use `G` and `gg` to jump to the top and bottom of a file. Here is a [cheat sheet](https://vim.rtorr.com/) if you want to see all the commands.

> How do you generate a random string?
> Simply put a web developer in front of vim and tell them to save & exit.
