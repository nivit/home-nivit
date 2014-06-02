PS1='\u$ '

alias mc='mc -a -S modarin256'
alias diff='diff -ruN'
alias ffall='ssh freefall.FreeBSD.org'
alias ls-mac='ssh nistavi@macaco ls'
alias psvn='/usr/ports/Tools/scripts/psvn'
alias rsync-music="rsync -avz nistavi@192.168.1.37:'/Users/nistavi/Music/iTunes/iTunes\ Media/Music' /home/nivit/multimedia/"
#alias ssh-w1mi='ssh 37.139.9.245'
alias ssh-mac='ssh nistavi@192.168.0.37'
alias ssh-mawmi='ssh matematicamenteit@web2.matematicamente.it'
alias ssh-mowmi='ssh mordigante@web2.matematicamente.it'
alias startx='startx -- :1'
alias startx-fluxbox='env START_FLUXBOX=1 startx -- :1'
alias startx-twm='env START_TWM=1 startx -- :1'
alias startx-xfce4='env START_XFCE4=1 startx -- :1'
alias startx-kde='env START_KDE=1 startx -- :1'
alias ll='ls -l'

# Add Chromium's depot_tools to the PATH
#export PATH="$PATH:/home/nivit/bin/depot_tools:${HOME}/node_modules/.bin"

# Bash completion for Mercurial
source /usr/local/share/mercurial/contrib/bash_completion

# run mc -S modarin256
[ "${TERM}" ] && export TERM=xterm-256color
