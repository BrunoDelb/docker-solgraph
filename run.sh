#!/bin/sh

FILES=/data/*.sol

for filepath in $FILES
do
  filename=$(basename "$filepath")
  echo $filename
  # ignore Migrations.sol file
  if [ $filename = "Migrations.sol" ]; then
    continue
  fi
  solgraph $filepath > $filepath.dot
  dot -Tpng $filepath.dot -o $filepath.png
done

