#!/bin/bash

sed '2 s/backend.*/REACT_APP_BACKEND_SERVICE_URI/g' sampleconf.txt

# get the react app backend and place in variable
#BACKEND=$REACT_APP_BACKEND_SERVICE_URI

# replace the destination of the upstream "backend" in the default.conf of nginx
#if test $BACKEND != ""
#then
#	sed '2 s/backend_service_uri/$BACKEND' sampleconf.txt
#fi
