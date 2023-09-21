#!/bin/bash
if [ "$EUID" -eq 0 ]; then
  echo -e "Please do not run this script as root."
  exit
fi
while true; do
  echo -e "\n\n"
  read -p "Do you want to update your system now? - Recommended (y/n) " start_update
  case $start_update in
    [Yy]* )
      echo -e "-----------------------------"
      echo -e "Updating System"
      echo -e "-----------------------------"
      sudo apt update && sudo apt upgrade -y
      echo -e "\n Done..."
      break;;
    [Nn]* )
      break;;
    * )
      echo -e "Invalid input. Please enter y or n.";;
  esac
done
echo -e "\n\n-----------------------------"
echo -e "Installing dependencies"
echo -e "-----------------------------"
sudo apt install -y libwebkit2gtk-4.0-dev build-essential curl wget libssl-dev libgtk-3-dev libayatana-appindicator3-dev librsvg2-dev python3-impacket
echo -e "\n Done..."
echo -e "\n\n-----------------------------"
echo -e "Installing Rust"
echo -e "-----------------------------"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
echo -e "\n Done..."
echo -e "\n\n-----------------------------"
echo -e "Installing Volta"
echo -e "-----------------------------"
curl https://get.volta.sh | bash
echo -e "\n Done..."
echo -e "\n\n-------------------------------------------------------------"
echo -e "Installation of initial dependencies complete.\n"
echo -e "-------------------------------------------------------------"
echo -e "\n Done..."
echo -e "\n\n"
echo -e "Fetching and executing the second installation script..."
curl -sSL https://raw.githubusercontent.com/hariharansaritha/Rep1/master/install2.sh -o install2.sh && bash install2.sh
