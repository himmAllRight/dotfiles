# Navigation
alias dotfiles="cd /home/ryan/dotfiles/"
alias smb-drives="cd /run/user/1000/gvfs/"

# scripts
alias create-package="~/Documents/Programming/scripts/shell/create_package"

#Radio
alias jblive="mpv http://jblive.fm"
alias jbliveV="mpv rtsp://jblive.videocdn.scaleengine.net/jb-live/play/jblive.stream"
alias wmmr="mpv -playlist http://provisioning.streamtheworld.com/pls/WMMRFMAAC.pls"

# Net
alias getIP="curl -s icanhazip.com"

# Tmux
alias ta="tmux attach-session -t $1"
alias tn="tmux new-session -s $1"

# Manual Upgrades
alias pacman-updates="pacman -Qqu | wc -l"
alias aur-updates="cower -u | wc -l"

# git
alias gits="git status"

# emacs
alias emacs="emacs $1 -nw"

# Solus

# Ruby Path Env
#set -gx PATH ~/.gem/ruby/2.3.0/bin $PATH
#set -gx PATH "(ruby -e 'print Gem.user_dir')/bin:$PATH"

# Go Path Env
set -x GOPATH $HOME/Documents/Programming/golang/
set -gx PATH $PATH ~/Documents/Programming/golang/bin/

set -gx EDITOR vim
