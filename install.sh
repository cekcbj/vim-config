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
  echo "[INFO] vim is not installed, installing vim..."
  brew install vim
fi

# install Vundle
if [ ! -d ~/.vim/bundle/Vundle.vim ]
then
  echo "[INFO] Vundle.vim is not installed, installing Vundle.vim..."
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

# clone repo
USER_NAME=Chun-Yang
if [ -d ~/.vim-config ]
then
  echo "[INFO] vim-config is installed, updating now..."
  git -C ~/.vim-config pull git@github.com:${USER_NAME}/vim-config.git
else
  echo "[INFO] vim-config is not installed, installing vim-config..."
  git clone https://github.com/${USER_NAME}/vim-config ~/.vim-config
fi

# link .vimrc file
if [ -f ~/.vimrc ]
then
  if [ "`readlink ~/.vimrc`" != "`ls ~/.vim-config/.vimrc`" ]
  then
    echo "[INFO] existing .vimrc file is moved to .vimrc.backup"
    mv ~/.vimrc ~/.vimrc.backup
    echo "[INFO] link ~/.vim-config/.vimrc to ~/.vimrc"
    ln -s ~/.vim-config/.vimrc ~/.vimrc
  fi
else
  echo "[INFO] link ~/.vim-config/.vimrc to ~/.vimrc"
  ln -s ~/.vim-config/.vimrc ~/.vimrc
fi

# link .tern-config file
if [ -f ~/.tern-config ]
then
  if [ "`readlink ~/.tern-config`" != "`ls ~/.vim-config/.tern-config`" ]
  then
    echo "[INFO] existing .tern-config file is moved to .tern-config.backup"
    mv ~/.tern-config ~/.tern-config.backup
    echo "[INFO] link ~/.vim-config/.tern-config to ~/.tern-config"
    ln -s ~/.vim-config/.tern-config ~/.tern-config
  fi
else
  echo "[INFO] link ~/.vim-config/.tern-config to ~/.tern-config"
  ln -s ~/.vim-config/.tern-config ~/.tern-config
fi
