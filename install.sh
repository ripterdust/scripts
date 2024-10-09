#!/bin/bash

update_master(){
  echo "🔄 Updating master branch..."
  git fetch origin
  git checkout main
  git pull origin main
  echo "✅ Update completed." 
}

availableFiles=()

python3 -m pip install -r ./requirements.txt

for file in *; do
    if [ -f "$file" ]; then
      availableFiles+=("$file")
    fi
done

for file in "${availableFiles[@]}"; do
  if [ "$file" != "install.sh" ] && [ "$file" != "local-params.json" ] && [ "$file" != ".gitignore" ] && [ "$file" != "requirements.txt" ] && [ "$file" != "README.md" ]; then
    sudo cp $file "/usr/local/bin/$file"
    sudo chmod +x "/usr/local/bin/$file"

    echo -e "* COMMAND \e[32m${file}\e[0m installed *"
  fi
done

echo "Installation successfully 🚀"

echo -e "For more information about the commands, read the \e[32mreadme.md\e[0m 📄."
