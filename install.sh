#!/bin/sh

DIR="$HOME/dotfiles"
OLDDIR="$HOME/dotfiles.old"
FILES=".emacs.d .i3 .Xresources .zsh_custom .zshrc .oh-my-zsh .irssi .vimrc .vim" # files and folders to symlink as dotfiles
BINFILES="i3bar-conky pulsectl i3lock-blur colors.sh" # files and folders to sylink to ~/bin

echo "Creating backup dir: $OLDDIR"
mkdir -p $OLDDIR
echo "Changing to $DIR"
cd $DIR

# symlink all the dotfiles
for file in $FILES; do
    DESTFILE="$HOME/$file"
    if [ -e $DESTFILE ]; then
        mv $DESTFILE $OLDDIR
    fi
    if ! [ -h $DESTFILE ]; then
        ln -s $DIR/$file $DESTFILE
    fi
done

# symlink supporting scripts
for file in $BINFILES; do
    DESTFILE="$HOME/bin/$file"
    if [ -e $DESTFILE ]; then
        mv $DESTFILE $OLDDIR
    fi
    if ! [ -h $DESTFILE ]; then
        ln -s $DIR/$file $DESTFILE
    fi
done

# installs oh-my-zsh and sets zsh as the default shell
install_oh_my_zsh() {
    if [ -f /bin/zsh -o -f /usr/bin/zsh ]; then
        if [ ! -d $DIR/.oh-my-zsh ]; then
            git clone git://github.com/robbyrussell/oh-my-zsh.git $DIR/.oh-my-zsh
        fi
        if [ $(echo "$SHELL") != "$(which zsh)" ]; then
            chsh -s "$(which zsh)"
        fi
    else
        echo "Please install zsh, then run this script again."
        exit 1
    fi
}

install_oh_my_zsh
