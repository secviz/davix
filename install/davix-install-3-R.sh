#!/bin/sh

####################################################
## DAVIX R package installation 		  ##
## DAVIX Core Applications                        ##
##                                                ##
## Raffael Marty, Amanda Gellhouse, Edward McCabe ##
##                                                ##
## DEVELOPMENT v0.1.01 22 APR 2014                ##
####################################################

wget -c http://mirrors.kernel.org/ubuntu/pool/universe/r/r-base/r-base-core_3.0.2-1ubuntu1_amd64.deb

# r-base dependencies
dpkg -i r-base-core_3.*.deb

apt-get -y install r-cran-bayesm r-cran-date r-cran-gmaps r-cran-int64 r-cran-its r-cran-latticeextra
apt-get -y install r-cran-mapdata r-cran-maptools r-cran-mcmcpack r-cran-plotrix r-cran-plyr
apt-get -y install r-cran-rcmdr r-cran-reshape2 r-cran-rggobi r-cran-rmysql r-cran-rodbc r-cran-rquantlib
apt-get -y install r-cran-rserve r-cran-sandwich r-cran-scatterplot3d r-cran-teachingdemos r-cran-timeseries r-cran-tseries
apt-get -y install r-cran-vcd r-cran-xml r-doc-html r-doc-pdf r-mathlib r-recommended

mkdir $DPMI/RPackages
cd $DPMI/RPackages
wget -c http://cran.r-project.org/src/contrib/FactoMineR_1.26.tar.gz
wget -c http://cran.r-project.org/src/contrib/leaps_2.9.tar.gz
wget -c http://cran.r-project.org/src/contrib/HH_3.0-4.tar.gz
wget -c http://cran.r-project.org/src/contrib/ellipse_0.3-8.tar.gz
  R CMD INSTALL leaps_2.9.tar.gz
	R CMD INSTALL ellipse_0.3-8.tar.gz
	R CMD INSTALL FactoMineR_1.26.tar.gz
	R CMD INSTALL HH_3.0-4.tar.gz

## R Studio
mkdir $DPMI/RStudio
echo "Installing R Studio"
cd $DPMI/RStudio
wget -c http://download1.rstudio.org/rstudio-0.98.978-amd64.deb
dpkg -i rstudio-*.deb
