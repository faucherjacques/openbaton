#!/bin/bash

#wget -O - http://get.openbaton.org/public.gpg.key | apt-key add -
apt-get update && apt-get upgrade -y
#apt-get install -y git ems curl
apt-get install screen dialog -y

screen curl -sSL https://install.pi-hole.net | bash
