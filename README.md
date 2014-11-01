Dotfiles
========
This repository contains all the custom dotfiles that I consider essential. It
also contains a script that first backs up any of the files in here to `~/dotfiles.old` before
symlinking to the ones in this repository. The script will also clone the `oh-my-zsh`
repository and symlink it.

Installation
------------

``` bash
    git clone git://github.com/circuitfox/dotfiles.git ~/dotfiles
    cd ~/dotfiles
    ./install.sh
```
