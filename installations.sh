#!/bin/bash

shopt -s expand_aliases

mkdir -p ~/Code/
[ ! -e ~/Code/settings ] && cp -R $(dirname) ~/Code/settings

# iterm2
## Specify the preferences directory
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "~/Code/settings/iterm2"
## Tell iTerm2 to use the custom preferences in the directory
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true

# git aware prompt
[ ! -e ~/Code/git-aware-prompt ] && git clone https://github.com/btruhand/git-aware-prompt.git ~/Code/git-aware-prompt

# prepare npm-packages folder
mkdir -p ~/.npm-packages
# initialize bash profile
cp ~/Code/settings/dotfiles/bash_profile ~/.bash_profile
source ~/.bash_profile

# Copy bashrc
dotcp bashrc

# Copy all remaining dotfiles
dotcp tern-project
dotcp vimrc
dotcp eslintrc.json
dotcp gitconfig

# Install brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install node
brew install node
## Install n
npm install -g n
## Install latest lts node version
n lts

# Install jsctags
npm install -g jsctags
# Install python3
brew install python3
# Install vim
brew install vim --with-override-system-vi
## Install stereokai color scheme
mkdir ~/.vim/colors
git clone https://github.com/gummesson/stereokai.vim.git ~/.vim/stereokai
cp -r ~/.vim/stereokai/colors/stereokai.vim ~/.vim/colors/
rm -rf ~/.vim/stereokai
## Install vim plugins
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall

# Setting up YCM
## Install cmake
brew install cmake
## Install YCM
~/.vim/bundle/YouCompleteMe/./install.py --tern-completer


# Setting up tern_for_vim
cd ~/.vim/bundle/tern_for_vim/ && npm install
# Install rbenv
brew install rbenv
## Install ruby v2.3.0
rbenv install 2.3.0

# install bundler and ripper-tags
rbenv local 2.3.0
gem install bundler
gem install ripper-tags
# install latest git
brew install git

# install php
brew tap homebrew/homebrew-php


# base
brew install php56


#xedebug
brew install php56-xdebug
brew install php56-intl
brew install php56-mcrypt
## install phpctags
curl -Ss http://vim-php.com/phpctags/install/phpctags.phar > ~/Code/tools/phpctags

# install java
brew cask install java

# install graphviz (mainly for plantuml)
## Install libtool
brew install libtool
## Install graphviz
brew install graphviz

# brew health checkup
brew doctor

# make public key
ssh-keygen -t rsa
cat ~/.ssh/id_rsa.pub
