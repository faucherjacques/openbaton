#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

touch step1.txt

#wget -O - http://get.openbaton.org/public.gpg.key | apt-key add -
sudo apt-get update && sudo apt-get upgrade -y
#apt-get install -y git ems curl
sudo apt-get install screen dialog -y

touch step2.txt

#screen curl -sSL https://install.pi-hole.net | bash
wget https://install.pi-hole.net -O pihole.sh
chmod +x pihole.sh
./pihole.sh
