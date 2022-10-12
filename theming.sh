#! /bin/bash

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
mkdir ~/theming ; cd ~/theming

echo "Shell"
git clone https://github.com/vinceliuice/Orchis-theme.git 
cd Orchis-theme ; sudo ./install.sh --libadwaita --size standard --theme default --color dark ; cd ~/theming

git clone https://github.com/vinceliuice/WhiteSur-gtk-theme.git
cd WhiteSur-gtk-theme ; sudo ./install.sh --color Dark --normalshowapps --icon simple -l --opacity normal --round --nord ; cd ~/theming

echo "Icons"
git clone https://github.com/vinceliuice/Tela-icon-theme.git
cd Tela-icon-theme ; sudo ./install.sh ; cd ~/theming

git clone https://github.com/PapirusDevelopmentTeam/papirus-icon-theme.git
cd papirus-icon-theme ; sudo ./install.sh ; cd ~/theming

echo "Cursor"
cd ~/theming ; wget https://github.com/ful1e5/Bibata_Cursor/releases/download/v2.0.2/Bibata-Modern-Classic.tar.gz
tar -xf Bibata-Modern-Classic.tar.gz 
sudo cp -r ./Bibata-Modern-Classic/ /usr/share/icons

echo "Grub"
git clone https://github.com/vinceliuice/grub2-themes.git
cd grub2-themes ; sudo ./install.sh --theme whitesur --icon whitesur ; cd ~/theming

echo "Fonts"
sudo cp $SCRIPT_DIR/fonts/* /usr/share/fonts

echo "Wallpapers"
sudo cp $SCRIPT_DIR/wallpapers/* /usr/share/backgrounds

rm -rf ~/theming
echo -e "
\033[1m
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

Installed
- Cursor: Bibata-Modern-Classic
- Icons: Tela & Papirus
- Shell: WhiteSur-Nord & Orchis
- Fonts: Cascadia Code, Arial, Times New Roman, JetBrains Mono
- Some Wallpapers
- Whitesur grub theme

Go to your system settings (GNOME Tweaks in GNOME Shell) 
and apply the changes

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
\033[0m
"
