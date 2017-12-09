# vim-config

## Install or update
```
curl https://raw.githubusercontent.com/Chun-Yang/vim-config/master/install.sh | sh
```

## How to use
`~/.vim-config/.vimrc` is the entry point of all the configs. It's recommended that you comment all of the sources and uncomment them one by one after you have an idea of what they do.

Please remeber to run the following command in terminal and restart vim after your change to update plugins.
```
vim +BundleInstall +BundleClean +qall
```

## Fork
If you want to fork this repo, please remeber to set `USER_NAME` in `install.sh` file to yours.

## TODO
- [  ] Integrate YouCompleteMe in install.sh
  .tern-config is tracked right now
