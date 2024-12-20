cd /tmp

wget -O requirements.txt https://raw.githubusercontent.com/ripterdust/scripts/refs/heads/main/requirements.txt
pip install -r requirements.txt
ls

cd /usr/local/bin
sudo wget -O localParams https://raw.githubusercontent.com/ripterdust/scripts/refs/heads/main/localParams
sudo wget -O paramsToJson https://raw.githubusercontent.com/ripterdust/scripts/refs/heads/main/paramsToJson


sudo chmod 777 localParams paramsToJson

echo ""
echo "Installation successfully 🚀"

echo "# Inside the FEBE's project run the command <localParams> and it will set it up automaticly"
