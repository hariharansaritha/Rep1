#!/bin/bash
echo -e "\n\n-----------------------------"
echo -e "Configuring Volta..."
echo -e "-----------------------------"
source ~/.zshrc > /dev/null 2>&1
echo -e "\nDone..."
echo -e "\n\n-----------------------------"
echo -e "Installing Node.js"
echo -e "-----------------------------"
volta install node
echo -e "\nDone..."
echo -e "\n\n-----------------------------"
echo -e "Installing Yarn"
echo -e "-----------------------------"
volta install yarn
echo -e "\nDone..."
echo -e "\n\n"
read -p "Please specify a location to clone the repository (or press Enter for default location): " repo_location
if [ -z "$repo_location" ]; then
  repo_location=$HOME
fi
git clone https://github.com/Hardhat-Enterprises/Deakin-Detonator-Toolkit $repo_location/Deakin-Detonator-Toolkit
echo -e "\n\n-----------------------------------------------"
echo -e "Installing project dependencies"
echo -e "-----------------------------------------------"
sudo apt install -y mitmproxy libglib2.0-dev libsoup2.4-dev libjavascriptcoregtk-4.0-18 libjavascriptcoregtk-4.0-dev libwebkit2gtk-4.1-0 libwebkit2gtk-4.1-dev openjdk-11-jdk cargo nodejs dsniff enum4linux dnsmap goldeneye wpscan parsero arjun sherlock
cd $repo_location/Deakin-Detonator-Toolkit
yarn install
echo -e "\n\nCleaning up..."
sudo apt autoremove -y
echo -e "\nDone..."
echo -e "\n\n-----------------------------"
echo -e "Installing Exploits"
echo -e "-----------------------------"
sudo mkdir -p /usr/share/ddt/
sudo cp -r src-tauri/exploits/* /usr/share/ddt/
echo -e "\nDone..."
while true; do
  echo -e "\n\nStarting DDT..."
  read -p "Do you want to start DDT now? (y/n) " start_ddt
  case $start_ddt in
    [Yy]* )
      echo -e "Running the development server..."
      yarn run tauri dev
      break;;
    [Nn]* )
      break;;
    * )
      echo -e "Invalid input. Please enter y or n.";;
  esac
done
cd ..
rm install.sh
rm install2.sh
