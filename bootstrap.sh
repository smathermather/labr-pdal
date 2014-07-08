# PostgreSQL GIS stack
#
# This image includes the following tools
# - PostgreSQL 9.3
# - PostGIS 2.1.3 with raster, topology and sfcgal support
# - PgRouting
# - PDAL
# - PostgreSQL PointCloud
#
#

#!/usr/bin/env bash

sudo apt-get update && sudo apt-get -y upgrade && sudo apt-get -y dist-upgrade

sudo apt-get install -y autoconf build-essential cmake docbook-mathml docbook-xsl libboost-dev libboost-filesystem-dev libboost-timer-dev libcgal-dev libcunit1-dev libgdal-dev libgeos++-dev libgeotiff-dev libgmp-dev libjson0-dev libjson-c-dev liblas-dev libmpfr-dev libopenscenegraph-dev libpq-dev libproj-dev libxml2-dev postgresql-server-dev-9.3 xsltproc git build-essential wget

sudo apt-get install -y postgresql 

git clone https://github.com/Oslandia/SFCGAL.git
cd SFCGAL && cmake . && make -j3 && sudo make install
cd ..

wget http://download.osgeo.org/postgis/source/postgis-2.1.3.tar.gz
tar -xzf postgis-2.1.3.tar.gz
cd postgis-2.1.3 && ./configure --with-sfcgal=/usr/local/bin/sfcgal-config
make -j3 && sudo make install
cd ..

git clone https://github.com/pgRouting/pgrouting.git &&\
    cd pgrouting &&\
    mkdir build && cd build &&\
    cmake -DWITH_DOC=OFF -DWITH_DD=ON .. &&\
    make -j3 && sudo make install
cd ../..

git clone https://github.com/PDAL/PDAL.git pdal &&\
	mkdir PDAL-build &&\
	cd PDAL-build && cmake ../pdal &&\
	cd PDAL-build && make -j3 && sudo make install
cd ..

git clone https://github.com/pramsey/pointcloud.git
	cd pointcloud &&\
	./autogen.sh &&\
	./configure &&\
	make -j3 &&\
	sudo make install
cd ..

sudo ldconfig

sudo mkdir /etc/service
sudo mkdir /etc/service/postgresql


#---------
# hmmm
#---------

sudo su - postgres
 /etc/init.d/postgresql start &&\
    psql --command "CREATE USER pggis WITH SUPERUSER PASSWORD 'pggis';" &&\
    createdb -T template0 -E UTF8 -O pggis pggis

