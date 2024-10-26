# Fish Greeting
set fish_greeting "Don't Drink and sudo rm -rf /"

set -gx TERM xterm-256color

# theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

# Golang
set -x GOPATH $HOME/go
set -x PATH $PATH $GOPATH/bin

export EDITOR=nvim

# Functions
function g
    open "https://www.google.com/search?q=$argv"
end

function yt
    open "https://www.youtube.com/results?search_query=$argv"
end

function web
    open "https://$argv"
end

function github
    open "https://www.githubcom/$argv"
end

function cht
  sh ~/bin/cht.sh
end

function synk
  nvm use 16
  cp /Volumes/Kindle/documents/My\ Clippings.txt ~/kindle/kindle-to-notion/resources/
  cd ~/kindle/kindle-to-notion/dist/
  node main.js
end

function notes
  glow $HOME/Library/Mobile\ Documents/com~apple~CloudDocs/Notes
end

# Aliases
alias vim "nvim"
alias ls "ls -p -G"
alias la "ls -A"
alias ll "ls -l"
alias lla "ll -A"
alias g git
alias lg "lazygit"
alias cloud "sh ~/bin/cloud-notes.sh"
alias note "sh ~/bin/notes.sh"
alias tmux-session "sh ~/bin/tmux-session.sh"
alias spt "spotify"
alias ports "lsof -i -P | grep -i 'listen'"
alias g++ 'g++ -std=c++11'
alias codelines 'git ls-files | xargs wc -l'

function fish_user_key_bindings
  bind /co 'fzf (commandline -b)'
end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /Users/ojastyagi/anaconda3/bin/conda
    eval /Users/ojastyagi/anaconda3/bin/conda "shell.fish" "hook" $argv | source
end
# <<< conda initialize <<<

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/ojastyagi/Downloads/google-cloud-sdk/path.fish.inc' ]; . '/Users/ojastyagi/Downloads/google-cloud-sdk/path.fish.inc'; end
