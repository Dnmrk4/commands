#!/bin/bash

sudo apt update && 
echo "sudo updated" &&
sudo apt upgrade && 
echo "sudo upgraded" && 
sudo apt install git && 
echo "Git installed" &&
git config --global user.email "danmark.chemuren@gmail.com" &&
git config --global user.name "Dnmrk4" &&
echo "updated user email and name to git" &&
sudo apt install lightdm && 
echo "display manager installed" && 
sudo apt install npm &&
npm --version &&
echo "installed npm" &&
sudo apt install curl &&
echo "installed curl" &&
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash - &&
sudo apt install nodejs &&
node --version &&
echo "installed nodejs" &&
sudo npm install -g @angular/cli@6.1.1 &&
ng &&
ng --version &&
echo "installed angular 6" &&
sudo npm install -g typescript &&
tsc -v &&
echo "installed typescript" &&
sudo apt install vlc &&
echo "installed vlc" &&
wget https://downloads.slack-edge.com/linux_releases/slack-desktop-3.3.8-amd64.deb &&
sudo apt install ./slack-desktop-*.deb &&
echo "installed slack"

