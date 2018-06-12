#!/usr/bin/env bash

# Ask for admin pw upfront
sudo -v

echo -e "\n\e[1;3m\xe2\x86\x92 Set defaults\e[0m\n"

# set defaults
./defaults.sh

# install homebrew
echo -e "\n\e[1;3m\xe2\x86\x92 Install Homebrew\e[0m\n"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo -e "\n\e[1;3m\xe2\x86\x92 Install packages\e[0m\n"
brew bundle

echo -e "\n\e[1;3m\xe2\x86\x92 Install oh-my-zsh\e[0m\n"
curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

echo -e "\n\e[1;3m\xe2\x86\x92 Add custom shells\e[0m\n"
echo /usr/local/bin/bash | sudo tee -a /etc/shells
echo /usr/local/bin/zsh | sudo tee -a /etc/shells

# symlink dotfiles, force replace any existing
echo -e "\n\e[1;3m\xe2\x86\x92 Symlink dotfiles\e[0m\n"
for file in $(find $PWD/link ! -name 'link' ! -name '.DS_Store' -maxdepth 1);do
	ln -sfv $file $HOME
done

# switch login shell to zsh
echo -e "\n\e[1;3m\xe2\x86\x92 Change login shell\e[0m\n"
chsh -s /usr/local/bin/zsh
zsh

echo -e "\n\e[1;3m\xe2\x86\x92 Source and reload shell\e[0m\n"

# source changes and reload
echo -e "\n\e[1;3m\xe2\x86\x92 Source and reload shell\e[0m\n"
source ~/.zshrc
reload

echo -e "\n\e[1;3m\xe2\x86\x92 Done.\e[0m"

