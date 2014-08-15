#!/usr/bin/env bash

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

