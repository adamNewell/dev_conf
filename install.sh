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
brew install --cask postman
brew install --cask slack
brew install --cask spotify
brew install --cask sublime-text
brew install --cask tunnelblick

brew install go
brew install jq
brew install pv

brew tap homebrew/cask-fonts
brew cask install font-hack-nerd-font

brew tap homebrew/cask-drivers
brew install logitech-g-hub

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
echo "* Fixes for zsh file permissions                                *"
echo "*****************************************************************"

chmod g-w,o-w /usr/local/share/zsh
chmod g-w,o-w /usr/local/share/zsh/site-functions

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

echo "*****************************************************************"
echo "* Write Apple defaults                                          *"
echo "*****************************************************************"

defaults write com.apple.finder AppleShowAllFiles YES
defaults write com.apple.finder WarnOnEmptyTrash -bool false
defaults write com.apple.finder CreateDesktop false
killall finder

echo "*****************************************************************"
echo "* Add Firefox and Set as Default Browser                        *"
echo "*****************************************************************"

brew install --cask firefox-developer-edition
open -a "Firefox Developer Edition" --args --make-default-browser

echo "FINAL STEP!"
echo "Paste the following link in the browser. Libcurl does not support the divvy:// protocol"
echo "divvy://import/YnBsaXN0MDDUAQIDBAUGBwpYJHZlcnNpb25ZJGFyY2hpdmVyVCR0b3BYJG9iamVjdHMSAAGGoF8QD05TS2V5ZWRBcmNoaXZlctEICVRyb290gAGvEBgLDBszNDtERU1OVldgYWprc3R8fYWGkZJVJG51bGzSDQ4PGlpOUy5vYmplY3RzViRjbGFzc6oQERITFBUWFxgZgAKABYAHgAmAC4ANgA+AEYATgBWAF90cHR4fIA4hIiMkJSYnKCkqKywtLiwoMDEqMlhzaXplUm93c18QD3NlbGVjdGlvbkVuZFJvd18QEXNlbGVjdGlvblN0YXJ0Um93WnN1YmRpdmlkZWRWZ2xvYmFsXxASc2VsZWN0aW9uRW5kQ29sdW1uV2VuYWJsZWRbc2l6ZUNvbHVtbnNXbmFtZUtleVxrZXlDb21ib0NvZGVfEBRzZWxlY3Rpb25TdGFydENvbHVtbl1rZXlDb21ib0ZsYWdzEAoQCRAACAmABBAECYADEHsSAJwAAFRsZWZ00jU2NzhaJGNsYXNzbmFtZVgkY2xhc3Nlc1hTaG9ydGN1dKI5OlhTaG9ydGN1dFhOU09iamVjdN0cHR4fIA4hIiMkJSYnKCkqKywtKSwoQEFCQwgJgAQJgAYQfBAFEgCcAABVcmlnaHTdHB0eHyAOISIjJCUmJyguKissLSksKEpLKkwICYAECYAIEH4SAJwAAFN0b3DdHB0eHyAOISIjJCUmJygpQissLSksKFNUKlUICYAECYAKEH0SAJwAAFZib3R0b23dHB0eHyAOISIjJCUmJyguKissLVssKF1eKl8ICYAEEAIJgAwQEhIAHAAAWFRvcCBMZWZ03RwdHh8gDiEiIyQlJicoLiorLC0pLChmZ2hpCAmABAmADhATEAcSABwAAFlUb3AgUmlnaHTdHB0eHyAOISIjJCUmJygpQissLVssKHBxKnIICYAECYAQEBQSABwAAFtCb3R0b20gTGVmdN0cHR4fIA4hIiMkJSYnKClCKywtKSwoeXpoewgJgAQJgBIQFRIAHAAAXEJvdHRvbSBSaWdodN0cHR4fIA4hIiMkJSYnKCkqKywtKSwogoMqhAgJgAQJgBQQLhIAHAAAU01heN0cHR4fIA4hIiMkJSYnKIeIKywtjCwojoePkBAIEAEICYAEEAYJgBYQAxIAHAAAVkNlbnRlctI1NpOUXk5TTXV0YWJsZUFycmF5o5OVlldOU0FycmF5WE5TT2JqZWN0AAgAEQAaACQAKQAyADcASQBMAFEAUwBuAHQAeQCEAIsAlgCYAJoAnACeAKAAogCkAKYAqACqAKwAxwDQAOIA9gEBAQgBHQElATEBOQFGAV0BawFtAW8BcQFyAXMBdQF3AXgBegF8AYEBhgGLAZYBnwGoAasBtAG9AdgB2QHaAdwB3QHfAeEB4wHoAe4CCQIKAgsCDQIOAhACEgIXAhsCNgI3AjgCOgI7Aj0CPwJEAksCZgJnAmgCagJsAm0CbwJxAnYCfwKaApsCnAKeAp8CoQKjAqUCqgK0As8C0ALRAtMC1ALWAtgC3QLpAwQDBQMGAwgDCQMLAw0DEgMfAzoDOwM8Az4DPwNBA0MDSANMA2cDaQNrA2wDbQNvA3EDcgN0A3YDewOCA4cDlgOaA6IAAAAAAAACAQAAAAAAAACXAAAAAAAAAAAAAAAAAAADqw=="

