#!/bin/bash
# Download and build dependencies needed for wekan (nodejs and mongodb)
# Also download a realease of wekan
# This script is based on https://github.com/wekan/wekan/blob/devel/Dockerfile
export PATH="$PATH:$HOME/bin"
export WEKAN_VERSION="0.62"
export MONGODB_VERSION="3.6.0"
export NODE_VERSION="v4.8.6"
export NPM_VERSION="4.6.1"
export FIBERS_VERSION="1.0.15"
export ARCHITECTURE="linux-x64"
export ARCH_VERSION="$(uname -m)"

mkdir -p $HOME/bin
mkdir -p $HOME/opt
# This is where the mongo databases are persisted to. Backup this directory. Used in the start.sh script.
mkdir -p $HOME/wekan/data/db

## Install Node
wget https://nodejs.org/dist/${NODE_VERSION}/node-${NODE_VERSION}-${ARCHITECTURE}.tar.gz
tar xvzf node-${NODE_VERSION}-${ARCHITECTURE}.tar.gz
rm node-${NODE_VERSION}-${ARCHITECTURE}.tar.gz
mv node-${NODE_VERSION}-${ARCHITECTURE} $HOME/opt/nodejs
ln -s $HOME/opt/nodejs/bin/node $HOME/bin/node
ln -s $HOME/opt/nodejs/bin/npm $HOME/bin/npm

## Install Node dependencies
npm install -g npm@${NPM_VERSION}
npm install -g node-gyp
npm install -g fibers@${FIBERS_VERSION}

## Install mongodb
wget "https://fastdl.mongodb.org/linux/mongodb-linux-${ARCH_VERSION}-${MONGODB_VERSION}.tgz"
tar -zxvf mongodb-linux-${ARCH_VERSION}-${MONGODB_VERSION}.tgz
rm mongodb-linux-${ARCH_VERSION}-${MONGODB_VERSION}.tgz
mv mongodb-linux-${ARCH_VERSION}-${MONGODB_VERSION} $HOME/opt/mongodb
export PATH="$HOME/opt/mongodb/bin:$PATH"

## Get wekan release
wget "https://github.com/wekan/wekan/releases/download/v${WEKAN_VERSION}/wekan-${WEKAN_VERSION}.tar.gz"
# extracts into bundle directory
tar xvzf wekan-${WEKAN_VERSION}.tar.gz
rm wekan-${WEKAN_VERSION}.tar.gz
