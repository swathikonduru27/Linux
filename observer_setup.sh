#!/bin/bash
set -x

sudo apt-get install -y nfs-common
sudo apt-get update

sudo mkdir /var/webserver_monitor
sudo chown nobody:nogroup /var/webserver_monitor

sudo mount 192.168.1.1:/var/webserver_log /var/webserver_monitor
cd /var/webserver_monitor
sudo touch unauthorized.log
sudo chmod -x monitor.sh
