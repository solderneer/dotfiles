# Essential
source ~/.zplug/init.zsh

# BULLET-TRAIN config
# BULLETTRAIN_PROMPT_ORDER=(
#   time
#   status
#   custom
#   dir
#   screen
#   git
#   cmd_exec_time
# )

BULLETTRAIN_PROMPT_SEPARATE_LINE=false

# Make sure to use double quotes to prevent shell expansion
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "plugins/git",  from:oh-my-zsh, as:plugin
zplug "denysdovhan/spaceship-prompt", use:spaceship.zsh, from:github, as:theme

# disabling the old theme
# setopt prompt_subst # Make sure prompt is able to be generated properly.
# zplug "caiogondim/bullet-train.zsh", use:bullet-train.zsh-theme, defer:3

zplug "b4b4r07/emoji-cli", use:emoji-cli.zsh

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
eval "$(pyenv init -)"

# Some me specific shortcuts
export projects=~/Documents/Projects
export PATH="$PATH":"$HOME/bin/flutter/bin"
export PATH="$PATH":"$HOME/.pub-cache/bin"
export PATH="$PATH":"$HOME/bin/nvim-osx64/bin"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias vim="$HOME/bin/nvim-osx64/bin/nvim"

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
