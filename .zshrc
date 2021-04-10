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

#neofetch | lolcat
#fet.sh

# ls
alias l='ls -lh'
alias ll='ls -lah'
alias la='ls -A'
alias lm='ls -m'
alias lr='ls -R'
alias lg='ls -l --group-directories-first'

# Config
alias zshconfig='vim ~/.zshrc && source ~/.zshrc'
alias i3config="vim ~/.config/i3/config"

# git
alias gcl='git clone --depth 1'
alias gi='git init'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push origin master'
alias pullall='ls | xargs -I{} git -C {} pull'

#Clone all used for ~/ 
alias gitpullall='find . -name ".git" -type d | sed 's/\/.git//' |  xargs -P10 -I{} git -C {} pull'

# Display battery percentage
alias batt='upower -i $(upower -e | grep BAT) | grep --color=never -E "state|to\
full|to\ empty|percentage"'

# Good aliases to have
alias gh='history|grep'
alias dl="cd ~/Downloads" 
alias aur="cd ~/Downloads/aur"
alias timer='echo "Timer started. Stop with Ctrl-D." && date && time cat && date'          
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\\: .*|GET \\/.*\""
alias neofetch="neofetch | lolcat"

# Bash script things

ddg () {
    lynx "https://duckduckgo.com/?t=ffnt&q=$(echo $* | sed 's/[ ]/+/g')"
}

tube (){
	lynx "https://youtube.com/results?search_query=$(echo $* | sed 's/[ ]/+/g')"
}

zshadd () {
    echo "$@" >> ~/.zshrc
}

weather () {
    curl wttr.in
}

weather2 () {
    curl v2.wttr.in
}

moon () {
    curl wttr.in/moon
}

tlynx () {
    torsocks /usr/bin/lynx -noreferer $@
}

tcurl () {
    torsocks curl
}


function tre() {
	tree -aC -I '.git' --dirsfirst "$@" | less -FRNX
}

function man() {
	env \
		LESS_TERMCAP_mb="$(printf '\e[1;31m')" \
		LESS_TERMCAP_md="$(printf '\e[1;31m')" \
		LESS_TERMCAP_me="$(printf '\e[0m')" \
		LESS_TERMCAP_se="$(printf '\e[0m')" \
		LESS_TERMCAP_so="$(printf '\e[1;44;33m')" \
		LESS_TERMCAP_ue="$(printf '\e[0m')" \
		LESS_TERMCAP_us="$(printf '\e[1;32m')" \
		man "$@"
}

function isup() {
	local uri=$1

	if curl -s --head  --request GET "$uri" | grep "200 OK" > /dev/null ; then
		notify-send --urgency=critical "$uri is down"
	else
		notify-send --urgency=low "$uri is up"
	fi
}

function open-localhost() {
    if [ $# -eq 0 ]; then
        chrome-cli http://localhost:3000
    else
        chrome-cli http://localhost:$1
    fi
}

function texthash() {
    echo -n $1 | md5sum | awk '{print "MD5 = " $1}'
    echo -n $1 | shasum | awk '{print "SHA1 = " $1}'
    echo -n $1 | sha256sum | awk '{print "SHA256 = " $1}'
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
