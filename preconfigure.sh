#/bin/bash

set -e

if [ -z "$TILESERVER" ]; then
  TILESERVER="http://{s}.tile.osm.org/{z}/{x}/{y}.png"
fi

echo "using Tile Server: $TILESERVER"

/bin/sed -i -e 's|$TILESERVER|'"$TILESERVER"'|g' /usr/share/nginx/html/index.html

nginx -g "daemon off;"
