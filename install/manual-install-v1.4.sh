#!/bin/bash

####################################################
## DAVIX 2014 Application Installation Script     ##
## DAVIX 2014 Core Applications                   ##
##                                                ##
## Raffael Marty, Amanda Gellhouse, Edward McCabe ##
##                                                ##
## DEVELOPMENT V1.4.01 20 APR 2014                ##
####################################################

# init
function pause(){
	read -p "$*"
}

# Setup and prep

mkdir -p /opt/davix
mkdir -p /home/davix/davix-packages-manual-install

export DH="/opt/davix"
export DPMI="/home/davix/davix-packages-manual-install"
export LibMagic_LIBRARY="/usr/lib/i386-linux-gnu/"
export LibMagic_INCLUDE_DIR="/usr/lib/i386-linux-gnu/"

# Build the directory structure
cd $DPMI
mkdir p0f argus pulledpork BroIDS jquery-sparklines nsm-console eventlog TreeMap Cytoscape Mondrian TNV Parvis Timesearcher1 walrus PerlPackages GUESS NVisionIP InetVis processing PyInline Rumint gltail Rstudio RPackages FlowTag tcpdump INAV NetGrok SeedsOfContempt


# pause 'Press [Enter] key to continue...'

# Start downloading, unpacking and installing associated packages and their dependencies.

# LOGSTASH
mkdir $DH/logstash
wget -c https://download.elasticsearch.org/logstash/logstash/logstash-1.2.2-flatjar.jar -o $DH/logstash/logstash-1.2.2-flatjar.jar

# pause 'Press [Enter] key to continue...'

# Build the base configuration file
 echo "input {" >> $DH/logstash/logstash.conf
 echo "  file {" >> $DH/logstash/logstash.conf
 echo "    type => \"syslog\" " >> $DH/logstash/logstash.conf
 echo " " >> $DH/logstash/logstash.conf
 echo "    path => [ \"/var/log/syslog\" ]" >> $DH/logstash/logstash.conf 
 echo "  }" >> $DH/logstash/logstash.conf
 echo "}" >> $DH/logstash/logstash.conf
 echo " " >> $DH/logstash/logstash.conf
 echo "output {" >> $DH/logstash/logstash.conf
 echo " stdout { }" >> $DH/logstash/logstash.conf
 echo "  elasticsearch { embedded => true }" >> $DH/logstash/logstash.conf
 echo "}" >> $DH/logstash/logstash.conf

# pause 'Press [Enter] key to continue...'

## p0f
cd $DPMI/p0f/
wget -c http://lcamtuf.coredump.cx/p0f3/releases/p0f-3.06b.tgz
tar -xvpf p0f-3.06b.tgz
 cd p0f-3.06b
 ./build.sh
 mkdir -p $DH/p0f/bin
 mv docs $DH/p0f
 mv p0f $DH/p0f/bin
cd tools/
 make p0f-sendsyn
 make p0f-sendsyn6 
 make p0f-client
 mv p0f-sendsyn $DH/p0f/bin
 mv p0f-sendsyn6 $DH/p0f/bin
 mv p0f-client $DH/p0f/bin

# pause 'Press [Enter] key to continue...'

## Argus Server
cd $DPMI/argus
wget -c http://qosient.com/argus/src/argus-3.0.6.1.tar.gz
wget -c http://qosient.com/argus/src/argus-clients-3.0.6.2.tar.gz
tar -xvpf argus-3.0.6.1.tar.gz 
tar -xvpf argus-clients-3.0.6.2.tar.gz 
cd argus-3.0.6.1/
./configure --prefix=$DH/argus-server
make
make install
 
# pause 'Press [Enter] key to continue...'

## Argus Client
cd $DPMI/argus-clients-3.0.6.2/
 ./configure --prefix=$DH/argus-client
 make
 make install

# pause 'Press [Enter] key to continue...'

## Good install BROIDS
cd $DPMI/BroIDS
wget -c http://www.bro.org/downloads/release/bro-2.2.tar.gz
tar -xvpf bro-2.2.tar.gz
cd bro-2.2
 ./configure --prefix=$DH/broids
 make
 make install
 make clean

# pause 'Press [Enter] key to continue...'

