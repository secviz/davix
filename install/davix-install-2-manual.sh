#!/bin/bash

####################################################
## DAVIX 2014 Application Installation Script     ##
## DAVIX 2014 Core Applications                   ##
##                                                ##
## Raffael Marty, Amanda Gellhouse, Edward McCabe ##
##                                                ##
## DEVELOPMENT V1.4.02 22 APR 2014                ##
####################################################

# init
function pause(){
    read -p "$*"
}

# Setup
mkdir -p /opt/davix
mkdir -p /home/davix/davix-packages-manual-install

export DH="/opt/davix"
export DPMI="/home/davix/davix-packages-manual-install"
export LibMagic_LIBRARY="/usr/lib/i386-linux-gnu/"
export LibMagic_INCLUDE_DIR="/usr/lib/i386-linux-gnu/"

# Build the directory structure
cd $DPMI
mkdir p0f argus pulledpork BroIDS jquery-sparklines nsm-console eventlog TreeMap Cytoscape Mondrian TNV Parvis Timesearcher1 walrus PerlPackages GUESS InetVis processing PyInline Rumint gltail FlowTag INAV Netgrok SeedsOfContempt RTGraph3D RStudio

pause 'Press [Enter] key to continue...'


## Afterglow
git clone https://github.com/zrlram/afterglow $DH/afterglow

pause 'Press [Enter] key to continue...'


## Argus Server
cd $DPMI/argus
wget -c http://qosient.com/argus/src/argus-3.0.6.1.tar.gz
wget -c http://qosient.com/argus/src/argus-clients-3.0.6.2.tar.gz
tar -xvpf argus-3.0.6.1.tar.gz 
tar -xvpf argus-clients-3.0.6.2.tar.gz 
apt-get -y install flex
apt-get -y install bison
cd argus-3.0.6.1/
 ./configure --prefix=$DH/argus-server
 make
 make install
 
pause 'Press [Enter] key to continue...'


## Argus Client
cd $DPMI/argus-clients-3.0.6.2/
 ./configure --prefix=$DH/argus-client
 make
 make install

pause 'Press [Enter] key to continue...'


## BroIDS (requires CMake)
cd $DPMI/BroIDS
git clone https://github.com/Kitware/CMake $DH/cmake
# TODO Make this work - $ ./bootstrap && make && make install
wget -c http://www.bro.org/downloads/release/bro-2.2.tar.gz
tar -xvpf bro-2.2.tar.gz
cd bro-2.2
 ./configure --prefix=$DH/broids
 make
 make install
 make clean

pause 'Press [Enter] key to continue...'


## Cytoscape
cd $DPMI/Cytoscape
wget -c http://chianti.ucsd.edu/cytoscape-3.0.2/Cytoscape_3_0_2_unix.sh
chmod +x ./Cytoscape_3_0_2_unix.sh
mkdir -p $DH/Cytoscape
mv Cytoscape_3_0_2_unix.sh $DH/Cytoscape/Cytoscape_3_0_2_unix.sh

pause 'Press [Enter] key to continue...'


# EVENTLOG
cd $DPMI/eventlog
wget -c https://www.balabit.com/downloads/files/eventlog/0.2/eventlog-0.2.4.tar.gz
tar -xvpf eventlog-0.2.4.tar.gz
mkdir -p $DH/eventlog
cd eventlog-0.2.4
 ./configure --prefix=$DH/eventlog
 make
 make install

pause 'Press [Enter] key to continue...'


## FlowTag
cd $DPMI/FlowTag
wget -c http://chrislee.dhs.org/projects/flowtag/flowtag-2.0.5.tgz
tar -xvpf flowtag-2.0.5.tgz
cd flowtag-2.0.5
apt-get -y install ruby
ruby setup.rb

pause 'Press [Enter] key to continue...'


## glTail
git clone https://github.com/Fudge/gltail $DH/gltail

pause 'Press [Enter] key to continue...'


## GUESS
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

pause 'Press [Enter] key to continue...'


## INAV
cd $DPMI/INAV
wget -c https://github.com/secviz/davix/tree/master/tools/inav/INAV-Server.tar.gz
tar -xvpf INAV-Server.tar.gz
wget -c https://github.com/secviz/davix/tree/master/tools/inav/INAV-0.13.jar
cd INAV-Server-0.3.7/server
make

pause 'Press [Enter] key to continue...'


## InetVis
cd $DPMI/InetVis
wget -c http://www.cs.ru.ac.za/research/g02v2468/inetvis/0.9.3/inetvis-0.9.3.1.tar.gz
tar -xvpf inetvis-0.9.3.1.tar.gz
mv inetvis-0.9.3.1 $DH

pause 'Press [Enter] key to continue...'


# Logstash
mkdir $DH/logstash
wget -c https://download.elasticsearch.org/logstash/logstash/logstash-1.2.2-flatjar.jar -o $DH/logstash/logstash-1.2.2-flatjar.jar

pause 'Press [Enter] key to continue...'


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

pause 'Press [Enter] key to continue...'


## Mondrian
cd $DPMI/Mondrian
wget -c http://stats.math.uni-augsburg.de/mondrian/Mondrian.jar
mkdir -p $DH/Mondrian
mv Mondrian.jar $DH/Mondrian/Mondrian.jar

pause 'Press [Enter] key to continue...'


