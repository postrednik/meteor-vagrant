#!/usr/bin/env bash

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10
echo "deb http://repo.mongodb.org/apt/debian "$(lsb_release -sc)"/mongodb-org/3.0 main" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.0.list
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y git mongodb-org build-essential g++

curl https://raw.githubusercontent.com/creationix/nvm/v0.24.0/install.sh | bash

source .bashrc

nvm install 0.12.0
nvm alias default 0.12.0
nvm use default

curl https://install.meteor.com | /bin/sh

meteor create ~/dummyapp

echo "cd /vagrant" >> ~/.bashrc
