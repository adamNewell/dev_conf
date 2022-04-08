#!/usr/bin/env bash

# ~/aws.sh

# Removed user's cached credentials
# This script might be run with .dots, which uses elevated privileges
sudo -K

echo "------------------------------"
echo "Setting up AWS."

###############################################################################
# System-Wide Packages                                                        #
###############################################################################

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

eval "$(/opt/homebrew/bin/brew shellenv)"

# Make sure we’re using the latest Homebrew.
brew update

###############################################################################
# Install IPython Notebook Spark Integration
###############################################################################
brew install awscli

echo "------------------------------"
echo "TODO: Run aws --configure to set up your AWS credentials and region."
echo "TODO: Run s3cmd --configure to set up your credentials, location, and passphrase."
echo "Script completed."
