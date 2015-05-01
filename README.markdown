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

    $ sudo docker run -d -p 8080:80 openfirmware/nginx-leaflet

Checking your Docker host port 8080 should display a Leaflet map, with OSM tiles. If you want to customize the tiles and run MapQuest OSM:

    $ sudo docker run -d -p 8080:80 -e "TILESERVER=http://otile1.mqcdn.com/tiles/1.0.0/map/{z}/{x}/{y}.jpg" openfirmware/nginx-leaflet

The Tile Server URL template is documented in the [Leaflet API](http://leafletjs.com/reference.html#url-template). This should launch a docker container that displays a Leaflet map using tiles from MapQuest.

## Other Examples

### MapQuest Open Aerial

    $ sudo docker run -d -p 8080:80 -e "TILESERVER=http://otile1.mqcdn.com/tiles/1.0.0/sat/{z}/{x}/{y}.jpg" openfirmware/nginx-leaflet

## Todo

* Support subdomains for tile servers
* Support TMS standard servers
* Support custom attribution text
* Support custom default lat/lon/zoom
