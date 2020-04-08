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

  # adb
  sudo apt-get install adb
  success "installed adb for android"

  
  # font manager
  sudo apt-get install font-manager
  success "font manager"

  # heroku
  sudo snap install --classic heroku
  success "heroku installed"

  # winehq
  sudo dpkg --add-architecture i386
  wget -qO - https://dl.winehq.org/wine-builds/winehq.key | sudo apt-key add -
  #in ubuntu 18.04
  sudo apt-add-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ bionic main'
  sudo apt-get update
  sudo apt-get upgrade
  sudo apt-get install --install-recommends winehq-stable
  sudo apt-get install aptitude
  sudo aptitude install winehq-stable
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
  sudo apt install npm
  npmversion="$(npm --version)"
  if [ npmversion ]; then
    success "npm installed successfully"
  else
    error "error installing npm"
  fi

  # typescript
  sudo npm install -g typescript
  tsversion="$(tsc -v)"
  if [ ngversion ]; then
    success "typescript installed successfully"
  else
    error "error installing typescript"
  fi

  # angular
  sudo npm install -g @angular/cli@6.1.1
  ngversion="$(ng --version)"
  if [ ngversion ]; then
    success "angular 6 installed successfully"
  else
    error "error installing angular 6"
  fi

  # zsh
  sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  success "installed oh my zsh | now restart the computer"
}

#git() {
  #sudo apt-get install git-all
  # configuration
  # username
  #git config --global user.name "Dnmrk4"
  # email address
  #git config --global user.email "danmark.chemuren@gmail.com"
  #success "installed git"
#}

chrome() {
  sudo apt-get install libxss1 libappindicator1 libindicator7
  wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
  sudo apt install ./google-chrome*.deb  
  success "installed stable chrome"
}

gnome-tweak() {
  sudo apt-get install chrome-gnome-shell
  sudo apt-get install gnome-tweak-tool
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
  gnome_tweak
  ubuntu
  javascript
  chrome
}

# calling the main function
main
