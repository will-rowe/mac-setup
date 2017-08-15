# Custom Mac Setup

Provision a new Mac laptop with frequently used software and settings.

Based on `thoughtbot/laptop` and `dannysmith/laptop-danny`.


## Install

```shell

# Install command line tools
xcode-select --install

 # Run a software update
sudo softwareupdate --install --all

 # Clone this repo and run the setup
git clone http://github.com/will-rowe/mac-setup ~/Desktop
cd ~/Desktop/mac-setup
chmod +x ./INSTALL.sh
./INSTALL.sh
```


## Manual Steps

- Install GoogleDrive, Conda, Jekyll
- Start syncs with Dropbox etc.
- Setup exchange mail accounts


## To Do

Setup workspace directories
Pull Git repos
Install bioinformatics software


## Notes

MAS is used to download / update installed AppStore apps. THIS ONLY WORKS FOR APPS THAT HAVE ALREADY BEEN INSTALLED/PURCHASED AGAINST YOUR APPLE ID.
