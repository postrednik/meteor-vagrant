#!/usr/bin/env bash

rm -Rf ~/dummyapp/.meteor/local/
mkdir -p ~/dummyapp/.meteor/local/
rm -Rf /vagrant/.meteor/local/
mkdir -p /vagrant/.meteor/local/

sudo mount --bind ~/dummyapp/.meteor/local /vagrant/.meteor/local

cd /vagrant

nohup meteor > .vagrant/meteor.log &
