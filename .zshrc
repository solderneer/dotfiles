# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Essential
export ZPLUG_HOME=/opt/homebrew/opt/zplug
source $ZPLUG_HOME/init.zsh

zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "plugins/git",  from:oh-my-zsh, as:plugin
zplug romkatv/powerlevel10k, as:theme, depth:1

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

# PATH
export PATH="/Users/solderneer/Tooling/bin:$PATH"

# Aliases
alias vim="nvim"
alias get_idf=". $HOME/Tooling/esp/esp-idf/export.sh"
alias get_nrf="source /opt/nordic/ncs/zephyr/zephyr-env.sh"


# Autocomplete
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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Setup FZF
source <(fzf --zsh)

# Zoxide
eval "$(zoxide init zsh)"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/solderneer/Tooling/miniconda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/solderneer/Tooling/miniconda/etc/profile.d/conda.sh" ]; then
        . "/Users/solderneer/Tooling/miniconda/etc/profile.d/conda.sh"
    else
        export PATH="/Users/solderneer/Tooling/miniconda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
