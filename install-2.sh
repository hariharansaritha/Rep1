#!/bin/bash
source ~/.zshrc > /dev/null 2>&1
volta install node
volta install yarn
read -p "Please specify a location to clone the repository (or press Enter for default location): " repo_location
if [ -z "$repo_location" ]; then
  repo_location=$HOME
  fi
git clone https://github.com/Hardhat-Enterprises/Deakin-Detonator-Toolkit $repo_location/Deakin-Detonator-Toolkit
cd $repo_location/Deakin-Detonator-Toolkit
yarn install
while true; do
  unset start_ddt
  read -t 10 -p "Do you want to start DDT now? (y/n) " start_ddt
  if [ -z "$start_ddt" ]; then
    start_ddt="n"
    fi
  case $start_ddt in
    [Yy]* )
      yarn run tauri dev
      break;;
    [Nn]* )
      break;;
    * )
      echo "Invalid input. Please enter y or n.";;
  esac
done
