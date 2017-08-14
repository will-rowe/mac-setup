#!/bin/bash

dotfiles_repo="http://github.com/will-rowe/dotfiles"

fancy_echo() {
  local fmt="$1"; shift
  printf "\n\e[95m$fmt\e[97m\n\n" "$@"
}

green_echo() {
  local fmt="$1"; shift
  printf "\n\e[92m$fmt\e[97m\n" "$@"
}

input_echo() {
  local fmt="$1"; shift
  printf "\e[93m$fmt\e[97m " "$@"
}

echo
echo "--------------------"
echo "Setting up new Mac"
echo "--------------------"
echo

# Set current directory, so we can change back to it in the scripts.
export LAPTOP_INSTALL_DIR=$(pwd)

# Get admin password, email and mac app store passwords
input_echo "Email Address: "
read email

stty -echo # Switch off echoing back text

input_echo "Setup will require sudo: "
echo
sudo -v
# Keep-alive: update existing `sudo` time stamp until finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
echo

stty echo # Switch on echoing back text
echo
echo

fancy_echo "-------------------------------------"
input_echo "Email:"
echo $email
input_echo "Dotfiles repo:"
echo $dotfiles_repo
fancy_echo "-------------------------------------"

echo "Running install scripts..."

# Run homebrew Script to install software and dependencies
source brew.sh

# Install Dotfiles
source dotfiles.sh

# Install Go 1.8.3
wget https://storage.googleapis.com/golang/go1.8.3.darwin-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.8.3.darwin-amd64.tar.gz
rm go1.8.3.darwin-amd64.tar.gz

# Set macOS preferences
source osx-appstore.sh
source osx-prefs.sh

echo "-------------------------------------"
green_echo "Done provisioning Mac!"
echo

# Open Mail to setup accounts
open /Applications/Mail.app

# Open Dropbox and OneDrive
open /Applications/Dropbox.app
open /Applications/OneDrive.app

# Open Chrome to sign into google accounts
open /Applications/Google\ Chrome.app

# Clear the bash history
cat /dev/null > ~/.bash_history
