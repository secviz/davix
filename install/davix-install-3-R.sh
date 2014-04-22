#!/bin/sh

####################################################
## DAVIX R package installation 		  ##
## DAVIX Core Applications                        ##
##                                                ##
## Raffael Marty, Amanda Gellhouse, Edward McCabe ##
##                                                ##
## DEVELOPMENT v0.1 12 MAR 2014                   ##
####################################################

wget -c http://cran.us.r-project.org/bin/linux/ubuntu/saucy/r-base-core_3.0.3-1saucy0_i386.deb
dpkg -i r-base-core_3.0.3-1saucy0_i386.deb

apt-get -y install r-cran-bayesm
apt-get -y install r-cran-date
apt-get -y install r-cran-gmaps
apt-get -y install r-cran-int64
apt-get -y install r-cran-its
apt-get -y install r-cran-latticeextra
apt-get -y install r-cran-mapdata
apt-get -y install r-cran-maptools
apt-get -y install r-cran-mcmcpack
apt-get -y install r-cran-plotrix
apt-get -y install r-cran-plyr
apt-get -y install r-cran-rcmdr
apt-get -y install r-cran-reshape2
apt-get -y install r-cran-rggobi
apt-get -y install r-cran-rmysql
apt-get -y install r-cran-rodbc
apt-get -y install r-cran-rquantlib
apt-get -y install r-cran-rserve
apt-get -y install r-cran-sandwich
apt-get -y install r-cran-scatterplot3d
apt-get -y install r-cran-teachingdemos
apt-get -y install r-cran-timeseries
apt-get -y install r-cran-tseries
apt-get -y install r-cran-vcd
apt-get -y install r-cran-xml
apt-get -y install r-doc-html
apt-get -y install r-doc-pdf
apt-get -y install r-mathlib
apt-get -y install r-recommended

cd $DPMI/RPackages
wget -c http://cran.r-project.org/src/contrib/FactoMineR_1.25.tar.gz
wget -c http://stat.ethz.ch/CRAN/src/contrib/leaps_2.9.tar.gz
wget -c http://cran.r-project.org/src/contrib/HH_3.0-4.tar.gz
wget -c http://cran.r-project.org/src/contrib/ellipse_0.3-8.tar.gz
	R CMD INSTALL ellipse_0.3-8.tar.gz
	R CMD INSTALL FactoMineR_1.25.tar.gz
	R CMD INSTALL HH_3.0-4.tar.gz


