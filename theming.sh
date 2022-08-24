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

sudo echo "Sudo mode"
mkdir ~/theming
cd ~/theming

git clone https://github.com/vinceliuice/Tela-icon-theme.git || {
    echo "Updating Tela-icons"
    cd Tela-icon-theme ; git pull ; cd ~/theming
}
sudo Tela-icon-theme/install.sh

git clone https://github.com/vitorkoch/Vimix-cursors.git || {
    echo "Updating Vimix-cursors"
    cd Vimix-cursors ; git pull ; cd ~/theming
}
sudo Vimix-cursors/install.sh

git clone https://github.com/vinceliuice/WhiteSur-gtk-theme.git || {
    echo "Updating WhiteSur-gtk-theme"
    cd WhiteSur-gtk-theme ; git pull ; cd ~/theming
}
sudo WhiteSur-gtk-theme/install.sh --color Dark --normalshowapps --icon simple -l --opacity normal

mkdir ~/.fonts
sudo cp $SCRIPT_DIR/fonts/* ~/.fonts  


clear
echo -e "
\033[1m
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

Recommended themes
- Cursor: Vimix-cursors
- Icons: Tela-dark
- Shell: Whitesur
- Legacy applications: Whitesur

Go to your system settings (GNOME Tweaks in GNOME Shell) 
and apply the changes

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
\033[0m
"
