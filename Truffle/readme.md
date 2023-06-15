# Install Truffle

## Requirements

### NVM (Node Version Manager)

```sh
sudo apt install curl 
curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash 
```

### Node

Install Node with NVM

```sh
nvm install node
```

or 

```sh
nvm install 18.16.0
```

to install a specific version


or 

```sh
nvm install --lts
```

to install the latest LTS

### Working with NVM

```sh
nvm ls
```

==> List installed versions of Node

```sh
nvm ls-remote
```

==> Find the available node.js version for the installation

```sh
nvm use 18.16.0
```

==> Use a specific version of Node

### NPM

```sh
npm install -g npm
```

### Truffle

```sh
npm install -g truffle
```

```sh
truffle version
```

to see the current installed truffle version

### Ganache CLI

```sh
npm install ganache --global
```







