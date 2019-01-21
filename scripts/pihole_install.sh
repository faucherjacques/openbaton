#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

#wget -O - http://get.openbaton.org/public.gpg.key | apt-key add -
apt-get update && apt-get upgrade -y
#apt-get install -y git ems curl
apt-get install screen dialog -y

#screen curl -sSL https://install.pi-hole.net | bash
wget https://install.pi-hole.net -O pihole.sh
chmod +x pihole.sh
./pihole.sh
