* [Visual Studio Code](https://code.visualstudio.com/download)
* XCode Command Line Developer Tools. This was initiated by typing `git` from the default terminal. This caused git to be installed.
* [Warp Console](https://app.warp.dev/get_warp)
* Created .zshrc and added alias
    ```sh
    alias c=code
    alias ll='ls -lh'
    ```
* Configured git
    ```sh
    git config --global user.email "your email"
    git config --global user.name "your user name"
    ```
    On commit git asked me for credentials. Supplied gitHub user name and personal access token (PAS). To get PAS click on User Profile Pic/Settings/Developer settings/Personal access tokens
* Cloned course documentation repository
    ```sh
    cd ~/byu/source
    git clone https://github.com/webprogramming260/.github.git webprogramming260
    ```
* Installed VS Code extensions
    * Live Server
    * Prettier
    * ESLint
    * Code Spell Checker
* Installed NVM, Node, NPM by installing NVM first and then the LTS version of Node.
    ```sh
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash

    . ~/.nvm/nvm.sh

    nvm install --lts
    ```