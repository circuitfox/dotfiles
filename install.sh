#!/bin/sh

SCRIPTDIR="$(cd $(dirname $0); pwd -P)"

# symlink these to ~/.*
DOTFILES=".vimrc .Xresources .zshrc"
DOTDIRS="i3 vim zsh"

# symlink these to ~/bin
BINS="bin"

link() {
    if [ -f "$2" -o -h "$2" ]; then
        echo "Replacing $2"
        rm "$2"
    else
        echo "Linking $1 -> $2"
    fi
    ln -s "$1" "$2"
}

if [ ! -d "$SCRIPTDIR/vim/bundle/Vundle.vim" ]; then
    printf "Need to clone Vundle, remember to PluginInstall in vim\n"
    git clone "git://github.com/VundleVim/Vundle.vim.git" "$SCRIPTDIR/vim/bundle/Vundle.vim"
fi

if [ ! -d "$SCRIPTDIR/.oh-my-zsh" ]; then
    printf "Need to clone oh-my-zsh\n"
    git clone "git://github.com/robbyrussell/oh-my-zsh.git" "$SCRIPTDIR/.oh-my-zsh"
    ln -s "$SCRIPTDIR/.oh-my-zsh" "$HOME/.oh-my-zsh"
fi

for f in $DOTFILES; do
    df="$SCRIPTDIR/$f"
    hf="$HOME/$f"
    link "$df" "$hf"
done

for f in $DOTDIRS; do
    df="$SCRIPTDIR/$f"
    hf="$HOME/.$f"
    link "$df" "$hf"
done

for d in $BINS; do
    for f in $(ls ${SCRIPTDIR}/$d); do
        bf="$SCRIPTDIR/$d/$f"
        hf="$HOME/bin/$f"
        link "$bf" "$hf"
    done
done
