#!/bin/bash
# This script sets required options, starts mongodb and wekan

# Wekan can afterwards be requested at PORT
export PORT=60835
# Used eg. for the links in emails
export ROOT_URL="http://localhost:$PORT"
# Wekan uses MONGO_URL to connect to mongodb
export MONGO_URL="mongodb://localhost:27017"

## Start mongodb
$HOME/opt/mongodb/bin/mongod --dbpath $HOME/wekan/data/db --bind_ip 127.0.0.1 &
# FIXME: Mongodb starts with following warnings:
# ** WARNING: Access control is not enabled for the database.
# Read and write access to data and configuration is unrestricted.
# ** WARNING: /sys/kernel/mm/transparent_hugepage/enabled is 'always'.
# **        We suggest setting it to 'never'


## Start wekan
$HOME/bin/node $HOME/wekan/bundle/main.js &

