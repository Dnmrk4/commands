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

git() {
  sudo apt-get install git-all
  #configuration
  sudo -config
  success "installed git"
}

chrome() {
  sudo apt-get install libxss1 libappindicator1 libindicator7
  wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
  sudo apt install ./google-chrome*.deb  
  success "installed stable chrome"
}
zsh() {
  sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  success "installed oh `my zsh`"
}
heroku() {
  sudo snap install --classic heroku
  success "heroku installed"
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
  chrome
}
# calling the main function
main
