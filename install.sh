#!/bin/sh

# installed brew
brew --version > /dev/null 2>&1
if [ $? -ne 0 ]
then
  echo "brew is not installed, installing brew..."
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# install vim
vim --version > /dev/null 2>&1
if [ $? -ne 0 ]
then
  echo "vim is not installed, installing vim..."
  brew install vim
  brew install reattach-to-user-namespace
  brew install the_silver_searcher
fi

# install Vundle
if [ ! -d ~/.vim/bundle/Vundle.vim ]
then
  echo "Vundle.vim is not installed, installing Vundle.vim..."
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

# clone repo
if [ ! -d ~/.vim-config ]
then
  echo "vim-config is not installed, installing vim-config..."
  git clone https://github.com/Chun-Yang/vim-config ~/.vim-config
fi

# replace vimrc file
if [ -f ~/.vimrc ]
then
  echo "existing .vimrc file is moved to .vimrc.backup"
  mv ~/.vimrc ~/.vimrc.backup
fi
ln -s ~/.vim-config/.vimrc ~/.vimrc
