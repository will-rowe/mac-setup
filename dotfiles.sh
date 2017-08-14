# Install dotfiles
fancy_echo "Cloning dotfiles..."
git clone $dotfiles_repo $HOME/.dotfiles

green_echo "done."

echo "Symlinking with thoughtbot/rcup..."
cd $HOME && rcup -v

green_echo "done."

cd $LAPTOP_INSTALL_DIR

green_echo "Done with dotfiles install!"
