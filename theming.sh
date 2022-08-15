#!/bin/bash

# Source: https://stackoverflow.com/a/246128
SOURCE=${BASH_SOURCE[0]}
while [ -L "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
    SCRIPT_DIR=$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )
    SOURCE=$(readlink "$SOURCE")
    [[ $SOURCE != /* ]] && SOURCE=$SCRIPT_DIR/$SOURCE # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
SCRIPT_DIR=$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )
#echo "Script dir: $SCRIPT_DIR"
# ==========================================

mkdir ~/theming
cd ~/theming

git clone https://github.com/EliverLara/candy-icons.git || {
    echo "Updating candy-icons"
    cd candy-icons ; git pull ; cd ~/theming
}
mkdir ~/.icons
cp -r candy-icons ~/.icons

git clone https://github.com/vitorkoch/Vimix-cursors.git || {
    echo "Updating Vimix-cursors"
    cd Vimix-cursors ; git pull ; cd ~/theming
}
Vimix-cursors/install.sh

git clone https://github.com/vinceliuice/WhiteSur-gtk-theme.git || {
    echo "Updating WhiteSur-gtk-theme"
    cd WhiteSur-gtk-theme ; git pull ; cd ~/theming
}
WhiteSur-gtk-theme/install.sh -c Dark --normal -i simple -t purple -o normal -P smaller

mkdir ~/.fonts
cp $SCRIPT_DIR/fonts/* ~/.fonts  

# Tweaks
gsettings set org.gnome.desktop.interface gtk-theme "WhiteSur-Dark-purple"
gsettings set org.gnome.shell.extensions.user-theme name "WhiteSur-Dark-purple"
gsettings set org.gnome.desktop.interface icon-theme "candy-icons"
gsettings set org.gnome.desktop.interface cursor-theme "Vimix-cursors"
gsettings set org.gnome.desktop.interface cursor-size 32
gsettings set org.gnome.desktop.interface font-name "Cascadia Code 13"
gsettings set org.gnome.desktop.peripherals.mouse accel-profile flat