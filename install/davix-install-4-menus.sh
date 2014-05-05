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

# TODO: Default to Gnome Classic

# Setup
export DPMI="/home/davix/davix-packages-manual-install"
export DAVEHM="/home/davix"

# Create local directories for DAVIX user
mkdir -p $DAVEHM/.local/share/desktop-directories
mkdir -p $DAVEHM/.local/share/applications
mkdir -p $DAVEHM/.config/menus

# Move the Menu Items
# ./home/davix/.local/share/applications/
cp $DPMI/davix/install/menus/desktop/* $DAVEHM/.local/share/applications

# Move the Menu Directories
# ./home/davix/.local/share/desktop-directories/
cp $DPMI/davix/install/menus/directories/* $DAVEHM/.local/share/desktop-directories

# Move the Menu File
# ./home/davix/.config/menus/
cp $DPMI/davix/install/menus/applications.menu $DAVEHM/.config/menus

# Fetch the logo and set the desktop 
cd $DPMI/davix/logos
cp davix-2014_white.png $DH
gsettings set org.gnome.desktop.background primary-color '#ffffff'
gsettings set org.gnome.desktop.background picture-uri 'file:///opt/davix/davix-2014_white.png'
gsettings set org.gnome.desktop.background picture-options 'scaled'
