#!/bin/bash

####################################################
## DAVIX 2014 Menu & Branding Setup Script        ##
##                                                ##
## Amanda Gellhouse, Raffael Marty                ##
##                                                ##
## DEVELOPMENT V1.0 27 APR 2014                   ##
####################################################

# init
function pause(){
    read -p "$*"
}

# Install Gnome Classic
apt-get -y install gnome-session-fallback

# TODO: Default to Gnome Classic

# Setup
export DPMI="/home/davix/davix-packages-manual-install"
export DAVHM="/home/davix"

# Create local directories for DAVIX user
mkdir -p $DAVEHM/.local/share/desktop-directories
mkdir -p $DAVEHM/.local/share/applications
mkdir -p $DAVEHM/.config/menus

# Move the Menu Items
# ./home/davix/.local/share/applications/
mv $DPMI/davix/install/menus/desktop/* $DAVEHM/.local/share/applications

# Move the Menu Directories
# ./home/davix/.local/share/desktop-directories/
mv $DPMI/davix/install/menus/directories/* $DAVEHM/.local/share/desktop-directories

# Move the Menu File
# ./home/davix/.config/menus/
mv $DPMI/davix/install/menus/applications.menu $DAVEHM/.config/menus

# Fetch the logo and set the desktop 
cd $DPMI/davix/logos
gsettings set org.gnome.desktop.primary-color='FFFFFF'
gsettings set org.gnome.desktop.background picture-uri davix-2014_white.png
gsettings set org.gnome.desktop.picture-options='wallpaper'
