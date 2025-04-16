cowsay "Don't drink and sudo rm -rf /"
echo ""

# Obsidian vault
alias odr="cd $HOME/Library/Mobile\ Documents/iCloud\~md\~obsidian/Documents/Vault/"

alias wizwarm="wiz s bulb 11"
alias wizcool="wiz s bulb 13"
alias wizoff="wiz p bulb off"
alias wizon="wiz p bulb on"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if [ -f "$HOME/.secrets" ]; then
    source "$HOME/.secrets"
fi

export ZSH="$HOME/.oh-my-zsh"
export EDITOR="nvim"
export VISUAL="nvim"

export PATH="$HOME/bin:$PATH"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  fzf
  zsh-autosuggestions
  zsh-syntax-highlighting
  web-search
)

source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
