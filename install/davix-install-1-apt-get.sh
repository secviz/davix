#!/bin/sh

####################################################
## DAVIX Base Application Installation Script     ##
## DAVIX Core Applications                        ##
##                                                ##
## Raffael Marty                                  ##
##                                                ##
## DEVELOPMENT v1.4   4 JULY 2016                 ##
####################################################

apt-get update
apt-get -y -u upgrade
apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 16126D3A3E5C1192
apt-get -y remove ubuntu-minimal

## OS Basics
# apt-get -y install geeqie gnome-desktop-environment 
apt-get -y install software-properties-common
add-apt-repository -y ppa:openjdk-r/ppa
apt-get -y install openjdk-8-jre-lib openjdk-8-jdk recode sharutils sqlite3 \
           terminator udns-utils default-jre unrar
apt-get -y install cvs subversion
apt-get -y install dns-browse exuberant-ctags java3ds-fileloader
apt-get -y install joe vim
apt-get -y install ftpd lftp lynx ncftp curl
apt-get -y install python python-dev python-geoip python-gnuplot ipython
apt-get -y install subversion tor winbind 
# Make it visual
apt-get -y install xorg firefox lxde

## Required for Manual Installs
apt-get -y install flex bison cmake ruby build-essential libjpeg62
apt-get -y install libmagic-dev libgeoip-dev libssl-dev swig2.0 libssl0.9.8
apt-get -y install libjava3d-java libjava3d-java-doc libjava3d-jni # Walrus
apt-get -y install python-visual # RT Graph 3D
apt-get -y install libpcap # Netgrok
apt-get -y install ruby-dev # Gollum-site static wiki
apt-get -y install libxml-writer-perl # prads2snort
apt-get -y install libldns-dev # passivedns
apt-get -y install liblognorm-dev # liblognorm
apt-get -y install pyqt4-dev-tools
apt-get -y install libncurses5-dev librrds-perl # argus
apt-get -y install lsb-core # google earth
apt-get -y install libxtst6:i386 # processing
apt-get -y install libtext-csv-perl # afterglow
apt-get -y install tk-dev tcl-dibgd-dev libjpeg-dev libpng12-dev libxaw7-dev bison flex autotools-dev pdksh libexpat1-dev libfontconfig1-dev libltdl3-dev swig libperl-dev libgd2-noxpm-dev quilt groff-base ghostscript libcairo2-dev libpango1.0-dev guile-1.8-dev d-shlibs librsvg2-dev libgtkglext1-dev libglade2-dev libgts-dev freeglut3-dev liblualib50-dev fonts-liberation libcgraph5 libgvpr1 # graphviz
apt-get -y install libglew-dev  libfreetype6-dev libqt4-dev # tulip
apt-get -y install circos  # circos
apt-get -y install python-pip # elasticsearch access

## Services
apt-get -y install apache2-mpm-prefork mysql-client ntp openssh-server
# installing mysql-server
DEBIAN_FRONTEND=noninteractive apt-get -y install mysql-server
mysql_install_db 
sleep 3 
/usr/bin/mysqld_safe &
sleep 2 
/usr/bin/mysqladmin -u root password 'davix'
# needs mysql running!
apt-get -y install prelude-manager
/usr/bin/mysqladmin -uroot -pdavix shutdown

## DAVIX Packages
apt-get -y install chaosreader dnstop etherape geoip-database geoip-bin ggobi gnuplot googleearth-package
apt-get -y install whois gwhois mrtg libpcap-dev netcat netexpect netrw netsed nfdump ngrep nmap octave octave-image
apt-get -y install octave-linear-algebra octave-mapping octave-nan octave-plplot octave-splines octave-tsa qtoctave
apt-get -y install pads picviz ploticus prads python-scapy rrdtool rsyslog sagan snort socat syslog-ng
apt-get -y install tcpdump tcpflow tcpreplay tcpslice tcpstat tcpxtract tshark ttt wireshark zenmap
apt-get -y install gource

DEBIAN_FRONTEND=noninteractive apt-get -y install ntop
echo "ntop    ntop/admin_password password    davix" >> ntop.conf
echo "ntop    ntop/admin_password_again   password    davix" >> ntop.conf
echo "ntop    ntop/interfaces string  eth0" >> ntop.conf
debconf-set-selections < ntop.conf

# Installing Google Earth
wget https://dl.google.com/dl/earth/client/current/google-earth-stable_current_amd64.deb
dpkg -i google-*.deb

# Gollum-site for wiki
gem install gollum-site

# CSVKit
pip install csvkit
