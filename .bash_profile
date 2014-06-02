# required ports:
#    editors/vim
#    misc/mc
#    net/rsync
#    sysutils/most

# maximum size of core files created
ulimit -c 0
# prompt
PS1='\u$ '
# remove /usr/games if you want
PATH=/sbin:/bin:/usr/sbin:/usr/bin:/usr/games:/usr/local/sbin:/usr/local/bin:$HOME/bin:${HOME}/npm/bin:${HOME}/node_modules/.bin; export PATH

BLOCKSIZE=K;	export BLOCKSIZE
BROWSER=/usr/local/bin/chrome;	export BROWSER
EDITOR='vim';   	export EDITOR
PACKAGES=${HOME}/packages;	export PACKAGES
PAGER=most;  	export PAGER
TMPDIR=$HOME/.tmp;	export TMPDIR

# set ENV to a file invoked each time sh is started for interactive use.
ENV=$HOME/.shrc; export ENV

if [ -x /usr/games/fortune ] ; then /usr/games/fortune freebsd-tips ; fi
SSH_ENV="$HOME/.ssh/environment"

# start the ssh-agent
function start_agent {
    echo "Initializing new SSH agent..."
    # spawn ssh-agent
    ssh-agent | sed 's/^echo/#echo/' > "$SSH_ENV"
    echo succeeded
    chmod 600 "$SSH_ENV"
    . "$SSH_ENV" > /dev/null
    ${HOME}/bin/ssh_setup.exp
}

# test for identities
function test_identities {
    # test whether standard identities have been added to the agent already
    ssh-add -l | grep "The agent has no identities" > /dev/null
    if [ $? -eq 0 ]; then
        ssh-add
        # $SSH_AUTH_SOCK broken so we start a new proper agent
        if [ $? -eq 2 ];then
            start_agent
        fi
    fi
}

# check for running ssh-agent with proper $SSH_AGENT_PID
if [ -n "$SSH_AGENT_PID" ]; then
    ps -ef | grep "$SSH_AGENT_PID" | grep ssh-agent > /dev/null
    if [ $? -eq 0 ]; then
	test_identities
    fi
# if $SSH_AGENT_PID is not properly set, we might be able to load one from
# $SSH_ENV
else
    if [ -f "$SSH_ENV" ]; then
	. "$SSH_ENV" > /dev/null
    fi
    ps -ef | grep "$SSH_AGENT_PID" | grep -v grep | grep ssh-agent > /dev/null
    if [ $? -eq 0 ]; then
        test_identities
    else
        start_agent > /dev/null
    fi
fi

alias ll='ls -l'
alias psvn='/usr/ports/Tools/scripts/psvn'
alias rsync-music="rsync -avz nistavi@macaco:'/Users/nistavi/Music/iTunes/iTunes\ Media/Music' /home/nivit/multimedia/"
alias startx-fluxbox='env START_FLUXBOX=1 startx -- :1'
alias startx-kde='env START_KDE=1 startx -- :1'
alias startx-twm='env START_TWM=1 startx -- :1'
alias startx-xfce4='env START_XFCE4=1 startx -- :1'
alias startx='startx -- :1'
alias vi='vim'
if [ "${DISPLAY}" ]; then
	export TERM=xterm-256color
	alias mc='mc -a -u -S modarin256'
else
	alias mc='mc -a -u -S gotar'
fi
