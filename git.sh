#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `git.sh` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Step 1: Add git mods
echo "------------------------------"
echo "Augmenting Git with custom templates and variables"

cp git_commit.tmpl /Users/$(whoami)/git_commit.tmpl
git config --global commit.template /Users/$(whoami)/git_commit.tmpl
git config --global core.editor "vim -v +16 +startinsert"