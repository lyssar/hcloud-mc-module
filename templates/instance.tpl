#!/bin/bash

msdcliFileURL="https://github.com/lyssar/msdcli/releases/download/${msdcli_version}/msdcli-amd64"

apt-get update
apt-get install -y \
    whois \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common \
    openjdk-${server_java_version}-jre-headless

user_password=$(perl -e 'print crypt($ARGV[0], "password")' "oxofrmbl")

curl -Lo /usr/local/bin/msdcli $msdcliFileURL
chmod +x /usr/local/bin/msdcli

useradd -m -p ${user_password} -s /bin/bash minecraft
mkdir -p /var/log/minecraft/${intance_name}
mkdir -p /home/minecraft/instances/${intance_name}
chown -R minecraft:minecraft /home/minecraft/instances/${intance_name}
chown -R minecraft:minecraft /var/log/minecraft/${intance_name}
chmod ugo+x /home/minecraft/instances/${intance_name}/*.sh