## pulled pork snort rules updater
cd $DPMI/pulledpork/
wget -c http://pulledpork.googlecode.com/files/pulledpork-0.7.0.tar.gz
tar -xvpf pulledpork-0.7.0.tar.gz

# pause 'Press [Enter] key to continue...'

## tcpdump 4.4.0 & libcap 1.4.0
cd $DPMI/tcpdump 
wget -c http://www.tcpdump.org/release/tcpdump-4.4.0.tar.gz
wget -c http://www.tcpdump.org/release/libpcap-1.4.0.tar.gz
tar -xvpf tcpdump-4.4.0.tar.gz
tar -xvpf libpcap-1.4.0.tar.gz
cd libpcap-1.4.0/
 ./configure --prefix=$DH/tcpdump
 make
 make install
cd $DPMI/tcpdump-4.4.0/
 ./configure --prefix=$DH/tcpdump
 make
 make install

# pause 'Press [Enter] key to continue...'

# JQUERY-SPARKLINES
# Good Install
mkdir -p $DH/jquery-sparkline/
wget -c http://omnipotent.net/jquery.sparkline/2.1.2/jquery.sparkline.js
 chmod +x jquery.sparkline.js

# pause 'Press [Enter] key to continue...'

# Seeds of Contempt
# TODO: Fix this one
# http://seedsofcontempt.googlecode.com/svn/trunk/seedsofcontempt-read-only

# pause 'Press [Enter] key to continue...'

# NSM-CONSOLE
# Good Install
cd $DPMI/nsm-console
wget -c http://writequit.org/projects/nsm-console/files/nsm-console-0.7.tar.gz
tar -xvpf nsm-console-0.7.tar.gz
 mv nsm-console/ $DH

# pause 'Press [Enter] key to continue...'

# EVENTLOG
cd $DPMI/eventlog
wget -c https://www.balabit.com/downloads/files/eventlog/0.2/eventlog-0.2.4.tar.gz
tar -xvpf eventlog-0.2.4.tar.gz
mkdir -p $DH/eventlog
cd eventlog-0.2.4
 ./configure --prefix=$DH/eventlog
 make
 make install

# pause 'Press [Enter] key to continue...'

## TreeMap
cd $DPMI/TreeMap
wget -c http://www.cs.umd.edu/hcil/treemap/demos/Treemap-4.1.2.zip
unzip Treemap-4.1.2.zip

## TNV
# Good Install
cd $DPMI/TNV
wget -c http://sourceforge.net/projects/tnv/files/tnv/0.3.9/tnv_java_0.3.9.zip
unzip tnv_java_0.3.9.zip
 mv tnv-0.3.9 $DH

# pause 'Press [Enter] key to continue...'

## AFTERGLOW
 git clone https://github.com/zrlram/afterglow $DH/afterglow

# pause 'Press [Enter] key to continue...'

cd $DPMI/PerlPackages
wget -c http://download2.advsofteng.com/chartdir_perl_linux.tar.gz
tar -xvpf chartdir_perl_linux.tar.gz
# Add to perl @INC Path
 mv ChartDirector /usr/lib/perl5/
 cpan -i Crypt::SSLeay
 cpan -i IP::Anonymous
 cpan -i Crypt::Rijndael
 cpan -i Test::Manifest

# pause 'Press [Enter] key to continue...'

cd $DPMI/Parvis
wget -c http://www.mediavirus.org/parvis/parvis-0.3.1.zip
unzip parvis-0.3.1.zip
 cp parvis.bat parvish.sh
chmod +x parvish.sh
 cd ..
 mv $DPMI/Parvis $DH/

# pause 'Press [Enter] key to continue...'

cd $DPMI/Timesearcher1
wget -c http://www.cs.umd.edu/hcil/timesearcher/dist/ts1.3.7.tar.gz
wget -c http://www.cs.umd.edu/hcil/timesearcher/dist2/demos_4Gf5x/ts-2.4.zip
tar -xvpf ts1.3.7.tar.gz
 mv ts1.3.7 $DH/

# pause 'Press [Enter] key to continue...'

# INAV
cd ../INAV
wget -c http://inav.scaparra.com/files/server/INAV-Server\(current\).tar.gz
tar -xvpf INAV-Server\(current\).tar.gz
wget -c http://inav.scaparra.com/files/client/INAV-0.13.jar
cd INAV-Server-0.3.7/server
apt-get install libcap-ng-dev
make

