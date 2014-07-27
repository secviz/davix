#!/bin/bash

####################################################
## DAVIX 2014 Application Installation Script     ##
## DAVIX 2014 Core Applications                   ##
##                                                ##
## Raffael Marty, Amanda Gellhouse, Edward McCabe ##
##                                                ##
## DEVELOPMENT V1.5  13 MAY 2014                  ##
####################################################

# init
function pause(){
    read -p "$*"
}

# Setup
export DH="/opt/davix"
export DPMI="/home/davix/davix-packages-manual-install"
export LibMagic_LIBRARY="/usr/lib/i386-linux-gnu/"
export LibMagic_INCLUDE_DIR="/usr/lib/i386-linux-gnu/"

# Build the directory structure
cd $DPMI
mkdir gephi p0f argus pulledpork BroIDS jquery-sparklines nsm-console eventlog TreeMap Cytoscape Mondrian TNV Parvis Timesearcher1 walrus PerlPackages GUESS InetVis processing PyInline Rumint gltail FlowTag INAV Netgrok SeedsOfContempt RTGraph3D parsers maltego picviz ipsumdump passivedns graphviz


## Afterglow
git clone https://github.com/zrlram/afterglow $DH/afterglow
git clone https://github.com/zrlram/parsers $DH/parsers

## Argus Server
echo "Installing Argus Server"
cd $DPMI/argus
wget -c http://qosient.com/argus/src/argus-3.0.6.1.tar.gz
wget -c http://qosient.com/argus/src/argus-clients-3.0.6.2.tar.gz
tar -xvpf argus-3.0.6.1.tar.gz 
tar -xvpf argus-clients-3.0.6.2.tar.gz 
cd argus-3.0.6.1/
./configure
make
make install
 

## GraphViz New Version
echo "Installing GraphViz"
cd $DPMI/graphviz
wget -c http://www.graphviz.org/pub/graphviz/stable/SOURCES/graphviz-2.38.0.tar.gz
tar -xzf graphviz-*.tar.gz
cd graphviz*
./configure --prefix=/usr --datadir=/usr/share --infodir=/usr/share/info --mandir=/usr/share/man
make
make install
cp $DPMI/davix/install/config/graphviz.conf /etc/ld.so.conf.d/
ldconfig
dot -c


## Argus Client
echo "Installing Argus Client"
cd $DPMI/argus-clients-3.0.6.2/
./configure 
make
make install


## BroIDS (requires CMake)
echo "Installing BroIDS"
cd $DPMI/BroIDS
wget -c http://www.bro.org/downloads/release/bro-2.3.tar.gz
tar -xvpf bro-2.3.tar.gz
cd bro-2.3
./configure --prefix=$DH/broids
make
make install
$DH/broids/bin/broctl install

## Perl Chart Director
echo "Installing ChartDirector"
cd $DPMI/PerlPackages
wget -c http://download2.advsofteng.com/chartdir_perl_linux.tar.gz
tar -xvpf chartdir_perl_linux.tar.gz
# Add to perl @INC Path
mv ChartDirector /usr/lib/perl5/
yes '' | cpan -i Crypt::SSLeay
cpan -i IP::Anonymous
cpan -i Crypt::Rijndael
cpan -i Test::Manifest


## Cytoscape
echo "Installing Cytoscape"
cd $DPMI/Cytoscape
wget -c http://chianti.ucsd.edu/cytoscape-3.0.2/Cytoscape_3_0_2_unix.sh
chmod +x ./Cytoscape_3_0_2_unix.sh
mkdir -p $DH/Cytoscape
mv Cytoscape_3_0_2_unix.sh $DH/Cytoscape/Cytoscape_3_0_2_unix.sh


# EVENTLOG
echo "Installing Eventlog"
cd $DPMI/eventlog
wget -c https://www.balabit.com/downloads/files/eventlog/0.2/eventlog-0.2.4.tar.gz
tar -xvpf eventlog-0.2.4.tar.gz
mkdir -p $DH/eventlog
cd eventlog-0.2.4
 ./configure --prefix=$DH/eventlog
 make
 make install


