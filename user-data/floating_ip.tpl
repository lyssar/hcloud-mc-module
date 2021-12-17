network:
    version: 2
    renderer: networkd
    ethernets:
        eth0:
            addresses:
                - ${server_pub_ip}/32
