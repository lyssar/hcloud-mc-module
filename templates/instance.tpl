#!/bin/bash

mcdownloaderFileURL="https://github.com/lyssar/mcdownloader/releases/download/${mc_download_version}/mcdownloader"

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

curl -o /usr/local/bin/mcdownloader $mcdownloaderFileURL
chmod +x /usr/local/bin/mcdownloader

useradd -m -p ${user_password} -s /bin/bash minecraft
mkdir -p /var/log/minecraft/${intance_name}
mkdir -p /home/minecraft/instances/${intance_name}
chown -R minecraft:minecraft /home/minecraft/instances/${intance_name}
chown -R minecraft:minecraft /var/log/minecraft/${intance_name}
chmod ugo+x /home/minecraft/instances/${intance_name}/*.sh
