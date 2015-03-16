#!/bin/sh

# vagrant platform for meteor - install script
#
# install it using terminal:
#		curl -f https://raw.githubusercontent.com/postrednik/meteor-vagrant/master/install.sh | sh
#
# homepage & documentation: https://github.com/postrednik/meteor-vagrant
#
# Copyright (c) 2015 Rostislav Postrednik
# license: MIT

INSTALL_URL="https://raw.githubusercontent.com/postrednik/meteor-vagrant/master"
VAGRANTFILE_URL="$INSTALL_URL/Vagrantfile"
VAGRANTDIR_URL="$INSTALL_URL/vagrant"

echo "downloading package files"

curl "$VAGRANTFILE_URL" -o "Vagrantfile"
mkdir -p vagrant/
curl "$VAGRANTDIR_URL/{config.yaml,meteor.rb,provision.sh,init-meteor.sh}" -o "vagrant/#1"

echo "adding records to .gitignore"
cat >> .gitignore <<GITIGNORE
.vagrant/
vagrant/
Vagrantfile
GITIGNORE

echo "installation completed"
echo "now you can run: vagrant up"
