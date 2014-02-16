#!/bin/bash
# An install script to set up all my stuff after installing
# Antegros on one of my compters.


# Dependencies to install yaourt and pacaur
echo 'Install a few things for yaourt and pacar...'
sudo pacman -S make gcc

#Download and install yaourt & pacaur
echo 'Download and install yaourt then pacaur'
wget https://aur.archlinux.org/packages/ya/yaourt/yaourt.tar.gz
tar -zxf yaourt.tar.gz
cd yaourt
makepkg -s
sudo pacman -U yaourt*.pkg.tar.xz
sudo yaourt -S pacaur
cd ..
rm -r yaourt*

#pacaur installs
echo 'pacaur installs'
echo pacaur -S i3 dmenu
pacaur -S i3 dmenu
echo pacaur -S firefox
pacaur -S firefox
echo pacaur -S thunderbird 
pacaur -S thunderbird
echo pacaur -S weechat
pacaur -S weechat
echo pacaur -S vim
pacaur -S vim
echo pacaur -S mplayer
pacaur -S mplayer
echo pacaur -S tty-clock
pacaur -S tty-clock
echo pacaur -S dropbox
pacaur -S dropbox
echo pacaur -S nitrogen
pacaur -S nitrogen
echo pacaur -S libreoffice
pacaur -S libreoffice
echo pacaur -S archey
pacaur -S archey
echo pacaur -S scrot
pacaur -S scrot
echo pacaur -S mpd
pacaur -S mpd
echo pacaur -S pianobar
pacaur -S pianobar
echo pacaur -S ncmpcpp
pacaur -S ncmpcpp
echo pacaur -S rsync
pacaur -S rsync
echo pacaur -S rxvt-unicode
pacaur -S rxvt-unicode
echo pacaur -S tmux
pacaur -S tmux
