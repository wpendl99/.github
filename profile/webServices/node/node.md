# Node.js

We need to install Node.js in your production environment since that is used to run your services. However, we should just do this as part of the class AMI.

```sh
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash

. ~/.nvm/nvm.sh

nvm install --lts
```

# ☑ Assignment

Install Node.js in your development environment.

When you are done copy the output of the following commands and submit it, along with a description of something your found interesting, to the Canvas assignment.

```sh
node -v
npm -g list
nvm ls
```
