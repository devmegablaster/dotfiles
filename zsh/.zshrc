# Functions
function google() { open /Applications/Safari.app/ "http://www.google.com/search?q= $1"; }

function yt() { open /Applications/Safari.app/ "http://www.youtube.com/results?search_query= $1"; }

function web() { open /Applications/Safari.app/ "http://$1"; }

# Starship Prompt
eval "$(starship init zsh)"

# Path to ohmyzsh installation.
export ZSH="/Users/ojastyagi/.oh-my-zsh"

# Plugins
plugins=( git )

# Theme
ZSH_THEME="powerlevel10k/powerlevel10k"

source $ZSH/oh-my-zsh.sh

# User configuration

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/ojastyagi/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/ojastyagi/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/ojastyagi/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/ojastyagi/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

