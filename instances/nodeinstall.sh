#!/bin/bash

yum install -y gcc-c++ make git
curl -sL https://rpm.nodesource.com/setup_8.x | sudo -E bash -

# Install nodejs
yum install nodejs -y

# Install PM2
npm install pm2@latest -g

# Clone example todo app
git clone https://github.com/scotch-io/node-todo

# Change directory
cd node-todo

# Install dependencies
npm install

# Update database config
cat << EOF > config/database.js
module.exports = {
    remoteUrl : 'mongodb://192.168.1.5:27017/uwO3mypu',
    localUrl: 'mongodb://192.168.1.5:27017/meanstacktutorials'
};
EOF

# Start app
pm2 start server.js

# Install app as a service
pm2 startup systemd

systemctl disable firewalld
systemctl stop firewalld
