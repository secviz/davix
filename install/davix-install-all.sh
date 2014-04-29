#!/bin/bash

####################################################
## DAVIX Installation Script                      ##
##                                                ##
## Raffael Marty, Amanda Gellhouse                ##
##                                                ##
## DEVELOPMENT v1.0.1 28 APR 2014                 ##
####################################################

if [[ "$USER" != "root" ]]; then
    echo "please run as: sudo $0"
    exit 1
fi

# Checking for correct base version of Base OS
. /etc/lsb-release
if [[ "$DISTRIB_ID" -ne "Ubuntu" || "x$DISTRIB_RELEASE" != "x13.10" ]]; then
    if [ -z "$OVERWRITE_VERSION" ]; then
        echo "Please use Ubuntu 13.10 as a base release."
        echo "You can overwrite this requirement by setting OVERWRITE_VERSION to 1"
        exit 1
    fi
fi 

# Setup the directories
mkdir -p /opt/davix
mkdir -p /home/davix/davix-packages-manual-install


# Install git
apt-get -y install git


# Clone the DAVIX repository
cd $DPMI
git clone https://github.com/secviz/davix/
cd davix/install


# Run the scripts
sh ./davix-install-1-apt-get.sh
sh ./davix-install-2-manual.sh
sh ./davix-install-3-R.sh
sh ./davix-config.sh


# Cleanup Manual Directories
rm -rf /home/davix/davix-packages-manual-install


# Cleanup apt-get
apt-get clean

