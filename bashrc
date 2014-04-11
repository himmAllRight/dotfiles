if [ -f /etc/bash_completion ]; then
	    . /etc/bash_completion
fi

xhost +local:root > /dev/null 2>&1

complete -cf sudo

shopt -s cdspell
shopt -s checkwinsize
shopt -s cmdhist
shopt -s dotglob
shopt -s expand_aliases
shopt -s extglob
shopt -s histappend
shopt -s hostcomplete
shopt -s nocaseglob

export HISTSIZE=10000
export HISTFILESIZE=${HISTSIZE}
export HISTCONTROL=ignoreboth

alias ls='ls --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias ll='ls -l --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias la='ls -la --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias grep='grep --color=tty -d skip'
alias cp="cp -i"                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias np='nano PKGBUILD'

# ex - archive extractor
# usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# Ryan Added
archey 
# quick cd to folders
alias thesis="cd ~/Documents/Thesis/"
alias school="cd ~/Dropbox/School/2013-2014"
alias config="cd ~/Dropbox/scripts/config/"

# ssh to aec compute nodes
alias aec210="ssh -Y himmelwr@compute210.cs.lafayette.edu"
alias aec211="ssh -Y himmelwr@compute211.cs.lafayette.edu"
alias aec212="ssh -Y himmelwr@compute212.cs.lafayette.edu"
alias aec213="ssh -Y himmelwr@compute213.cs.lafayette.edu"
alias aec214="ssh -Y himmelwr@compute214.cs.lafayette.edu"
alias aec215="ssh -Y himmelwr@compute215.cs.lafayette.edu"
alias aec216="ssh -Y himmelwr@compute216.cs.lafayette.edu"
alias aec217="ssh -Y himmelwr@compute217.cs.lafayette.edu"
alias aec218="ssh -Y himmelwr@compute218.cs.lafayette.edu"
alias himmelwr="ssh -Y ryan@162.243.19.18"
alias serverMount="sshfs ryan@162.243.19.18:/home/ryan/ /Data1/ryan/Server"
alias mountWebsite="sshfs ryanhimm@ryanhimmelwright.com:/home4/ryanhimm/public_html/ ~/Website/"
alias mountAEC="sshfs himmelwr@compute217.cs.lafayette.edu:/usr22/himmelwr ~/AEC/"
alias serverUnmount="sudo umount /Data1/ryan/Server"
alias server="ssh -Y ryan@192.168.1.123"

# Other shortcuts
alias getIP="curl -s icanhazip.com"
alias ta="tmux attach-session -t $1"
alias tn="tmux new-session -s $1"
alias redteam="cd ~/Network/Subversion/working_Redteam"

# prompt

#PS1='[\u@\h \w]\$ '
PS1="\[$(tput setaf 1)\]┌─╼ \[$(tput setaf 7)\][\u@\h:\w]\n\[$(tput setaf 1)\]\$(if [[ \$? == 0 ]]; then echo \"\[$(tput setaf 1)\]└────╼\"; else echo \"\[$(tput setaf 1)\]└╼\"; fi) \[$(tput setaf 7)\]"

BROWSER=/usr/bin/xdg-open
