#!/bin/sh
DOTFILES="$(dirname $(cd $(dirname $0); pwd -P))"

if [ -z "$1" ]; then
    echo "USAGE: $(basename $0) theme"
    exit 1
fi

# themes are in xresources/themes
THEMES="$DOTFILES/xresources/themes"
THEME="$DOTFILES/xresources/theme"
if [ -f "$THEMES/$1" ]; then
    if [ -f "$THEME" -o -h "$THEME" ]; then
        echo "Replacing old theme"
        rm "$THEME"
    fi
    echo "Current theme: '$1'"
    ln -s "$THEMES/$1" "$THEMES/../theme"
    xrdb -I"$HOME" -merge "$DOTFILES/.Xresources"
else
    echo "Theme '$1' does not exist in $THEMES"
    exit 1
fi
