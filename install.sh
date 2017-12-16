#!/bin/bash
export PATH="$PATH:$HOME/bin"
export WEKAN_VERSION="0.62"
export MONGODB_VERSION="3.6.0"
export NODE_VERSION="v4.8.6"
export NPM_VERSION="4.6.1"
export FIBERS_VERSION="1.0.15"
export ARCHITECTURE="linux-x64"
export ARCH_VERSION="$(uname -m)"

mkdir -p ~/bin
mkdir -p ~/opt
mkdir -p $HOME/wekan/data/db

# Install Node
wget https://nodejs.org/dist/${NODE_VERSION}/node-${NODE_VERSION}-${ARCHITECTURE}.tar.gz
tar xvzf node-${NODE_VERSION}-${ARCHITECTURE}.tar.gz
rm node-${NODE_VERSION}-${ARCHITECTURE}.tar.gz
mv node-${NODE_VERSION}-${ARCHITECTURE} ~/opt/nodejs
ln -s ~/opt/nodejs/bin/node ~/bin/node
ln -s ~/opt/nodejs/bin/npm ~/bin/npm

# Install Node dependencies
npm install -g npm@${NPM_VERSION}
npm install -g node-gyp
npm install -g fibers@${FIBERS_VERSION}

# Install mongodb
wget "https://fastdl.mongodb.org/linux/mongodb-linux-${ARCH_VERSION}-${MONGODB_VERSION}.tgz"
tar -zxvf mongodb-linux-${ARCH_VERSION}-${MONGODB_VERSION}.tgz
rm mongodb-linux-${ARCH_VERSION}-${MONGODB_VERSION}.tgz
mv mongodb-linux-${ARCH_VERSION}-${MONGODB_VERSION} ~/opt/mongodb
export PATH="$HOME/opt/mongodb/bin:$PATH"

# Get wekan release
wget "https://github.com/wekan/wekan/releases/download/v${WEKAN_VERSION}/wekan-${WEKAN_VERSION}.tar.gz"
  # extracts into bundle directory
tar xvzf wekan-${WEKAN_VERSION}.tar.gz
rm wekan-${WEKAN_VERSION}.tar.gz
