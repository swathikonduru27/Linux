#!/bin/bash
set -x
sudo apt update
sudo apt install -y nfs-common
sleep 5m
sudo mkdir webserver_log
sudo mount 192.168.1.1:/share/log webserver_log/
