#!/bin/bash

export PATH="$PATH:$HOME/bin"
export WEKAN_VERSION="0.62"
export MONGODB_VERSION="3.6.0"
export NODE_VERSION="v4.8.6"
export NPM_VERSION="4.6.1"
export FIBERS_VERSION="1.0.15"
export ARCHITECTURE="linux-x64"

mkdir -p ~/bin

# # Download nodejs
wget https://nodejs.org/dist/${NODE_VERSION}/node-${NODE_VERSION}-${ARCHITECTURE}.tar.gz
wget https://nodejs.org/dist/${NODE_VERSION}/SHASUMS256.txt.asc

# # Verify nodejs authenticity
grep ${NODE_VERSION}-${ARCHITECTURE}.tar.gz SHASUMS256.txt.asc | shasum -a 256 -c -

# # Install Node
mkdir -p ~/opt
tar xvzf node-${NODE_VERSION}-${ARCHITECTURE}.tar.gz
rm node-${NODE_VERSION}-${ARCHITECTURE}.tar.gz
mv node-${NODE_VERSION}-${ARCHITECTURE} ~/opt/nodejs
ln -s ~/opt/nodejs/bin/node ~/bin/node
ln -s ~/opt/nodejs/bin/npm ~/bin/npm

# Install Node dependencies
npm install -g npm@${NPM_VERSION}
npm install -g node-gyp
npm install -g fibers@${FIBERS_VERSION}


# # Install mongodb
export ARCH_VERSION="$(uname -m)"
wget "https://fastdl.mongodb.org/linux/mongodb-linux-${ARCH_VERSION}-${MONGODB_VERSION}.tgz"
tar -zxvf mongodb-linux-${ARCH_VERSION}-${MONGODB_VERSION}.tgz
rm mongodb-linux-${ARCH_VERSION}-${MONGODB_VERSION}.tgz
mv mongodb-linux-${ARCH_VERSION}-${MONGODB_VERSION} ~/opt/mongodb
export PATH="$HOME/opt/mongodb/bin:$PATH"
# # Create directory for MongoDB database
mkdir -p $HOME/wekan/data/db

# Get wekan release
wget "https://github.com/wekan/wekan/releases/download/v${WEKAN_VERSION}/wekan-${WEKAN_VERSION}.tar.gz"
# extracts into bundle directory
tar xvzf wekan-${WEKAN_VERSION}.tar.gz
# rm wekan-${WEKAN_VERSION}.tar.gz



# # Gosu installation
# export GOSU_ARCHITECTURE="$(dpkg --print-architecture | awk -F- '{ print $NF }')"
# wget -O ~/bin/gosu "https://github.com/tianon/gosu/releases/download/${GOSU_VERSION}/gosu-${GOSU_ARCHITECTURE}"
# wget -O ~/bin/gosu.asc "https://github.com/tianon/gosu/releases/download/${GOSU_VERSION}/gosu-${GOSU_ARCHITECTURE}.asc"
# export GNUPGHOME="$(mktemp -d)"
# gpg --keyserver ha.pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4
# gpg --batch --verify ~/bin/gosu.asc ~/bin/gosu
# rm -R "$GNUPGHOME" ~/bin/gosu.asc
# chmod +x ~/bin/gosu

# # Install meteor
# curl https://install.meteor.com -o ./install_meteor.sh
# sed -i "s|RELEASE=.*|RELEASE=${METEOR_RELEASE}\"\"|g" ./install_meteor.sh
# echo "Starting meteor ${METEOR_RELEASE} installation...   \n"
# sh ./install_meteor.sh

#  BUILD FROM SOURCE
# # Get additional packages
# mkdir -p $HOME/wekan/app/packages
# cd $HOME/wekan/app/packages
# git clone --depth 1 -b master git://github.com/wekan/flow-router.git kadira-flow-router
# git clone --depth 1 -b master git://github.com/meteor-useraccounts/core.git meteor-useraccounts-core
# sed -i 's/api\.versionsFrom/\/\/api.versionsFrom/' $HOME/wekan/app/packages/meteor-useraccounts-core/package.js

# Build app
# cd $HOME/wekan/app
# $HOME/.meteor/meteor add standard-minifier-js
# $HOME/.meteor/meteor npm install
# $HOME/.meteor/meteor build --directory /home/wekan/app_build
# cp $HOME/wekan/app/fix-download-unicode/cfs_access-point.txt $HOME/wekan/app_build/bundle/programs/server/packages/cfs_access-point.js
# sed -i "s|build\/Release\/bson|browser_build\/bson|g" $HOME/wekan/app_build/bundle/programs/server/npm/node_modules/meteor/cfs_gridfs/node_modules/mongodb/node_modules/bson/ext/index.js
# cd $HOME/wekan/app_build/bundle/programs/server/npm/node_modules/meteor/npm-bcrypt
# rm -rf node_modules/bcrypt
# npm install bcrypt
# cd $HOME/wekan/app_build/bundle/programs/server/
# npm install
# npm install bcrypt
# mv $HOME/wekan/app_build/bundle $HOME/wekan/build


# # Cleanup
# rm -R $HOME/.meteor
# rm -R $HOME/wekan/app
# rm -R $HOME/wekan/app_build
# rm $HOME/wekan/install_meteor.sh