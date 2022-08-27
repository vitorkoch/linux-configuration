#!/bin/bash

echo "Git configuration"
read -p "Name: " name
read -p "Email: " email

git config --global user.name "$name"
git config --global user.email "$email"
git config --global credential.helper store
git config --global init.defaultBranch main
git config --global pull.rebase true
git config --global fetch.prune true
git config --global diff.colorMoved zebra

echo "Sucessful configuration!"