#!/usr/bin/env bash

# ~/pydata.sh

# Removed user's cached credentials
# This script might be run with .dots, which uses elevated privileges
sudo -K

echo "------------------------------"
echo "Setting up pip."

# Install pip
easy_install pip

echo "------------------------------"
echo "Setting up Python environment"

# Check for Homebrew,
# Install if we don't have it
echo "Checking for homebrew"
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

eval "$(/opt/homebrew/bin/brew shellenv)"

echo "Setting up pyenv"
brew install pyenv

echo "Setting up pyenv-virtualenv"
brew install pyenv-virtualenv

echo "------------------------------"
echo "Script completed."
