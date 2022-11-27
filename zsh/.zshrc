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
neofetch
fish

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
