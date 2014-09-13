PostGIS Setup scripts with PDAL, Routing, and SFCGAL
====================================================

Presentation
------------

These are some commands to install latest PostgreSQL extensions needed to do serious GIS work.
It is based on Ubuntu 14.04 and features :

* PostgreSQL 9.3 (from package)
* PostGIS 2.1.3 (compiled from release sources) with SFCGAL support (git master)
* PgRouting (git master)
* PostgreSQL PointCloud extension (git master)
* PDAL (git master)

It creates a pggis database with a pggis superuser (password pggis), with postgis, pgrouting and pointcloud extensions activated. It is therefore ready to eat data, and you can enjoy 2D vector and raster features, 3D support and functions, large point data volumes and analysis, topology support and all PostgreSQL native features.

One known gotcha -- if your machine doesn't have 4GB of RAM, SFCGAL fails to compile.

http://trac.osgeo.org/postgis/ticket/2930
