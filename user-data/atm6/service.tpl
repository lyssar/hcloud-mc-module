[Unit]
Description=MC Server service
After=syslog.target network.target

[Service]
SuccessExitStatus=143

User=minecraft
Group=minecraft
TimeoutSec=1800
Type=forking

WorkingDirectory=/home/minecraft/.minecraft
ExecStart=/home/minecraft/.minecraft/startserver.sh
ExecStop=/bin/kill -15 $MAINPID


[Install]
WantedBy=multi-user.target