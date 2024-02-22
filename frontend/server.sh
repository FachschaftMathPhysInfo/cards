#!/bin/bash

PORT=80

echo "Checking if port $PORT is in use..."
if [ "$(lsof -t -i :$PORT)" ]; then
  echo "Port $PORT is in use. Stopping the process on that port..."
  fuser -k -n tcp $PORT
fi

cd /app/build/web/

echo "Starting the server on port $PORT..."
python3 -m http.server $PORT