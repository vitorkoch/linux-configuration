#!/bin/bash

DEPENDENCIES=(
    yay
    git
    wget
)

for DEPENDECY in ${DEPENDENCIES[@]}; do
    sudo pacman -S "$DEPENDECY" || yay -S "$DEPENDECY"
done

sudo pacman -Syu ; yay -Syu