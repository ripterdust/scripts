#!/bin/bash
# git pull

availableFiles=()

python3 -m pip install -r ./requirements.txt

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

echo "Installation successfully 🚀"