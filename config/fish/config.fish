# Connect
alias desktop="ssh ryan@`echo ~/owncloud/current_ip.txt`"
alias himmelwr="ssh -p 1729 ryan@`cat ~/owncloud/himmelwr.txt`"
alias pidgey='mosh --ssh="ssh -p 1729" ryan@pidgey'

# Radio
alias jblive="mpv http://jblive.fm"
alias jbliveV="mpv rtsp://jblive.videocdn.scaleengine.net/jb-live/play/jblive.stream"
alias wmmr="mpv -playlist http://provisioning.streamtheworld.com/pls/WMMRFMAAC.pls"

# Other
alias getIP="curl -s icanhazip.com"
alias ta="tmux attach-session -t $1"
alias tn="tmux new-session -s $1"
