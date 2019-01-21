#!/bin/bash

sudo apt-get update && sudo apt-get install -y curl
curl -sSL https://install.pi-hole.net | bash
