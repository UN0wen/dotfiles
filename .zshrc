# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
setopt appendhistory
bindkey -e
# End of lines configured by zsh-newuser-install

# zsh-autosuggestions config
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_USE_ASYNC=1
# End of zsh-autosuggestions config

source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fpath=(~/.zsh/zsh-completions/src $fpath)

autoload -U +X bashcompinit && bashcompinit
autoload -U +X compinit && compinit

eval "$(dircolors)"
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS} menu select
zstyle ':completion:*' menu select
zmodload -i zsh/complist

# User configuration
# Example aliases
alias zshconfig="code ~/.zshrc"

# some .bashrc stuff
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# ctrl arrow
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# For docker x forwarding
alias enable_docker_x_host="xhost +local:docker"
alias lsgit='git branch --sort=-committerdate'
alias flutter_build_runner='flutter pub run build_runner build --delete-conflicting-outputs'
alias stop_docker='docker kill $(docker ps -q)'

export PATH=$PATH:"$HOME/flutter/bin"
export PATH="$PATH":"$HOME/.pub-cache/bin"

PATH="$PATH:$HOME/repos/qoowa/bin"
source qoowa-robot-completion

# set PATH so it includes user's private bin if it exists            
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi  

# set PATH so it includes user's private bin if it exists            
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi 

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
export PATH=$(pyenv root)/shims:$PATH

ssh-add ~/.ssh/duy-dev.pem 2> /dev/null
export PATH="/home/duy/.local/bin:$PATH"
export PATH=/usr/local/go/bin:/home/duy/go/bin:$PATH

export PYTHONPATH="/home/duy/repos/qoowa/src/python_modules:/home/duy/repos/qoowa/src/protobuf/src/python"
alias p81clear="sudo rm -rf /etc/Perimeter81/*
rm -rf ~/.config/Perimeter81
sudo service perimeter81helper restart"

# starship
eval "$(starship init zsh)"