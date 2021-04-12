if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ZSH_THEME="powerlevel10k/powerlevel10k"
DISABLE_UPDATE_PROMPT="true"

export UPDATE_ZSH_DAYS=7

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Path to your oh-my-zsh installation.
export ZSH="/Users/$USER/.oh-my-zsh"
export TERM="xterm-256color"
export VISUAL="vim"
export GOPATH="/Users/$USER/code/go/"

GCLOUD_SDK_PATH="/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/"
[[ ! -f $GCLOUD_SDK_PATH/path.zsh.inc ]] || source $GCLOUD_SDK_PATH/path.zsh.inc 
[[ ! -f $GCLOUD_SDK_PATH/completion.zsh.inc ]] || source $GCLOUD_SDK_PATH/completion.zsh.inc 

# ZSH Completion
zstyle ':completion:*' menu select=2
zstyle ':completion:*' verbose yes
zstyle ':completion:*' descriptions format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for %d'
zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes

export BASH_COMPLETION_COMPAT_DIR="/usr/local/etc/bash_completion.d"
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

plugins=(
  git
  osx
  web-search
  docker
  docker-compose
  golang
  urltools
)

source $ZSH/oh-my-zsh.sh

alias sshconfig="vim $HOME/.ssh/config"
alias vimconfig="vim $HOME/.vimrc"
alias zshconfig="vim $HOME/.zshrc"
alias zsource="source $HOME/.zshrc"
alias ohmyzsh="vim $HOME/.oh-my-zsh"
alias vim="mvim -v"
alias pip="pip3"
alias docker-images-update="docker images | grep -v REPOSITORY | awk '{print $1}' | xargs -L1 docker pull"
alias config='/usr/bin/git --git-dir=$HOME/.dev_conf/ --work-tree=$HOME'

[[ ! -f $HOME/.p10k.zsh ]] || source $HOME/.p10k.zsh

PATH=$PATH:/usr/local/sbin
PATH=$PATH:$GOPATH/bin

