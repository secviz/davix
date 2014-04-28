#!/bin/sh

####################################################
## DAVIX Installation Script                      ##
##                                                ##
## Raffael Marty, Amanda Gellhouse                ##
##                                                ##
## DEVELOPMENT v1.0 27 APR 2014                   ##
####################################################


function check_root() {
    if [[ "$USER" != "root" ]]; then
        echo "please run as: sudo $0"
        exit 1
    fi
}

# Setup the directories
mkdir -p /opt/davix
mkdir -p /home/davix/davix-packages-manual-install


# Clone the DAVIX repository
cd /home/davix/davix-packages-manual-install
git clone https://github.com/secviz/davix/
cd davix/install


# Run the scripts
bash davix-install-1-apt-get.sh
bash davix-install-2-manual.sh
bash davix-install-3-R.sh
bash davix-config.sh


# Cleanup Manual Directories
cd /home/davix
rm -rf davix-packages-manual-install


# Cleanup apt-get
apt-get clean

