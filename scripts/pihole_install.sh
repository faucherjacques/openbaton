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
#sudo wget https://install.pi-hole.net -O /home/ubuntu/pihole.sh
#sudo chmod +x /home/ubuntu/pihole.sh

#sudo /home/ubuntu/pihole.sh <- This is where it doesn't work

#TODO: create /etc/pihole/setupVars.conf
# This means we need to extract our IPv4 address

sudo mkdir /etc/pihole

sudo cat > /etc/pihole/setupVars.conf <<EOF
WEBPASSWORD=a215bae8b5ec659b0980a76dlkds09644731cd439cab41494447a8705c22b3aa41c
PIHOLE_INTERFACE=eth0
IPV4_ADDRESS=$private/24 #To be changed by the proper one
QUERY_LOGGING=true
INSTALL_WEB=true
DNSMASQ_LISTENING=single
PIHOLE_DNS_1=8.8.8.8
PIHOLE_DNS_2=8.8.4.4
DNS_FQDN_REQUIRED=true
DNS_BOGUS_PRIV=true
DNSSEC=true
TEMPERATUREUNIT=C
WEBUIBOXEDLAYOUT=traditional
API_EXCLUDE_DOMAINS=
API_EXCLUDE_CLIENTS=
API_QUERY_LOG_SHOW=all
API_PRIVACY_MODE=false
EOF

cat > /home/ubuntu/testcat.txt <<EOF
IPADDR=$private
FLOATING=$private_floatingIp
EOF

#This works as long as setupVars exists
#sudo /home/ubuntu/pihole.sh | bash /dev/stdin --unattended
