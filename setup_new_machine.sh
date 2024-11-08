#!/bin/bash

REPO_URL="https://github.com/DigitalDemi/.dotfiles"
TMP_DIR="tmpdotfiles"
DOTFILES_DIR="$HOME/.dotfiles"

git clone --separate-git-dir="$DOTFILES_DIR" "$REPO_URL" "$TMP_DIR"

rsync --recursive --verbose --exclude '.git' "$TMP_DIR/" "$HOME/"

rm -rf "$TMP_DIR"

echo "Dotfiles setup complete."

