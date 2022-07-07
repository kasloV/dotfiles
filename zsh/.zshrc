#!/bin/sh

# Config dir
export ZDOTDIR=$HOME/.config/zsh

# ZSH history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=1000
setopt INC_APPEND_HISTORY_TIME
setopt INTERACTIVE_COMMENTS

autoload -Uz colors && colors

source "$ZDOTDIR/zsh-functions"

zsh_add_file "zsh-aliases"
zsh_add_file "zsh-prompt"

zsh_add_plugin "zsh-users/zsh-completions"
zsh_add_plugin "Tarrasch/zsh-bd"
zsh_add_plugin "unixorn/fzf-zsh-plugin"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
export PATH="$HOME/.config/zsh/plugins/fzf-zsh-plugin/bin":$PATH

# zsh_add_plugin "spaceship-prompt/spaceship-prompt"
# autoload -U promptinit; promptinit
# prompt spaceship

# bd need to be explicitly loaded due to difference in plugin name and git repo name
zsh_add_file "plugins/zsh-bd/bd.zsh"

source "$ZDOTDIR/zsh-completion"

ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=yellow
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=yellow
ZSH_HIGHLIGHT_STYLES[single-quoted-argument-unclosed]=default
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=yellow
ZSH_HIGHLIGHT_STYLES[double-quoted-argument-unclosed]=default

bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  "^[[3~"  delete-char

# nvm
# source /usr/share/nvm/init-nvm.sh

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
