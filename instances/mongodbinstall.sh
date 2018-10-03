#!/bin/bash

mkdir /mongodb
echo '/dev/sdb	/mongodb  ext4	defaults  0 0' >> /etc/fstab
mount -a

cat << EOF > /etc/mongod.conf
# mongod.conf

# for documentation of all options, see:
#   http://docs.mongodb.org/manual/reference/configuration-options/

# where to write logging data.
systemLog:
  destination: file
  logAppend: true
  path: /var/log/mongodb/mongod.log

# Where and how to store data.
storage:
  dbPath: /mongodb
  journal:
    enabled: true
#  engine:
#  mmapv1:
#  wiredTiger:

# how the process runs
processManagement:
  fork: true  # fork and run in background
  pidFilePath: /var/run/mongodb/mongod.pid  # location of pidfile

# network interfaces
net:
  port: 27017
  bindIp: 0.0.0.0  # Listen to local interface only, comment to listen on all interfaces.

EOF

chown mongod:mongod /mongodb
chmod 755 -Rf /mongodb

setenforce 0

systemctl enable mongod
systemctl restart mongod

systemctl disable firewalld
systemctl stop firewalld

