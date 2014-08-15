#!/usr/bin/env bash

# SFCGAL (full 3D support)
git clone https://github.com/Oslandia/SFCGAL.git
cd SFCGAL && cmake . && make -j3 && sudo make install
cd ..
# PostGIS
wget http://download.osgeo.org/postgis/source/postgis-2.1.3.tar.gz
tar -xzf postgis-2.1.3.tar.gz
cd postgis-2.1.3 && ./configure --with-sfcgal=/usr/local/bin/sfcgal-config
make -j3 && sudo make install
cd ..
