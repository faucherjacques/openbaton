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

sudo cat > /etc/pihole/setupVars.conf <<EOF
WEBPASSWORD=a215bae8b5ec659b0980a76dlkds09644731cd439cab41494447a8705c22b3aa41c
PIHOLE_INTERFACE=eth0
IPV4_ADDRESS=192.168.1.250/24 #To be changed by the proper one
IPV6_ADDRESS=2601:444:8111:403:55d6:2f11:41bf:13bb #To be removed
QUERY_LOGGING=true
INSTALL_WEB=true
DNSMASQ_LISTENING=single
PIHOLE_DNS_1=208.67.222.222 #To be changed to google's
PIHOLE_DNS_2=208.67.220.220
PIHOLE_DNS_3=2620:0:ccc::2 #To be removed
PIHOLE_DNS_4=2620:0:ccd::2 #To be removed
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

#This works as long as setupVars exists
#sudo /home/ubuntu/pihole.sh --unattended

curl -sSL https://install.pi-hole.net | bash /dev/stdin --unattended