#!/bin/bash
if [ "$EUID" -eq 0 ]; then
  echo "Please do not run this script as root."
  exit
fi
echo -e "\n\nInstalling system dependencies..."
sudo apt update && sudo apt upgrade -y
sudo apt install -y libwebkit2gtk-4.0-dev build-essential curl wget libssl-dev libgtk-3-dev libayatana-appindicator3-dev librsvg2-dev
echo -e "\n\nInstalling Rust..."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
echo -e "\n\nInstalling Volta..."
curl https://get.volta.sh | bash
echo -e "\n\nInstallation of initial dependencies complete.\n"
echo "Fetching and executing the second installation script..."
curl -sSL https://raw.githubusercontent.com/YourUsername/YourRepo/main/install-2.sh | bash
