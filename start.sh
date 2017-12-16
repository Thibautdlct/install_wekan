#!/bin/bash
# This script sets required options, starts mongodb and wekan

export MONGO_URL="mongodb://localhost:27017"
export PORT=60835
export ROOT_URL="http://localhost:$PORT"

## Start mongodb
mongod --dbpath $HOME/wekan/data/db &

## Start wekan
node $HOME/wekan/bundle/main.js &

