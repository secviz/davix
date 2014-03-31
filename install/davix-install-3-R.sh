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

apt-get -y install r-cran-abind
apt-get -y install r-cran-bayesm
apt-get -y install r-cran-boot
apt-get -y install r-cran-car
apt-get -y install r-cran-chron
apt-get -y install r-cran-class
apt-get -y install r-cran-cluster
apt-get -y install r-cran-coda
apt-get -y install r-cran-codetools
apt-get -y install r-cran-colorspace
apt-get -y install r-cran-date
apt-get -y install r-cran-dbi
apt-get -y install r-cran-effects
apt-get -y install r-cran-foreign
apt-get -y install r-cran-gmaps
apt-get -y install r-cran-hmisc
apt-get -y install r-cran-int64
apt-get -y install r-cran-its
apt-get -y install r-cran-kernsmooth
apt-get -y install r-cran-lattice
apt-get -y install r-cran-lmtest
apt-get -y install r-cran-mapdata
apt-get -y install r-cran-mapproj
apt-get -y install r-cran-maps
apt-get -y install r-cran-maptools
apt-get -y install r-cran-mass
apt-get -y install r-cran-matrix
apt-get -y install r-cran-mcmcpack
apt-get -y install r-cran-mgcv
apt-get -y install r-cran-misc3d
apt-get -y install r-cran-multcomp
apt-get -y install r-cran-mvtnorm
apt-get -y install r-cran-nlme
apt-get -y install r-cran-nnet
apt-get -y install r-cran-plotrix
apt-get -y install r-cran-quadprog
apt-get -y install r-cran-rcmdr
apt-get -y install r-cran-rcpp
apt-get -y install r-cran-relimp
apt-get -y install r-cran-rggobi
apt-get -y install r-cran-rgl
apt-get -y install r-cran-rgtk2
apt-get -y install r-cran-rmysql
apt-get -y install r-cran-rodbc
apt-get -y install r-cran-rpart
apt-get -y install r-cran-rquantlib
apt-get -y install r-cran-rserve
apt-get -y install r-cran-sandwich
apt-get -y install r-cran-scatterplot3d
apt-get -y install r-cran-sm
apt-get -y install r-cran-sp
apt-get -y install r-cran-spatial
apt-get -y install r-cran-strucchange
apt-get -y install r-cran-survival
apt-get -y install r-cran-teachingdemos
apt-get -y install r-cran-timedate
apt-get -y install r-cran-timeseries
apt-get -y install r-cran-tseries
apt-get -y install r-cran-vcd
apt-get -y install r-cran-xml
apt-get -y install r-cran-zoo
apt-get -y install r-doc-html
apt-get -y install r-doc-pdf
apt-get -y install r-mathlib
apt-get -y install r-recommended
apt-get -y install r-cran-plyr
apt-get -y install r-cran-reshape2
apt-get -y install r-cran-latticeextra
apt-get -y install r-cran-rcolorbrewer
apt-get -y install r-cran-multcomp
apt-get -y install r-cran-vcd
apt-get -y install r-cran-colorspace

cd $DPMI/RPackages
wget -c http://cran.r-project.org/src/contrib/FactoMineR_1.25.tar.gz
wget -c http://stat.ethz.ch/CRAN/src/contrib/leaps_2.9.tar.gz
wget -c http://cran.r-project.org/src/contrib/HH_3.0-4.tar.gz
wget -c http://cran.r-project.org/src/contrib/ellipse_0.3-8.tar.gz
	R CMD INSTALL ellipse_0.3-8.tar.gz
	R CMD INSTALL FactoMineR_1.25.tar.gz
	R CMD INSTALL HH_3.0-4.tar.gz


