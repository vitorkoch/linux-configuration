#! /bin/bash
echo "Adding conky.conf file"
mkdir -p ~/.config/conky/
cp ./conky/conky.conf ~/.config/conky/
mkdir -p ~/.fonts
echo "Adding Josefin Sans font"
cp fonts/JosefinSans-Regular.ttf ~/.fonts
echo "Done"