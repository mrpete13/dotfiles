fpath+=$HOME/.zsh/pure
export ZSH="/home/mrpete/.oh-my-zsh"

ZSH_THEME="robbyrussell"
EDITOR="/usr/bin/vim"
autoload -U promptinit; promptinit
prompt pure

plugins=(git 
	vi-mode 
	zsh-completions 
	zsh-autosuggestions 
	zsh-syntax-highlighting)
autoload -U compinit && compinit

source $ZSH/oh-my-zsh.sh
source ~/.aliases
source ~/.bash_scripts
source ptSh_set_aliases
