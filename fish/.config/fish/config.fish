# Connect
alias desktop="ssh ryan@`echo ~/owncloud/current_ip.txt`"
alias himmelwr="ssh -p 1729 ryan@`cat ~/owncloud/himmelwr.txt`"
alias pidgey='mosh --ssh="ssh -p 1729" ryan@pidgey'
alias umb="ssh rhimmelw@users.cs.umb.edu"

# Radio
alias jblive="mpv http://jblive.fm"
alias jbliveV="mpv rtsp://jblive.videocdn.scaleengine.net/jb-live/play/jblive.stream"
alias wmmr="mpv -playlist http://provisioning.streamtheworld.com/pls/WMMRFMAAC.pls"

# Other
alias getIP="curl -s icanhazip.com"
alias ta="tmux attach-session -t $1"
alias tn="tmux new-session -s $1"

# Manual Upgrades
alias pacman-updates="pacman -Qqu | wc -l"
alias aur-updates="cower -u | wc -l"

# Solus

# Ruby Path Env
#set -gx PATH ~/.gem/ruby/2.3.0/bin $PATH
#set -gx PATH "(ruby -e 'print Gem.user_dir')/bin:$PATH"

# Perl Manual Path Env
#set -gx PATH /usr/bin/core_perl $PATH

set fisher_home ~/.local/share/fisherman
set fisher_config ~/.config/fisherman
source $fisher_home/config.fish

# postgres path
#set -gx PATH /usr/bin/core_perl $PATH

## Pokemon Welcome Message
/home/ryan/Network/Server-Node-Files/welcome-messages/welcome-script.sh 65
