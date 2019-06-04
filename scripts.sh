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
  sudo apt update
  sudo apt upgrade
  success "updated ubuntu dependancies successfully"
}

git() {
  # Git
  sudo apt install git
  success "Git installed"

  # Confif git
  git config --global user.email "danmark.chemuren@gmail.com"
  git config --global user.name "Dnmrk4"
  success "updated user email and name to git"
}

ubuntu() {
  # lightdm
  sudo apt install lightdm
  success "lightdm display manager installed"

  # curl
  sudo apt install curl
  success "installed curl"

  # vlc
  sudo apt install vlc
  success "installed vlc"

  # slack
  wget https://downloads.slack-edge.com/linux_releases/slack-desktop-3.3.8-amd64.deb
  sudo apt install ./slack-desktop-*.deb
  success "installed slack"
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
  sudo apt install npm
  npmversion="$(npm --version)"
  if [ npmversion ]; then
    success "npm installed successfully"
  else
    error "error installing npm"
  fi

  # angular
  sudo npm install -g @angular/cli@6.1.1
  ngversion="$(ng --version)"
  if [ ngversion ]; then
    success "angular 6 installed successfully"
    ng
  else
    error "error installing angular 6"
  fi

  # typescript
  sudo npm install -g typescript
  tsversion="$(tsc -v)"
  if [ ngversion ]; then
    success "typescript installed successfully"
  else
    error "error installing typescript"
  fi
}

test() {
  success "If you are seeing this, the script is working"
}

main() {
  # call all other functions here
  test
  git
  ubuntu
  javascript
}

# calling the main function
main
