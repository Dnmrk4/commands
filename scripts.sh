#!/bin/bash

# resources
# 1. https://bash.cyberciti.biz/guide/$@
# 2. https://ryanstutorials.net/bash-scripting-tutorial/bash-if-statements.php
# 3. https://unix.stackexchange.com/questions/285924/how-to-compare-a-programs-version-in-a-shell-script

# colors
red=$(tput setaf 1)
green=$(tput setaf 76)
tan=$(tput setaf 3)

success() {
  printf "${green}===> %s${reset}\n" "$@"
}

error() {
  printf "${red}===> %s${reset}\n" "$@"
}

warning() {
  printf "${tan}===> %s${reset}\n" "$@"
}

updates() {
  # ubuntu updates
  sudo apt-get update
  sudo apt-get upgrade
  success "updated ubuntu dependancies successfully"
}

ubuntu() {
  # curl
  sudo apt-get install -y yarn
  sudo apt-get install -y curl
  sudo apt-get install -y vlc
  sudo apt-get install -y snap
  sudo apt-get install -y adb
  sudo apt-get install -y font-manager
  sudo snap install -y --classic heroku
  sudo snap install -y wget
  success "installed curl vlc yarn adb snap font-manager heroku wget"

  # winehq
  sudo dpkg --add-architecture i386
  wget -qO - https://dl.winehq.org/wine-builds/winehq.key | sudo apt-key add -
  #in ubuntu 18.04
  sudo apt-add-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ bionic main'
  sudo apt-get update
  sudo apt-get upgrade
  sudo apt-get install -y --install-recommends winehq-stable
  sudo apt-get install -y aptitude
  sudo aptitude install -y winehq-stable
  wineversion="$(wine --version)"
  if [ wineversion ]; then
    success "winehq installed successfully"
  else
    error "error installing winehq"
  fi
}

javascript() {
  # node
  curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
  sudo apt install nodejs
  nodeversion="$(node --version)"
  if [ nodeversion ]; then
    success "nodejs installed successfully"
  else
    error "error installing nodejs"
  fi

  # npm
  sudo apt-get install -y npm
  npmversion="$(npm --version)"
  if [ npmversion ]; then
    success "npm installed successfully"
  else
    error "error installing npm"
  fi

  # typescript
  sudo npm install -y -g typescript
  tsversion="$(tsc -v)"
  if [ ngversion ]; then
    success "typescript installed successfully"
  else
    error "error installing typescript"
  fi

  # angular
  sudo npm install -y -g @angular/cli@9.1.3
  ngversion="$(ng --version)"
  if [ ngversion ]; then
    success "angular 9.1.3 installed successfully"
  else
    error "error installing angular 9.1.3"
  fi
}

vscode() {
  snap install -y --classic code
  success "code installed"
}

git() {
  # configuration
  sudo apt-get install -y git-all
  # username
  git config --global user.name "Dnmrk4"
  # email address
  git config --global user.email "danmark.chemuren@gmail.com"
  success "installed git"
}

ohmyzsh() {
  sudo apt-get install -y zsh
  sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  # default shell
  chsh -s $(which zsh)
  success "installed oh my zsh | now restart the computer"
}

chrome() {
  sudo apt-get install libxss1 libappindicator1 libindicator7
  wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
  sudo apt install ./google-chrome*.deb  
  success "installed stable chrome"
}

gtweak() {
  sudo apt-get install -y chrome-gnome-shell
  sudo apt-get install -y gnome-tweak-tool
  sudo add-apt-repository ppa:webupd8team/gnome3
  sudo apt-get update
  success "installed gnome | now restart the laptop && Search for and download compatible shell themes. For example in 'https://www.gnome-look.org/'."
}

test() {
  success "If you are seeing this, the script is working"
}

main() {
  # call all other functions here
  test
  ubuntu
  javascript
  vscode
  ohmyzsh
  chrome
  gtweak
}

# calling the main function
main