# pause 'Press [Enter] key to continue...'

cd $DPMI/Mondrian
wget -c http://stats.math.uni-augsburg.de/mondrian/Mondrian.jar
mkdir -p $DH/Mondrian
mv Mondrian.jar $DH/Mondrian/Mondrian.jar

# pause 'Press [Enter] key to continue...'

cd $DPMI/GUESS
wget -c http://sourceforge.net/projects/guess/files/guess/guess-1.0.3-beta/guess-20070813.zip
unzip guess-20070813.zip
 mkdir -p $DH/guess

 echo "#!/bin/sh" >> $DH/guess/guess.sh
 echo "" >> $DH/guess/guess.sh
 echo "export GUESS_HOME=$DH/guess">> $DH/guess/guess.sh
 echo "" >> $DH/guess/guess.sh
 echo "export GUESS_LIB\"$GUESS_HOME/lib\" ">> $DH/guess/guess.sh
 echo "">> $DH/guess/guess.sh
 echo "export GCLASSPATH=\"$GUESS_LIB/guess.jar:$GUESS_LIB/piccolo.jar:$GUESS_LIB/piccolox.jar:$GUESS_LIB/jung.jar:$GUESS_LIB/commons-collections.jar:$GUESS_LIB/hsqldb.jar:$GUESS_LIB/freehep-all.jar:$GUESS_LIB/colt.jar:$GUESS_LIB/prefuse.jar:$GUESS_LIB/TGGraphLayout.jar:$GUESS_LIB/looks.jar:$GUESS_LIB/mascoptLib.jar:$GUESS_LIB/jfreechart.jar:$GUESS_LIB/jide-components.jar:$GUESS_LIB/jide-common.jar:$GUESS_LIB/forms.jar:$GUESS_LIB/jcommon.jar " >> $DH/guess/guess.sh
 echo "echo $GCLASSPATH">> $DH/guess/guess.sh
 echo "" >> $DH/guess/guess.sh
 echo "java -DgHome=$GUESS_HOME -classpath $GCLASSPATH \"-Dpython.home=$GUESS_HOME/src\" com.hp.hpl.guess.Guess $@ " >> $DH/guess/guess.sh
 echo "echo $?">> $DH/guess/guess.sh

# pause 'Press [Enter] key to continue...'

cd $DPMI/
 git clone https://github.com/Fudge/gltail $DH/gltail

# pause 'Press [Enter] key to continue...'

cd $DPMI/PyInline
wget -c http://sourceforge.net/projects/pyinline/files/pyinline/0.03/PyInline-0.03.tar.gz
tar -xvpf PyInline-0.03.tar.gz
cd PyInline-0.03
 python setup.py build
 python setup.py install

# pause 'Press [Enter] key to continue...'

cd $DPMI/walrus
# Manual build process of walruscsv
mkdir tmp
cd tmp
wget -c http://www.soa-world.de/dev/walruscsv/walruscsv.zip
unzip walruscsv.zip
g++ wlink.cpp main.cpp wtree.cpp -o walruscsv
cd ..
wget -c http://www.soa-world.de/dev/walruscsv/testdata.zip
unzip testdata.zip

# pause 'Press [Enter] key to continue...'

# build java3d environment
# 
# wget -c http://download.java.net/media/java3d/builds/release/1.5.2/j3d-1_5_2-linux-i586.bin
# sh j3d-1_5_2-linux-i586.bin
echo "You must accept the Oracle Binary Code License Agreement for Java SE to download this software."
echo "Open the following link in your browser and save to $DPMI/walrus"
echo " " 
echo "http://download.oracle.com/otn-pub/java/java3d/1.5.1/java3d-1_5_1-linux-i586.bin"
echo " "
echo "DAVIX 2014 will wait until you've downloaded the required file."
echo " "

pause 'Press [Enter] key to continue installation...'

