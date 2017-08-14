# Find App ID numbers with `mas search "appname"`.

fancy_echo "Installing Mac App Store Apps.."
mas signout
mas signin $email --dialog

mas install 452520982 ## Minipicker
mas install 823766827 ## OneDrive
mas install 568494494 ## Pocket
mas install 409789998 ## Twitter
mas install 1147396723 ## WhatsApp

green_echo "done."

echo "Outdated Mac App Store Apps:"
mas outdated

fancy_echo "Upgrading Mac App store Apps.."
mas upgrade

green_echo "done."

green_echo "Done with Mac App Store installs..."
