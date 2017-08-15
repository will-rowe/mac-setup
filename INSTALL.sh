#!/usr/bin/env bash

dotfiles_repo="http://github.com/will-rowe/dotfiles"
github_repos=("https://github.com/will-rowe/mac-setup" \
     "http://github.com/will-rowe/dotfiles" \
     "https://github.com/will-rowe/rnaseq" \
     "https://github.com/will-rowe/gopherSeq" \
     "https://github.com/will-rowe/aligner-test" \
     "https://github.com/will-rowe/will-rowe.github.io" \
)

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

# Install Go 1.8.3
wget https://storage.googleapis.com/golang/go1.8.3.darwin-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.8.3.darwin-amd64.tar.gz
rm go1.8.3.darwin-amd64.tar.gz

# Install Dotfiles
source dotfiles.sh
source $HOME/.bash_profile

# Setup code directory
code_dir=$HOME/Documents/Code
mkdir -p $code_dir $code_dir/go-workspace $code_dir/git-repos
cd $code_dir/git-repos
for repo in "${github_repos[@]}"; do
  git clone $repo
done
cd $LAPTOP_INSTALL_DIR

# Set macOS preferences
source osx-appstore.sh
source osx-prefs.sh

echo "-------------------------------------"
green_echo "Done provisioning Mac!"
green_echo "You will need to restart for some changes to take effect."
green_echo "Applications requiring sign-in will now open."
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
