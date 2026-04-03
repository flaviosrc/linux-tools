#!/bin/bash

echo "Instructions to setup bridge network interface

- install bridge-utils:
apt install bridge-utils

- edit interfaces file:
vi /etc/network/interfaces

- set nic to manual mode:
auto enp2s0
iface enp2s0 inet manual

- setup the bridge interface with default parameters:
auto br0
iface br0 inet dhcp
    bridge_ports enp2s0
    bridge_fd 0         #set bridge forwarding delay to 0
    bridge_stp off      #disable spannning tree protocol
    bridge_waitport 0   #set waiting time for port become ative to 0

- restart networking service
systemctl restart networking

- notes
'Error starting domain:while connecting to monitor:Spice' this error occours when using spice with bridge nic without route address
solution: change vm spice 'Listen type' setting from 'address' to 'None'

if vnet is not working after 'systemctl restart networking.service', do 'systemctl restart libvirtd'"