## FlowTag
echo "Installing FlowTag"
cd $DPMI/FlowTag
wget -c http://chrislee.dhs.org/projects/flowtag/flowtag-2.0.5.tgz
tar -xvpf flowtag-2.0.5.tgz
cd flowtag-2.0.5
ruby setup.rb


## Gephi
cd $DPMI/gephi
wget -c https://launchpad.net/gephi/0.8/0.8.2beta/+download/gephi-0.8.2-beta.tar.gz
tar -xzf gephi-0.8.2-beta.tar.gz
mv gephi $DH


## glTail
echo "Installing glTail"
git clone https://github.com/Fudge/gltail $DH/gltail


## GUESS
echo "Installing GUESS"
cd $DPMI/GUESS
wget -c http://sourceforge.net/projects/guess/files/guess/guess-1.0.3-beta/guess-20070813.zip
unzip guess-20070813.zip
mv guess $DH/guess

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
chmod +x $DH/guess/guess.sh

## INAV
echo "Installing INAV"
cd $DPMI/davix/tools/inav
tar -xvpf INAV-Server.tar.gz
mkdir $DH/INAV
mv $DPMI/davix/tools/inav/INAV-0.13.jar $DH/INAV
cd $DPMI/davix/tools/inav/INAV-Server-0.3.7/server
# TODO Location of makefile?
cp $XXX/makefile .
make 


## InetVis
echo "Installing InetVis"
cd $DPMI/InetVis
wget -c http://www.cs.ru.ac.za/research/g02v2468/inetvis/0.9.3/inetvis-0.9.3.1.tar.gz
tar -xvpf inetvis-0.9.3.1.tar.gz
# Dependency
wget http://mirrors.kernel.org/ubuntu/pool/main/q/qt-x11-free/libqt3-mt_3.3.8-b-6ubuntu2_i386.deb
dpkg -i libqt3-mt_3.3.8-b-6ubuntu2_i386.deb
mv inetvis-0.9.3.1 $DH


# Logstash
echo "Installing Logstash"
mkdir -p $DH/logstash
cd $DH/logstash
wget -c https://download.elasticsearch.org/logstash/logstash/packages/debian/logstash_1.4.2-1-2c0f5a1_all.deb
dpkg -i logstash_1.4.2-1*.deb
sed -i -e 's/ -l .*/"/' /etc/init/logstash-web.conf
sed -i -e 's/^setuid/#setuid/' /etc/init/logstash.conf
sed -i -e 's/^setgid/#setgid/' /etc/init/logstash.conf
mv /opt/logstash/vendor/kibana/app/dashboards/logstash.json /opt/logstash/vendor/kibana/app/dashboards/default.json 

# Build the base configuration file
cat << EOF > /etc/logstash/conf.d/logstash.conf
input {
  file {
    type => "syslog"
    path => [ "/var/log/syslog" ]
  }
}
output {
  stdout { }
  elasticsearch { embedded => true }
}
EOF


## Maltego
cd $DPMI/maltego
wget -c http://www.paterva.com/malv34/community/MaltegoCE.v3.4.0.5004.deb
dpkg -i MaltegoCE.v3.4.0.5004.deb


## Mondrian
echo "Installing Mondrian"
cd $DPMI/Mondrian
wget -c http://stats.math.uni-augsburg.de/mondrian/Mondrian.jar
mkdir -p $DH/Mondrian
mv Mondrian.jar $DH/Mondrian/Mondrian.jar

## Netgrok
echo "Installing Netgrok"
cd $DPMI/Netgrok
wget -c http://netgrok.googlecode.com/files/netgrok20080928.zip
unzip netgrok20080928.zip
# TODO Resolve Netgrok issues
# Fix ini file
#mv -f $DPMI/davix/install/fixes/netgrok/groups.ini Netgrok/ 
# Get jpcap
#wget -c http://sourceforge.net/projects/jpcap/files/jpcap/v0.01.16/jpcap-0.01.16.tar.gz
#tar -xvpf jpcap-0.01.16.tar.gz
#cp Netgrok/lib/linux/jpcap.jar /usr/lib/jvm/default-java/jre/lib/ext
mv Netgrok $DH


