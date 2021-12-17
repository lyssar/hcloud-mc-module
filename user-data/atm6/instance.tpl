#!/bin/bash
apt-get update
apt-get install -y \
    whois \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common \
    openjdk-11-jre-headless


useradd -m -p ${user_password} -s /bin/bash minecraft
mkdir -p /var/log/minecraft
mkdir -p /home/minecraft
mv ~/.minecraft /home/minecraft/.minecraft
chown -R minecraft:minecraft /home/minecraft/.minecraft
chown -R minecraft:minecraft /var/log/minecraft
chmod ugo+x /home/minecraft/.minecraft/startserver.sh

systemctl daemon-reload

systemctl start mcserver.service
systemctl enable mcserver.service

# versionInfoJson=$(curl -s https://launchermeta.mojang.com/mc/game/version_manifest.json | yq eval '.versions.[] | select(.id == "1.16.5" and .type == "release").url' -)
# serverJar=$(curl -s $versionInfoJson | yq eval '.downloads.server.url')

# wget $serverJar -O ./server.jar

# ./startserver.sh 1> /var/log/minecraft/server.log 2> /var/log/minecraft/server-error.log