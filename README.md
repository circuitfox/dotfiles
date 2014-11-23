Dotfiles
========
This repository contains all the custom dotfiles that I consider essential. It
also contains a script that first backs up any of the files in here to `~/dotfiles.old` before
symlinking to the ones in this repository. The script will also clone the `oh-my-zsh`
repository and symlink it.

I3 Conky Configuration
----------------------
The i3 conky script in this repository will look first for a local version of the conkyrc
file, `.i3/conkyrc.local`, before using the minimal fallback provided. It is recommended
that one copies the included conkyrc and modifies it as needed. Any changes to the included
template will need to be copied manually.

Installation
------------

``` bash
    git clone git://github.com/circuitfox/dotfiles.git ~/dotfiles
    cd ~/dotfiles
    ./install.sh
```
