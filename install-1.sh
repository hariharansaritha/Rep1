#!/bin/bash
if [ "$EUID" -eq 0 ]; then
  echo "Please do not run this script as root."
  exit
fi
while true; do
  echo -e "\n\n"
  read -p "Do you want to update your system now? - Recommended (y/n) " start_update
  case $start_update in
    [Yy]* )
      echo "-----------------------------"
      echo "Updating System"
      echo "-----------------------------"
      sudo apt update && sudo apt upgrade -y
      echo -e "\n Done..."
      break;;
    [Nn]* )
      break;;
    * )
      echo "Invalid input. Please enter y or n.";;
  esac
done
echo "\n\n-----------------------------"
echo -e "Installing dependencies"
echo "-----------------------------"
sudo apt install -y libwebkit2gtk-4.0-dev build-essential curl wget libssl-dev libgtk-3-dev libayatana-appindicator3-dev librsvg2-dev python3-impacket
echo -e "\n Done..."
echo "\n\n-----------------------------"
echo -e "Installing Rust"
echo "-----------------------------"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
echo -e "\n Done..."
echo "\n\n-----------------------------"
echo -e "Installing Volta"
echo "-----------------------------"
curl https://get.volta.sh | bash
echo -e "\n Done..."
echo "\n\n-------------------------------------------------------------"
echo -e "Installation of initial dependencies complete.\n"
echo "-------------------------------------------------------------"
echo -e "\n Done..."
echo -e "\n\n"
echo "Fetching and executing the second installation script..."
curl -sSL https://raw.githubusercontent.com/hariharansaritha/Rep1/master/install2.sh -o install2.sh && bash install2.sh
