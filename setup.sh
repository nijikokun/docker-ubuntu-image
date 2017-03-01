#!/bin/bash

set -o errexit

# Install dependencies
echo "==> Installing dependencies"
apt-get update

# Install dependency packages
# For frontend prefix usage, see: http://askubuntu.com/a/693180
DEBIAN_FRONTEND=noninteractive apt-get install -y build-essential software-properties-common python-software-properties apt-transport-https
DEBIAN_FRONTEND=noninteractive apt-get install -y libtool libc6-dev libxml2-dev libxslt-dev libpcre3 libpcre3-dev libreadline6 libreadline6-dev zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-dev 
DEBIAN_FRONTEND=noninteractive apt-get install -y git curl make pkg-config unzip
DEBIAN_FRONTEND=noninteractive apt-get install -y netcat openssl dnsmasq procps perl wget
DEBIAN_FRONTEND=noninteractive apt-get install -y openssh-server openssh-client
DEBIAN_FRONTEND=noninteractive apt-get install -y sqlite3 autoconf ncurses-dev automake bison subversion

# Configure OS
echo "==> Configure OS"
bash -c 'echo "fs.file-max = 65536" >> /etc/sysctl.conf'
bash -c "cat >> /etc/security/limits.conf" << EOL
* soft     nproc          65535
* hard     nproc          65535
* soft     nofile         65535
* hard     nofile         65535
EOL

# Installing Node
echo "==> Installing NVM"
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.1/install.sh | bash
echo 'export NVM_DIR="$HOME/.nvm" ; [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm' >> /etc/profile
source /etc/profile

echo "==> Installing Node Versions"
nvm install 4.4
nvm install 6
nvm install node
nvm use node

echo "==> Installing Global Node Packages"
npm install -g yarn
yarn global add gulp
yarn global add webpack

#  Installing Ruby
echo "==> Installing RVM"
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | bash -s stable --ruby=2.3.3
echo 'gem: --no-ri --no-rdoc' > ~/.gemrc
echo "source /usr/local/rvm/scripts/rvm" >> /etc/profile
source /etc/profile
rvm use 2.3.3
gem install bundler

echo "Done."