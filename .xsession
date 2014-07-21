#!/bin/zsh
#
# Start a nice X session

. ~/.zshrc

# set up logging, if we will ever need it
LOG=$HOME/log/xsession.log
mv $LOG $LOG.1
echo > $LOG
log() {
  echo `date` -- $1 >> $LOG
}

# dualhead setup (with wallpaper)
dualhead left &

# keyboard shortcuts
start-xbindkeys.sh &

# input settings
~/.xinput en &

# load X resources
for f in `ls ~/.*.xdefaults`; do
  xrdb -load $f &
done

# GNOME stuff
#/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

# moved to .xinitrc
#export $(gnome-keyring-daemon -s --components=pkcs11,secrets,ssh)
#seahorse-daemon &
#wicd-gtk &
nm-applet &

# apps
#pidgin &

# audio
pulseaudio --start

# background tools/daemons
#synergys
#/home/niklas/bin/loop-offlineimap.sh &
/home/niklas/bin/check-mail.rb ~/.mail/GMAIL/inbox/new &
#/home/niklas/bin/crypt.sh &
#parcellite &
#dropbox start -i &

#emacs --daemon &

#screen -ls | grep shared || screen -U -d -m -S shared -c ~/.screenrc-shared &
#mpd &

# graphics & audio
#xcompmgr &

# reset keyboard layout every view seconds
#while sleep 15; do
#  ~/.xinput
#done

# VPN
#~/bin/kit-vpn
