#!/bin/bash

# This script changes the hostname of ec2 AMI linux hostname even after the reboot


echo " please enter the FQDN name"

read FQDN

echo "$FQDN" >testcut.txt

HOSTFILE="testcut.txt"

HOST="`cut -d'.' -f1 testcut.txt`"


# this saves backup of exisiting file
cp /etc/hosts "/etc/hosts.`date`"
cp /etc/sysconfig/network "/etc/sysconfig/network.`date`"


# replace the network file with fqdn
sed -i.bak "s/localhost.localdomain/$FQDN/" /etc/sysconfig/network 

# replace the localhostf file

sed -i.bak "s/127.0.0.1   localhost/127.0.0.1   $FQDN $HOST localhost/" /etc/hosts

