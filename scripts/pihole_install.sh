#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

echo "test" > /home/ubuntu/step1.txt

wget -O - http://get.openbaton.org/public.gpg.key | apt-key add -
sudo apt-get update && sudo apt-get upgrade -y
#apt-get install -y git ems curl

echo "test" > /home/ubuntu/step2.txt

sudo apt-get install screen dialog -y

echo "test" > /home/ubuntu/step3.txt

#screen curl -sSL https://install.pi-hole.net | bash
sudo wget https://install.pi-hole.net -O /home/ubuntu/pihole.sh
sudo chmod +x /home/ubuntu/pihole.sh
#sudo ./pihole.sh
