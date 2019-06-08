#!/bin/bash
readonly NAME="name"
readonly EMAIL="email"

# git config --global user.name ${NAME}
# git config --global user.email ${EMAIL}
git config --global core.autoCRLF false
git config --global core.quotepath false
git config --global core.editor "code --wait"
git config --global merge.tool vscode
git config --global diff.tool vscode
