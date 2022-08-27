#!/bin/bash

echo "Git configuration"
read -p "Name: " name
read -p "Email: " email

git config --global user.name "$name"
git config --global user.email "$email"
git config --global credential.helper store
git config --global init.defaultBranch main

echo "Sucessful configuration!"