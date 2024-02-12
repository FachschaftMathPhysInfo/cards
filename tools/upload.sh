#!/bin/bash

# check if command line argument is empty or not present
if [ "$1" == "" ] || [ $# -ne 2 ]; then
    echo "Wrong amount of arguments!"
    echo "USAGE: ./upload_one.sh <meta-data-string> <input-file>"
    echo "Given:" $@
    exit 1
fi

TARGET_HOST="${TARGET_HOST_ENV:-http://localhost:8080/graphql}"
METADATA_STRING=$1
INPUT_FILENAME=$2

OPERATION_STRING='{ "query": "mutation createNewDeck($input: NewDeck!) {createDeck(input: $input) {UUID} }", "variables": { "input": '$METADATA_STRING' } }'
echo $OPERATION_STRING | jq

set -o nounset

curl --silent $TARGET_HOST \
    -F operations="$OPERATION_STRING" \
    -F map='{ "0": ["variables.input.file"] }' \
    -F 0=@$INPUT_FILENAME