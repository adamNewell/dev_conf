#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

eval "$(/opt/homebrew/bin/brew shellenv)"

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Tap additional kegs
brew tap homebrew/cask-versions
brew tap homebrew/cask-fonts
brew tap homebrew/cask-drivers

# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install some other useful utilities like `sponge`.
brew install moreutils

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils

# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed

# Install Bash 4.
brew install bash
brew install bash-completion@2

# Install Oh My ZSH
brew install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# We installed the new shell, now we have to activate it
echo "Adding the newly installed shell to the list of allowed shells"

# Prompts for password
sudo bash -c 'echo /usr/local/bin/bash >> /etc/shells'

# Change to the new shell, prompts for password
chsh -s /usr/local/bin/bash

# Install `wget` with IRI support.
brew install wget

# Install ruby-build and rbenv
brew install ruby-build
brew install rbenv
LINE='eval "$(rbenv init -)"'
grep -q "$LINE" ~/.extra || echo "$LINE" >> ~/.extra

# Install more recent versions of some OS X tools.
brew install grep
brew install openssh
brew install screen

# Install font tools.
#brew tap bramstein/webfonttools
#brew install sfnt2woff
#brew install sfnt2woff-zopfli
#brew install woff2

# Install some CTF tools; see https://github.com/ctfs/write-ups.
#brew install aircrack-ng
#brew install bfg
#brew install binutils
#brew install binwalk
#brew install cifer
#brew install dex2jar
#brew install dns2tcp
#brew install fcrackzip
#brew install foremost
#brew install hashpump
#brew install hydra
#brew install john
#brew install knock
#brew install netpbm
#brew install nmap
#brew install pngcheck
#brew install socat
#brew install sqlmap
#brew install tcpflow
#brew install tcpreplay
#brew install tcptrace
#brew install ucspi-tcp # `tcpserver` etc.
#brew install homebrew/x11/xpdf
#brew install xz

# Install other useful binaries.
brew install ack

#brew install exiv2
brew install git
brew install git-lfs
brew install git-flow
brew install git-extras
brew install hub
brew install p7zip
brew install pigz
brew install pv
brew install ssh-copy-id
brew install tree
brew install zopfli
brew install macvim
brew install jq

# Core casks
brew install --cask --appdir="~/Applications" iterm2

# Development tool casks
brew install --cask --appdir="/Applications" sublime-text
brew install --cask --appdir="/Applications" vagrant

# Misc casks
brew install --cask --appdir="/Applications" firefox-developer-edition
brew install --cask --appdir="/Applications" slack

brew install --cask --appdir="/Applications" jetbrains-toolbox
brew install --cask --appdir="/Applications" postman
brew install --cask --appdir="/Applications" microsoft-teams
brew install --cask --appdir="/Applications" spotify
brew install --cask --appdir="/Applications" tunnelblick
brew install --cask --appdir="/Applications" parallels
brew install --cask --appdir="/Applications" airfoil
brew install --cask --appdir="/Applications" logitech-g-hub

brew install --cask font-hack-nerd-font

# Install Docker
brew install docker

# Install developer friendly quick look plugins; see https://github.com/sindresorhus/quick-look-plugins
brew install --cask qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzip qlimagesize webpquicklook suspicious-package quicklookase qlvideo

# Install PowerLevel10K
brew install romkatv/powerlevel10k/powerlevel10k

# Set Firefox as default browser
open -a "Firefox Developer Edition" --args --make-default-browser

# Install SpaceVim
curl -sLf https://spacevim.org/install.sh | bash

# Remove outdated versions from the cellar.
brew cleanup
