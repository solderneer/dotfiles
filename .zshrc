# Essential
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh


# Make sure to use double quotes to prevent shell expansion
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "plugins/git",  from:oh-my-zsh, as:plugin
zplug "denysdovhan/spaceship-prompt", use:spaceship.zsh, from:github, as:theme
zplug "dracula/zsh", as:theme

# Install packages that have not been installed yet
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    else
        echo
    fi
fi

zplug load

# History saving for zsh-autosuggestions
SAVEHIST=100000
HISTFILE=~/.zsh_history

# Pyenv support
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi

eval "$(zoxide init zsh)"

# zsh vi mode
bindkey -v

bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward

export KEYTIMEOUT=1


# Some me specific shortcuts
export projects=~/Documents/Projects
export PATH="$PATH":"/usr/local/opt/flutter/bin"
export PATH="$PATH":"$HOME/.pub-cache/bin"
export PATH="$PATH":"$HOME/bin/nvim-osx64/bin"
export PATH="$PATH":"/Users/solderneer/.local/bin"
export CPATH=`xcrun --show-sdk-path`/usr/include

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias vim="/usr/local/opt/nvim/bin/nvim"

# aliasing common unix commands to more modern ones
alias htop="gtop"
alias cat="bat"
alias ls="exa"
alias du="dust"
alias df="duf"
alias find="fd"
alias ps="procs"
alias cd="z"

setopt hist_ignore_all_dups 
setopt hist_reduce_blanks 
setopt inc_append_history
setopt share_history

# Cool zsh features
setopt auto_cd

# Completion item formatting
setopt auto_list 
setopt auto_menu
setopt always_to_end

zstyle ':completion:*' menu select
zstyle ':completion:*' group-name '' 
zstyle ':completion:::::' completer _expand _complete _ignored _approximate
[ -f "/Users/solderneer/.ghcup/env" ] && source "/Users/solderneer/.ghcup/env" # ghcup-env

# Deno support
fpath=(~/.zsh $fpath)
autoload -Uz compinit
compinit -u

source /Users/solderneer/.config/broot/launcher/bash/br
