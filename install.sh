#!/bin/bash

update_master(){
  echo "🔄 Updating master branch..."
  git fetch origin
  git checkout main
  git pull origin main
  echo "✅ Update completed." 
}

read -p "Do you want to fetch the latest changes from the master branch? (Y/n) 🤔 " response

response=$(echo "$response" | tr '[:upper:]' '[:lower:]')

if [[ "$response" == "y" || "$response" == "" ]]; then
    update_master
else
    echo "🚫 Update canceled."
fi

availableFiles=()

python3 -m pip install -r ./requirements.txt

for file in *; do
    if [ -f "$file" ]; then
      availableFiles+=("$file")
    fi
done

for file in "${availableFiles[@]}"; do
  if [ "$file" != "install.sh" ] && [ "$file" != "local-params.json" ] && [ "$file" != ".gitignore" ] && [ "$file" != "requirements.txt" ]; then
    sudo cp $file "/usr/local/bin/$file"
    sudo chmod +x "/usr/local/bin/$file"
  fi
done

echo "Installation successfully 🚀"