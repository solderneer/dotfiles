# Check if zplug is installed
if [[ ! -d ~/.zplug ]]; then
  git clone https://github.com/zplug/zplug ~/.zplug
  source ~/.zplug/init.zsh && zplug update --self
fi

# Essential
source ~/.zplug/init.zsh

# BULLET-TRAIN config
BULLETTRAIN_PROMPT_ORDER=(
  time
  status
  custom
  dir
  screen
  perl
  ruby
  virtualenv
  aws
  go
  rust
  elixir
  git
  hg
  cmd_exec_time
)

BULLETTRAIN_PROMPT_SEPARATE_LINE=false

# Make sure to use double quotes to prevent shell expansion
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "plugins/git",  from:oh-my-zsh, as:plugin

setopt prompt_subst # Make sure prompt is able to be generated properly.
zplug "caiogondim/bullet-train.zsh", use:bullet-train.zsh-theme, defer:3

zplug "b4b4r07/emoji-cli", use:emoji-cli.zsh
# Add a bunch more of your favorite packages!

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
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Run fortune
fortune
