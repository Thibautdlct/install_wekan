#!/bin/bash
# START APP
export MONGO_URL="mongodb://localhost:27017"
export PORT=60835
export ROOT_URL="http://localhost:$PORT"
# # Start mongodb
mongod --dbpath $HOME/wekan/data/db &
cd ~/wekan/bundle
node main.js &

