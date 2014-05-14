#!/bin/bash

####################################################
## DAVIX 2014 Menu & Branding Setup Script        ##
##                                                ##
## Amanda Gellhouse, Raffael Marty                ##
##                                                ##
## DEVELOPMENT V1.1  13 MAY 2014                  ##
####################################################

# TODO: Default to Gnome Classic

# Setup
export DPMI="/home/davix/davix-packages-manual-install"
export DAVEHM="/home/davix"

# Create local directories for DAVIX user
#mkdir -p $DAVEHM/.local/share/desktop-directories
#mkdir -p $DAVEHM/.local/share/applications
#mkdir -p $DAVEHM/.config/menus

# Move the Menu Items
# ./home/davix/.local/share/applications/
cp $DPMI/davix/install/menus/desktop/* /usr/share/applications

# Move the Menu Directories
# ./home/davix/.local/share/desktop-directories/
cp $DPMI/davix/install/menus/directories/* /usr/share/desktop-directories

# Move the Menu File
# ./home/davix/.config/menus/
cd /etc/xdg/menus
cp gnome-applications.menu gnome-applications.menu.old
cp $DPMI/davix/install/menus/applications.menu gnome-applications.menu

# Set gnome classic as the default interface
/usr/lib/lightdm/lightdm-set-defaults -s gnome-classic -m true -R false -l false

# Fetch the logo and set the desktop 
cd $DPMI/davix/logos
cp davix-2014_black.png $DAVEHM
gsettings set org.gnome.desktop.background primary-color '#000000'
gsettings set org.gnome.desktop.background picture-uri 'file:///home/davix/davix-2014_black.png'
gsettings set org.gnome.desktop.background picture-options 'scaled'

# Move the sample data
cd $DH
mkdir samples
cp $DPMI/davix/install/samples /samples

# Generate the static wiki
gem install gollum-site
git clone https://github.com/secviz/davix.wiki.git /opt/davix/wiki
cd /opt/davix/wiki
gollum-site generate
