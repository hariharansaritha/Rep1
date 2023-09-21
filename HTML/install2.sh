#!/bin/bash

echo -e "\n\nConfiguring Volta..."

source ~/.zshrc > /dev/null 2>&1

echo -e "\n\nInstalling Node.js..."

volta install node

echo -e "\n\nInstalling Yarn..."

volta install yarn

echo -e "\n\n"

read -p "\n\nPlease specify a location to clone the repository (or press Enter for default location): " repo_location

if [ -z "$repo_location" ]; then

  repo_location=$HOME

fi

git clone https://github.com/Hardhat-Enterprises/Deakin-Detonator-Toolkit $repo_location/Deakin-Detonator-Toolkit

echo -e "\n\nInstalling project dependencies..."

cd $repo_location/Deakin-Detonator-Toolkit

yarn install

while true; do

  echo -e "\n\nStarting DDT..."

  read -p "Do you want to start DDT now? (y/n) " start_ddt

  case $start_ddt in

    [Yy]* )

      echo "Running the development server..."

      yarn run tauri dev

      break;;

    [Nn]* )

      break;;

    * )

      echo "Invalid input. Please enter y or n.";;

  esac

done

