#!/bin/bash

####################################################
## DAVIX 2014 Menu & Branding Setup Script        ##
##                                                ##
## V1.2  6 JULY 2015                              ##
####################################################

# Setup
export DPMI="/home/davix/davix-packages-manual-install"
export DAVEHM="/home/davix"

# Create local directories for DAVIX user
mkdir -p $DAVEHM/.local/share/desktop-directories
mkdir -p $DAVEHM/.local/share/applications
mkdir -p $DAVEHM/.config/menus

# Move the Menu Items
cp $DPMI/davix/install/menus/desktop/* $DAVEHM/.local/share/applications/

# Move the Menu Directories
cp $DPMI/davix/install/menus/directories/* $DAVEHM/.local/share/desktop-directories/

cp $DPMI/davix/install/menus/lxde-applications.menu $DAVEHM/.config/menus/

sudo -u davix lxpanelctl restart

# put cmd-line file help in place
cp -r $DPMI/davix/install/cmdline-help /opt/davix/

# autologin / etc.
cp $DPMI/davix/install/config/lxdm.conf /etc/lxdm/lxdm.conf

# Background
cp $DPMI/davix/logos/davix-2014_black.png $DAVEHM
sed -i 's/wallpaper=.*/wallpaper=\/home\/davix\/davix-2014_black.png/g' /usr/share/lxde/pcmanfm/LXDE.conf

# Sync and generate the static wiki
mkdir -p /opt/davix/wiki
git clone https://github.com/secviz/davix.wiki.git /opt/davix/wiki
cd /opt/davix/wiki
gollum-site import
gollum-site generate --working
