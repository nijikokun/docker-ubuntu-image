# Docker Ubuntu Image

Build an up-to-date and pre-built ubuntu image for rapid development environments.

## Features

- Up-to-date APT sources & packages
- Pre-configured maximum `ulimit`
- Pre-configured SSH credentials
- Gem installed configured with `no-ri` and `no-rdoc`
- Git, Node, Ruby pre-installed
- Gulp, Yarn, Bundler pre-installed

## Image Includes

- OS (`ubuntu:latest`)
  - `build-essential software-properties-common python-software-properties apt-transport-https`
  - `libtool libc6-dev libxml2-dev libxslt-dev libpcre3 libpcre3-dev libreadline6 libreadline6-dev zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-dev `
  - `git curl make pkg-config unzip`
  - `netcat openssl openssh-server openssh-client dnsmasq procps perl wget`
  - `sqlite3 autoconf ncurses-dev automake bison subversion`
- Environment:
  - `git`
  - `nvm` (`4.4`, `6`, `latest`)
  - `rvm` (`2.3.3`)
  - `yarn`
  - `gulp`
  - `bundler`

## Building

```sh
git clone git@github.com:nijikokun/docker-ubuntu-image.git
cd docker-ubuntu-image
cp ~/.ssh/id_rsa id_rsa
docker build -t ubuntu-image .
```

**Note** This will copy your `id_rsa` from `~/.ssh` into the cloned directory. I have added rules to the `.gitignore` to prevent 
pushing of your private keys, however make sure to double check before publishing anything.

## Usage

```dockerfile
FROM ubuntu-image
```

## License

```
MIT (C) 2017 Nijiko Yonskai <nijikokun@gmail.com>
```