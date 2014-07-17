#!/bin/bash

####################################################
## DAVIX Installation Script                      ##
##                                                ##
## Raffael Marty, Amanda Gellhouse                ##
##                                                ##
## DEVELOPMENT v1.0.2 3 MAY 2014                  ##
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


# create davix group
if ! getent group davix >/dev/null; then
    groupadd -r davix
fi

# create davix user
if ! getent passwd davix >/dev/null; then
    useradd -m -g davix -d /home/davix \
            -s /bin/bash -c "DAVIX User" davix
fi

# make davix a sudoer
adduser davix sudo
# set password for davix
echo 'davix:davix' | chpasswd
# allow davix to sudo without password
sed -ie 's/^%sudo.*/%sudo   ALL=(ALL:ALL) NOPASSWD:ALL/' /etc/sudoers

# Add path to scripts
echo "export PATH=$PATH:/opt/davix/scripts/:/opt/davix/parsers" >> ~/.profile

# Setup the directories
mkdir -p /opt/davix
export DPMI="/home/davix/davix-packages-manual-install"
mkdir -p $DPMI


# Install git
apt-get -y install git


# Clone the DAVIX repository
cd $DPMI
git clone https://github.com/secviz/davix/


# Run the scripts
. $DPMI/davix/install/davix-install-1-apt-get.sh
. $DPMI/davix/install/davix-install-2-manual.sh
. $DPMI/davix/install/davix-install-3-R.sh
sudo -u davix sh -c . $DPMI/davix/install/davix-install-4-menus.sh
. $DPMI/davix/install/davix-config.sh


# Cleanup Manual Directories
rm -rf $DPMI


# Cleanup apt-get
apt-get clean

