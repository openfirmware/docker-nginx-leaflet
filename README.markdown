# docker-nginx-leaflet

A container to host a small Leaflet website that can be customized to point to any compatible tile server.

## Why

This image is for quickly setting up a web front-end to preview changes to a tile server, who could also be running in [Docker](https://www.docker.com/).

## Build Instructions

You can either pull this image from the Docker Registry Hub:

    $ sudo docker pull openfirmware/nginx-leaflet

Or you can build your image directly from my Github repository:

    $ sudo docker build -t openfirmware/nginx-leaflet https://github.com/openfirmware/docker-nginx-leaflet.git

## Running

You can run the container with no ENV options to run an instance of Leaflet that points to the primary [OpenStreetMap](https://www.openstreetmap.org/) servers.

    $ sudo docker run -it -p 8080:80 openfirmware/nginx-leaflet

Checking your Docker host port 8080 should display a Leaflet map, with OSM tiles. If you want to customize the tiles and run MapQuest OSM:

    $ sudo docker run -it -p 8080:80 -e "TILESERVER=http://otile1.mqcdn.com/tiles/1.0.0/map/{z}/{x}/{y}.jpg" -e "ATTRIBUTION=Tiles Courtesy of <a href=\"http://www.mapquest.com/\" target=\"_blank\">MapQuest</a> <img src=\"http://developer.mapquest.com/content/osm/mq_logo.png\">" openfirmware/nginx-leaflet

The Tile Server URL template is documented in the [Leaflet API](http://leafletjs.com/reference.html#url-template). This should launch a docker container that displays a Leaflet map using tiles from MapQuest.

## Other Examples

Here are some sample tile servers you can test. More can be found on the OpenStreetMap wiki for [Tile Servers](http://wiki.openstreetmap.org/wiki/Tile_servers).

### MapQuest Open Aerial

    $ sudo docker run -it -p 8080:80 -e "TILESERVER=http://otile1.mqcdn.com/tiles/1.0.0/sat/{z}/{x}/{y}.jpg" -e "ATTRIBUTION=Tiles Courtesy of <a href=\"http://www.mapquest.com/\" target=\"_blank\">MapQuest</a> <img src=\"http://developer.mapquest.com/content/osm/mq_logo.png\">" openfirmware/nginx-leaflet

### HOT Style

    $ sudo docker run -it -p 8080:80 -e "TILESERVER=http://a.tile.openstreetmap.fr/hot/{z}/{x}/{y}.png" openfirmware/nginx-leaflet

### OpenCycleMap

    $ sudo docker run -it -p 8080:80 -e "TILESERVER=http://a.tile.opencyclemap.org/cycle/{z}/{x}/{y}.png" -e "ATTRIBUTION=Maps © <a href=\"http://www.thunderforest.com\">Thunderforest</a>, Data © <a href=\"http://www.openstreetmap.org/copyright\">OpenStreetMap contributors</a>" openfirmware/nginx-leaflet

### [Stamen Toner](http://maps.stamen.com/#toner)

    $ sudo docker run -it -p 8080:80 -e "TILESERVER=http://a.tile.stamen.com/toner/{z}/{x}/{y}.png" -e "ATTRIBUTION=Map tiles by <a href=\"http://stamen.com\">Stamen Design</a>, under <a href=\"http://creativecommons.org/licenses/by/3.0\">CC BY 3.0</a>. Data by <a href=\"http://openstreetmap.org\">OpenStreetMap</a>, under <a href=\"http://www.openstreetmap.org/copyright\">ODbL</a>." openfirmware/nginx-leaflet

## Todo

* Support subdomains for tile servers
* Support TMS standard servers
* Support custom default lat/lon/zoom
