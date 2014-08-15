A PG GIS setup for Vagrant
==========================

Presentation
------------

This Vagrant image is a container with all latest PostgreSQL extensions needed to do serious GIS work.
It is based on Ubuntu 14.04 and features :

* PostgreSQL 9.3 (from package)
* PostGIS 2.1.3 (compiled from release sources) with SFCGAL support (git master)
* PgRouting (git master)
* PostgreSQL PointCloud extension (git master)
* PDAL (git master)

It creates a pggis database with a pggis superuser (password pggis), with postgis, pgrouting and pointcloud extensions activated. It is therefore ready to eat data, and you can enjoy 2D vector and raster features, 3D support and functions, large point data volumes and analysis, topology support and all PostgreSQL native features.

Build and/or run the VM
-----------------------

Download and install VirtualBox and Vagrant

* VirtualBox: https://www.virtualbox.org/
* Vagrant: http://www.vagrantup.com/

---

If you are a Windows user, please also install GitHub for windows:

* https://windows.github.com/

If a Mac user, install GitHub for Mac:

* https://mac.github.com/

If a Linux user, install git, e.g. on Ubuntu:

```sudo apt-get install git```

---

Now clone the Vagrant machine repository, and start up and ssh into the machine from the command line
('Terminal' in Mac and Linux, 'Git Shell' in Windows:

```SHELL
git clone https://github.com/OpenDroneMap/odm.git
cd odm
vagrant up
vagrant ssh
```
---

Now you are inside your new virtual machine. Let's get it set up with PostGIS, pgRouting, SFCGAL, and PointCloud:

```SHELL
cd /vagrant/
chmod 700 bootstrap.sh
./bootstrap.sh
```
Be patient. This will take a while.

---

When this is done running, you should be able to connect to your PostGIS database (with all those extra goodies) at localhost:4567 as pggis (password pggis).

---

Extra notes for my Seoul friends:
---------------------------------

Also download and install the latest
* pgAdmin: http://pgadmin.org/
* QGIS: http://qgis.org