# nsm-console
echo "Installing nsm-console"
cd $DPMI/nsm-console
wget -c http://writequit.org/projects/nsm-console/files/nsm-console-0.7.tar.gz
tar -xvpf nsm-console-0.7.tar.gz
# Patch 
mv -f $DPMI/davix/install/fixes/nsm/nsm nsm-console/ 
mv nsm-console $DH


## p0f
echo "Installing p0f"
cd $DPMI/p0f/
wget -c http://lcamtuf.coredump.cx/p0f3/releases/p0f-3.07b.tgz
tar -xvpf p0f-3.07b.tgz
cd p0f-3.07b
./build.sh
mkdir -p $DH/p0f/bin
mv docs $DH/p0f
mv p0f* $DH/p0f/bin
cd tools/
make p0f-sendsyn
make p0f-sendsyn6 
make p0f-client
mv p0f-sendsyn $DH/p0f/bin
mv p0f-sendsyn6 $DH/p0f/bin
mv p0f-client $DH/p0f/bin


## Parvis
echo "Installing Parvis"
cd $DPMI/Parvis
wget -c http://www.mediavirus.org/parvis/parvis-0.3.1.zip
unzip parvis-0.3.1.zip
cp parvis.bat parvish.sh
chmod +x parvish.sh
cd ..
mv Parvis $DH


## Processing
echo "Installing Processing"
cd $DPMI/processing
wget -c http://download.processing.org/processing-2.1-linux32.tgz
tar -xvpf processing-2.1-linux32.tgz
mv processing-2.1 $DH


## pulledpork: snort rules updater
echo "Installing PulledPork"
cd $DPMI/pulledpork/
wget -c http://pulledpork.googlecode.com/files/pulledpork-0.7.0.tar.gz
tar -xvpf pulledpork-0.7.0.tar.gz
mv pulledpork-0.7.0 $DH
cd $DH/pulledpork-0.7.0
chmod +x pulledpork.pl


