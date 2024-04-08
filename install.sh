#!/bin/bash

# git pull

availableFiles=()

for file in *; do
    if [ -f "$file" ]; then
      availableFiles+=("$file")
    fi
done

for file in "${availableFiles[@]}"; do
  if [ "$file" != "install.sh" ] && [ "$file" != "local-params.json" ] && [ "$file" != ".gitignore" ]; then
    sudo cp $file "/usr/local/bin/$file"
    sudo chmod +x "/usr/local/bin/$file"

  fi
done

ls "/usr/local/bin"