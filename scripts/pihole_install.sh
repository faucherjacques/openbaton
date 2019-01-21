#!/bin/bash

wget -O - http://get.openbaton.org/public.gpg.key | apt-key add -
sudo apt-get update
sudo apt-get install -y git ems curl
curl -sSL https://install.pi-hole.net | bash
