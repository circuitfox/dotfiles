#!/bin/sh

OLDPWD=$(pwd)
DIR="$HOME/dotfiles"
OLDDIR="$HOME/dotfiles.old"
FILES=".emacs .emacs.d .i3 .Xresources .zsh_custom .zshrc .oh-my-zsh" # files and folders to symlink as dotfiles
BINFILES="i3bar-conky" # files and folders to sylink to ~/bin

echo "Creating backup dir: $OLDDIR"
mkdir -p $OLDDIR
echo "Changing to $DIR"
cd $DIR

# symlink all the dotfiles
for file in $FILES; do
    mv "$HOME/$file" $OLDDIR
    ln -s $DIR/$file "$HOME/$file"
done

# symlink supporting scripts
for file in $BINFILES; do
    mv "$HOME/bin/$file" $OLDDIR
    ln -s $DIR/$file "$HOME/bin/$file"
done

# installs oh-my-zsh and sets zsh as the default shell
install_oh_my_zsh() {
    if [ -f /bin/zsh -o -f /usr/bin/zsh ]; then
        if [ ! -d $DIR/.oh-my-zsh ]; then
            git clone git://github.com/robbyrussell/oh-my-zsh.git $DIR/.oh_my_zsh
        fi
        if [ $(echo "$SHELL") != "$(which zsh)" ]; then
            chsh -s "$(which zsh)"
        fi
    else
        echo "Please install zsh, then run this script again."
        exit
    fi
}

install_oh_my_zsh
