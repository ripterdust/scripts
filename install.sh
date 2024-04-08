#!/bin/bash

git pull
availableFiles=()

for file in *; do
    if [ -f "$file" ]; then
      availableFiles+=("$file")
    fi
done

for file in "${availableFiles[@]}"; do
  if [ "$file" != "install.sh" ] && [ "$file" != "local-params.json" ]; then
    echo "hola"
  fi
done