#!/bin/bash
# This script sets required options, starts mongodb and wekan

# Wekan can afterwards be requested at PORT
export PORT=60835
# Used eg. for the links in emails
export ROOT_URL="http://localhost:$PORT"
# Wekan uses MONGO_URL to connect to mongodb
export MONGO_URL="mongodb://localhost:27017"

## Start mongodb
$HOME/opt/mongodb/bin/mongod --dbpath $HOME/wekan/data/db &

## Start wekan
$HOME/bin/node $HOME/wekan/bundle/main.js &