cd $DPMI/walrus
sh java3d-1_5_1-linux-i586.bin
mv lib/ext/* /usr/lib/jvm/java-1.6.0-openjdk-i386/jre/lib/ext/
mv lib/i386/* /usr/lib/jvm/java-1.6.0-openjdk-i386/jre/lib/i386/

pause 'Press [Enter] key to continue...'

# get walrus
cd $DPMI/walrus
wget -c http://www.caida.org/tools/visualization/walrus/download/walrus-0.6.3.tar.gz
tar -xvpf walrus-0.6.3.tar.gz
mv walrus-0.6.3 $DH/walrus-0.6.3
mv tmp/walruscsv $DH/walrus-0.6.3
rm -r tmp

# pause 'Press [Enter] key to continue...'

cd $DPMI/FlowTag
wget -c http://chrislee.dhs.org/projects/flowtag/flowtag-2.0.5.tgz
tar -xvpf flowtag-2.0.5.tgz
# wget -c http://chrislee.dhs.org/projects/flowtag/flowtag-demo.mov
cd flowtag-2.0.5
ruby setup.rb

# pause 'Press [Enter] key to continue...'

## Processing
cd $DPMI/processing
wget -c http://download.processing.org/processing-2.1-linux32.tgz
tar -xvpf processing-2.1-linux32.tgz
mv processing-2.1 $DH

# pause 'Press [Enter] key to continue...'

## NetGrok
cd ../NetGrok
wget -c http://netgrok.googlecode.com/files/netgrok20080928.zip
unzip netgrok20080928.zip

# pause 'Press [Enter] key to continue...'

# VISUALIZATION APPLICATIONS
# interactive installation procedures required

## CYTOSCAPE
cd $DPMI/Cytoscape
wget -c http://chianti.ucsd.edu/cytoscape-3.0.2/Cytoscape_3_0_2_unix.sh
chmod +x ./Cytoscape_3_0_2_unix.sh
 ./Cytoscape_3_0_2_unix.sh

# pause 'Press [Enter] key to continue...'

## R Studio
cd $DPMI/Rstudio
wget -c http://download1.rstudio.org/rstudio-0.98.501-i386.deb
dpkg -i rstudio-0.98.501-i386.deb

# pause 'Press [Enter] key to continue...'

# RUMINT
cd $DPMI/Rumint
wget -c http://www.rumint.org/software/rumint/rumint_v.214.zip
unzip rumint_v.214.zip
cd rumint_2.14_distro
su davix -c "wine ./setup.exe"

# pause 'Press [Enter] key to continue...'

## R Project
## Installs FactoMineR, Leaps, HH and dependencies required (ellipse, plyr, RColorBrewer, reshape)
cd ../RPackages
wget -c http://cran.r-project.org/src/contrib/FactoMineR_1.25.tar.gz
wget -c http://stat.ethz.ch/CRAN/src/contrib/leaps_2.9.tar.gz
wget -c http://stat.ethz.ch/CRAN/src/contrib/HH_2.3-42.tar.gz
wget -c http://stat.ethz.ch/CRAN/src/contrib/latticeExtra_0.6-26.tar.gz
wget -c http://stat.ethz.ch/CRAN/src/contrib/reshape_0.8.4.tar.gz
wget -c http://stat.ethz.ch/CRAN/src/contrib/RColorBrewer_1.0-5.tar.gz
wget -c http://cran.r-project.org/src/contrib/plyr_1.8.tar.gz
wget -c http://cran.r-project.org/src/contrib/ellipse_0.3-8.tar.gz
R CMD INSTALL ellipse_0.3-8.tar.gz
R CMD INSTALL FactoMineR_1.25.tar.gz
R CMD INSTALL leaps_2.9.tar.gz
R CMD INSTALL latticeExtra_0.6-26.tar.gz
R CMD INSTALL plyr_1.8.tar.gz
R CMD INSTALL reshape_0.8.4.tar.gz  
R CMD INSTALL RColorBrewer_1.0-5.tar.gz
R CMD INSTALL HH_2.3-42.tar.gz
# requires latticeExtra reshape RColorBrewer

# pause 'Press [Enter] key to continue...'

## InetVis
cd ../InetVis
wget -c http://www.cs.ru.ac.za/research/g02v2468/inetvis/0.9.3/inetvis-0.9.3.1.tar.gz
tar -xvpf inetvis-0.9.3.1.tar.gz
ln -s /usr/lib/x86_64-linux-gnu/libpcap.so.0.8

pause 'Press [Enter] key to continue...'