## RT Graph 3D
echo "Installing RT Graph 3D"
cd $DPMI/RTGraph3D
wget -c http://www.secdev.org/projects/rtgraph3d/files/rtgraph3d-0.1.tgz
tar -xvpf rtgraph3d-0.1.tgz
# Dependencies - povexport
wget -c http://www.vpython.org/contents/contributed/povexport-2012-07-10.zip
unzip povexport-2012-07-10.zip
mv povexport-2012-07-10/* rtgraph3d-0.1/
# Dependencies - PyInline
wget -c http://sourceforge.net/projects/pyinline/files/pyinline/0.03/PyInline-0.03.tar.gz
tar -xvpf PyInline-0.03.tar.gz
chmod -R 755 PyInline-0.03
mv PyInline-0.03/PyInline/*.py rtgraph3d-0.1/
mv rtgraph3d-0.1 $DH


## rumint
echo "Installing rumint"
cd $DPMI/Rumint
wget -c http://www.rumint.org/software/rumint/rumint_v.214.zip
unzip rumint_v.214.zip
cd rumint_2.14_distro
wine ./setup.exe


## Sagan Fix - configuration file error so copy correct one
cp -f $DPMI/davix/install/fixes/sagan/sagan.conf /etc


## Seeds of Contempt
echo "Installing Seeds of Contempt"
cd $DPMI/SeedsOfContempt
svn checkout http://seedsofcontempt.googlecode.com/svn/trunk/ seedsofcontempt-read-only
mv seedsofcontempt-read-only $DH/seedsofcontempt


## Timesearcher 1
echo "Installing Timesearcher 1"
cd $DPMI/Timesearcher1
wget -c http://www.cs.umd.edu/hcil/timesearcher/dist/ts1.3.7.tar.gz
tar -xvpf ts1.3.7.tar.gz
wget -c http://www.cs.umd.edu/hcil/timesearcher/dist2/demos_4Gf5x/ts-2.4.zip
unzip ts-2.4.zip
mv ts1.3.7 $DH
mv ts-2.4 $DH/ts1.3.7/demos


## TNV
echo "Installing TNV"
cd $DPMI/TNV
wget -c http://sourceforge.net/projects/tnv/files/tnv/0.3.9/tnv_java_0.3.9.zip
unzip tnv_java_0.3.9.zip
mv tnv-0.3.9 $DH


## TreeMap
echo "Installing TreeMap"
cd $DPMI/TreeMap
wget -c http://www.cs.umd.edu/hcil/treemap/demos/Treemap-4.1.2.zip
unzip Treemap-4.1.2.zip
mv Treemap-4.1.2 $DH


## Walrus
echo "Installing Walrus"
## build java3d environment
cd $DPMI/walrus
wget ftp://www.daba.lv/pub/Programmeeshana/java/3D_java/java3d-1_5_1-linux-i586.bin
sh java3d-1_5_1-linux-i586.bin
mv lib/ext/* /usr/lib/jvm/java-1.6.0-openjdk-i386/jre/lib/ext/
mv lib/i386/* /usr/lib/jvm/java-1.6.0-openjdk-i386/jre/lib/i386/
# Get Walrus Test Data
mkdir tmp
cd tmp
wget -c http://www.soa-world.de/dev/walruscsv/walruscsv.zip
unzip walruscsv.zip
g++ wlink.cpp main.cpp wtree.cpp -o walruscsv
wget -c http://www.soa-world.de/dev/walruscsv/testdata.zip
unzip testdata.zip
# Get Walrus
wget -c http://www.caida.org/tools/visualization/walrus/download/walrus-0.6.3.tar.gz
tar -xvpf walrus-0.6.3.tar.gz
mv walrus-0.6.3 $DH/walrus-0.6.3
mv tmp/walruscsv $DH/walrus-0.6.3
rm -r tmp

## Gephi
cd $DPMI/gephi
wget -c https://launchpad.net/gephi/0.8/0.8.2beta/+download/gephi-0.8.2-beta.tar.gz
tar -xzf gephi-0.8.2-beta.tar.gz
mv gephi $DH

## Maltego
cd $DPMI/maltego
wget -c http://www.paterva.com/malv34/community/MaltegoCE.v3.4.0.5004.deb
dpkg -i MaltegoCE.v3.4.05004.deb

## PicViz GUI
cd $DPMI/picviz
wget -c http://www.picviz.com/downloads/picviz-latest.tar.bz2
bunzip2 picviz-latest.tar.bz2
tar -xvf picviz-latest.tar
cd libpicviz
find -iname '*cmake*' -not -name CMakeLists.txt -exec rm -rf {} \;
apt-get install libevent-dev libcairo2-dev
make
cd picviz-latest
cd picviz-gui
python setup.py install

# ipsumdump
cd $DMPI/ipsumdump
wget -c http://www.read.seas.harvard.edu/~kohler/ipsumdump/ipsumdump-1.84.tar.gz
tar -xzf ipsumdump-1.84.tar.gz
cd ipsumpdump-1.84
./configure
make
make install

# passivedns
cd $DMPI/passivedns
wget -c https://github.com/gamelinux/passivedns/archive/1.0.tar.gz
tar -xzf 1.0.tar.gz
cd passivedns-1.0/src
make
mkdir -p $DH/passivedns
mv passivedns $DH/passivedns
ln -s $DH/passivedns/passivedns $DH/scripts/passivedns

# liblognorm
cd $DMPI/liblognorm
wget -c http://www.liblognorm.com/files/download/liblognorm-1.0.1.tar.gz
tar -xzf liblognorm-1.0.1.tar.gz
cd liblognorm-1.0.1
./confiugre --disable-docs
make
make install


## Copy over Run Scripts
mkdir $DH/scripts
cp $DPMI/davix/install/scripts/* $DH/scripts
ln -s /opt/davix/gephi/bin/gephi $DH/scripts/gephi
ln -s /opt/davix/afterglow/afterglow.pl $DH/scripts/afterglow
ln -s /opt/davix/broids/bin/bro $DH/scripts/bro
