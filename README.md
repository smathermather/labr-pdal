PostGIS Setup scripts with PDAL, Routing, and SFCGAL
====================================================

(Forked from https://github.com/vpicavet/docker-pggis)

Presentation
------------

These are some commands to install latest PostgreSQL unstable extensions needed to do serious GIS work.
It is based on Ubuntu 14.04 and features :

* PostgreSQL 9.3 (from package)
* PostGIS (git master) (compiled from release sources) with SFCGAL support (git master)
* PgRouting (git master)
* PostgreSQL PointCloud extension (git master)
* PDAL (git master)

It creates a pggis database with a pggis superuser (password pggis), with postgis, pgrouting and pointcloud extensions activated. It is therefore ready to eat data, and you can enjoy 2D vector and raster features, 3D support and functions, large point data volumes and analysis, topology support and all PostgreSQL native features.

One known gotcha -- if your machine doesn't have 4GB of RAM, SFCGAL fails to compile.

http://trac.osgeo.org/postgis/ticket/2930


--------------------------------------------
``` shell
### Get dependencies in place
sudo apt-get update && sudo apt-get -y upgrade && sudo apt-get -y dist-upgrade

sudo apt-get install -y autoconf build-essential cmake docbook-mathml docbook-xsl libboost-dev libboost-filesystem-dev libboost-timer-dev libcgal-dev libcunit1-dev libgdal-dev libgeos++-dev libgeotiff-dev libgmp-dev libjson0-dev libjson-c-dev liblas-dev libmpfr-dev libopenscenegraph-dev libpq-dev libproj-dev libxml2-dev postgresql-server-dev-9.3 xsltproc git build-essential wget

# Install postgres
sudo apt-get install -y postgresql 

### SFCGAL and PostGIS

# SFCGAL (full 3D support)
git clone https://github.com/Oslandia/SFCGAL.git
cd SFCGAL && cmake . && make -j3 && sudo make install
cd ..

# PostGIS
./autogen.sh
git clone https://github.com/postgis/postgis.git
cd postgis && ./autogen.sh && ./configure --with-sfcgal=/usr/local/bin/sfcgal-config
make -j3 && sudo make install
cd ..

### pgRouting and PDAL

# pgRouting
git clone https://github.com/pgRouting/pgrouting.git &&\
    cd pgrouting &&\
    mkdir build && cd build &&\
    cmake -DWITH_DOC=OFF -DWITH_DD=ON .. &&\
    make -j3 && sudo make install
cd ../..

# PDAL -- Point Cloud Abstraction Library
git clone https://github.com/PDAL/PDAL.git pdal &&\
	mkdir PDAL-build &&\
	cd PDAL-build && cmake ../pdal &&\
	make -j3 && sudo make install
cd ..

### PointCloud

# PointCloud extension for PostgreSQL and PostGIS
git clone https://github.com/pramsey/pointcloud.git
	cd pointcloud &&\
	./autogen.sh &&\
	./configure &&\
	make -j3 &&\
	sudo make install
cd ..

### Finish up...

sudo ldconfig

# Create new user
sudo su - postgres
 /etc/init.d/postgresql start &&\
    psql --command "CREATE USER pggis WITH SUPERUSER PASSWORD 'pggis';" &&\
    createdb -T template0 -E UTF8 -O pggis pggis
    
    ```
