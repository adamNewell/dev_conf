echo "*****************************************************************"
echo "* Running xcode-select --install to install basic tooling       *"
echo "*****************************************************************"

xcode-select --install

echo "*****************************************************************"
echo "* Installing Homebrew and packages                              *"
echo "*****************************************************************"

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install --cask google-cloud-sdk
brew install --cask jetbrains-toolbox
brew install --cask iterm2
brew install --cask slack
brew install --cask spotify
brew install --cask sublime-text
brew install --cask tunnelblick

brew install go
brew install jq

brew install macvim

echo "*****************************************************************"
echo "* Installing SpaceVim.                                          *"
echo "*****************************************************************"

curl -sLf https://spacevim.org/install.sh | bash

echo "*****************************************************************"
echo "* Installing Oh My ZSH by Bobby Russell                         *"
echo "*****************************************************************"

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

echo "*****************************************************************"
echo "* Installing Powerlevel10k for ZSH                              *"
echo "*****************************************************************"

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

echo "*****************************************************************"
echo "* Installing Google Cloud Toolkit Components                    *"
echo "*****************************************************************"

gcloud components install -q \
	app-engine-go \
	pubsub-emulator \
	cloud_sql_proxy \
	cloud-build-local \
	docker-credential-gcr \
	app-engine-python \
	app-engine-python-extras

{ echo 'source .zshrc.local \nsource .zshrc.local.powerlevel10k_init'; cat .zshrc; } > .zshrc.new
echo 'source .zshrc.local.powerlevel10k_postfix' >> .zshrc.new
mv .zshrc{.new,}

chmod g-w,o-w /usr/local/share/zsh
chmod g-w,o-w /usr/local/share/zsh/site-functions

defaults write com.apple.finder AppleShowAllFiles YES
defaults write com.apple.finder WarnOnEmptyTrash -bool false
defaults write com.apple.finder CreateDesktop false
killall finder

brew install --cask firefox-developer-edition
open -a "Firefox Developer Edition" --args --make-default-browser
