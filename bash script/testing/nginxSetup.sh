#!/bin/sh

# create temporary folder
touch tempfile.conf
echo "upstream backend {" >> tempfile.conf
echo "  server $SAMPLE;" >> tempfile.conf
echo "}" >> tempfile.conf

cat nginx.conf >> tempfile.conf