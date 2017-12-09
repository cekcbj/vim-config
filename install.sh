#!/bin/sh

# installed brew
brew --version > /dev/null 2>&1
if [ $? -ne 0 ]
then
  echo "[INFO] brew is not installed, installing brew..."
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

link_file() {
  if [ -e $2 ]
  then
    if [ "`readlink $2`" != "`ls $1`" ]
    then
      echo "[INFO] existing $2 file is moved to $2.backup"
      mv $2 $2.backup
      echo "[INFO] link $1 to $2"
      ln -s $1 $2
    fi
  else
    echo "[INFO] link $1 to $2"
    ln -sf $1 $2
  fi
}

# link .vimrc file
link_file ~/.vim-config/.vimrc ~/.vimrc

# link .tern-config file
link_file ~/.vim-config/.tern-config ~/.tern-config

echo "[STATUS] SUCCESS"