## NetGrok
cd $DPMI/Netgrok
wget -c http://netgrok.googlecode.com/files/netgrok20080928.zip
unzip netgrok20080928.zip
mv Netgrok $DH

pause 'Press [Enter] key to continue...'


# nsm-console
cd $DPMI/nsm-console
wget -c http://writequit.org/projects/nsm-console/files/nsm-console-0.7.tar.gz
tar -xvpf nsm-console-0.7.tar.gz
mv nsm-console/ $DH

pause 'Press [Enter] key to continue...'


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

pause 'Press [Enter] key to continue...'


## Parvis
cd $DPMI/Parvis
wget -c http://www.mediavirus.org/parvis/parvis-0.3.1.zip
unzip parvis-0.3.1.zip
cp parvis.bat parvish.sh
chmod +x parvish.sh
cd ..
mv Parvis $DH

pause 'Press [Enter] key to continue...'


## Perl Chart Director
cd $DPMI/PerlPackages
wget -c http://download2.advsofteng.com/chartdir_perl_linux.tar.gz
tar -xvpf chartdir_perl_linux.tar.gz
# Add to perl @INC Path
 mv ChartDirector /usr/lib/perl5/
 cpan -i Crypt::SSLeay
 cpan -i IP::Anonymous
 cpan -i Crypt::Rijndael
 cpan -i Test::Manifest

pause 'Press [Enter] key to continue...'


## Processing
cd $DPMI/processing
wget -c http://download.processing.org/processing-2.1-linux32.tgz
tar -xvpf processing-2.1-linux32.tgz
mv processing-2.1 $DH

pause 'Press [Enter] key to continue...'


## pulledpork: snort rules updater
cd $DPMI/pulledpork/
wget -c http://pulledpork.googlecode.com/files/pulledpork-0.7.0.tar.gz
tar -xvpf pulledpork-0.7.0.tar.gz

pause 'Press [Enter] key to continue...'


## R Studio
cd $DPMI/RStudio
wget -c http://download1.rstudio.org/rstudio-0.98.501-i386.deb
apt-get -y install libjpeg62
dpkg -i rstudio-0.98.501-i386.deb

pause 'Press [Enter] key to continue...'


## RT Graph 3D
cd $DPMI/RTGraph3D
wget -c http://www.secdev.org/projects/rtgraph3d/files/rtgraph3d-0.1.tgz
tar -xvpf rtgraph3d-0.1.tgz
mv rtgraph3d-0.1 $DH

pause 'Press [Enter] key to continue...'


## rumint
cd $DPMI/Rumint
wget -c http://www.rumint.org/software/rumint/rumint_v.214.zip
unzip rumint_v.214.zip
cd rumint_2.14_distro
su davix -c "wine ./setup.exe"

pause 'Press [Enter] key to continue...'


## Seeds of Contempt
cd $DPMI/SeedsOfContempt
svn checkout http://seedsofcontempt.googlecode.com/svn/trunk/ seedsofcontempt-read-only
mv seedsofcontempt-read-only $DH/seedsofcontempt

pause 'Press [Enter] key to continue...'


## Timesearcher 1
cd $DPMI/Timesearcher1
wget -c http://www.cs.umd.edu/hcil/timesearcher/dist/ts1.3.7.tar.gz
tar -xvpf ts1.3.7.tar.gz
wget -c http://www.cs.umd.edu/hcil/timesearcher/dist2/demos_4Gf5x/ts-2.4.zip
unzip ts-2.4.zip
mv ts1.3.7 $DH
mv ts-2.4 $DH/ts1.3.7/demos

pause 'Press [Enter] key to continue...'


## TNV
cd $DPMI/TNV
wget -c http://sourceforge.net/projects/tnv/files/tnv/0.3.9/tnv_java_0.3.9.zip
unzip tnv_java_0.3.9.zip
mv tnv-0.3.9 $DH

pause 'Press [Enter] key to continue...'


## TreeMap
cd $DPMI/TreeMap
wget -c http://www.cs.umd.edu/hcil/treemap/demos/Treemap-4.1.2.zip
unzip Treemap-4.1.2.zip
mv Treemap-4.1.2 $DH

pause 'Press [Enter] key to continue...'


## Walrus
## build java3d environment
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

# Get Walrus Test Data
cd $DPMI/walrus
mkdir tmp
cd tmp
wget -c http://www.soa-world.de/dev/walruscsv/walruscsv.zip
unzip walruscsv.zip
g++ wlink.cpp main.cpp wtree.cpp -o walruscsv
wget -c http://www.soa-world.de/dev/walruscsv/testdata.zip
unzip testdata.zip

# Get Walrus
cd $DPMI/walrus
wget -c http://www.caida.org/tools/visualization/walrus/download/walrus-0.6.3.tar.gz
tar -xvpf walrus-0.6.3.tar.gz
mv walrus-0.6.3 $DH/walrus-0.6.3
mv tmp/walruscsv $DH/walrus-0.6.3
rm -r tmp

pause 'Press [Enter] key to continue...'




## Unknown Packages ##

## PyInline
cd $DPMI/PyInline
wget -c http://sourceforge.net/projects/pyinline/files/pyinline/0.03/PyInline-0.03.tar.gz
tar -xvpf PyInline-0.03.tar.gz
cd PyInline-0.03
 python setup.py build
 python setup.py install

pause 'Press [Enter] key to continue...'