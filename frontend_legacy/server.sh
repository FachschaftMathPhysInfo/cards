#!/bin/bash

PORT=80

cd /app/build/web/

echo "Starting the server on port $PORT..."
python3 -m http.server $PORT
