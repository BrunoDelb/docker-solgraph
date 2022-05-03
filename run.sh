#!/bin/sh

FILES=/data/*.sol

for filepath in $FILES
do
  filename=$(basename "$filepath")
  # ignore Migrations.sol file
  if [ $filename = "Migrations.sol" ]; then
    continue
  fi
  solgraph $filepath | dot -Tpng | base64 > /data/$filename
  node /app/png-to-dataurl.js /data/$filename
done
