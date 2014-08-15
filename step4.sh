#!/usr/bin/env bash

# PointCloud extension for PostgreSQL and PostGIS
git clone https://github.com/pramsey/pointcloud.git
	cd pointcloud &&\
	./autogen.sh &&\
	./configure &&\
	make -j3 &&\
	sudo make install
cd ..

sudo ldconfig
# Create new user
sudo su - postgres
 /etc/init.d/postgresql start &&\
    psql --command "CREATE USER pggis WITH SUPERUSER PASSWORD 'pggis';" &&\
    createdb -T template0 -E UTF8 -O pggis pggis
