# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

if [[ -z "${DISPLAY}" ]]; then
	alias mc='mc -a -u -S gotar'
else
	export TERM=xterm-256color
	alias mc='mc -a -u -S modarin256'
fi

export BROWSER=chrome
export PAGER=most

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
if [[ -z "${ZSH_THEME}" ]]; then
    ZSH_THEME="robbyrussell"
#ZSH_THEME="random"
fi

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias diff='diff -ruN'
alias ffall='ssh freefall.FreeBSD.org'
alias lA='ls -Al'
alias ll='ls -l'
alias ls-mac='ssh nistavi@macaco ls'
alias psvn='/usr/ports/Tools/scripts/psvn'
alias rsync-music="rsync -avz nistavi@192.168.1.37:'/Users/nistavi/Music/iTunes/iTunes\ Media/Music' /home/nivit/multimedia/"
alias ssh-add-sf='ssh-add ~/.ssh/sourceforge'
alias ssh-mac='ssh nistavi@192.168.0.37'
alias ssh-mawmi='ssh matematicamenteit@web2.matematicamente.it'
alias ssh-mowmi='ssh mordigante@web2.matematicamente.it'
alias startx-twm='env START_TWM=1 startx -- :1'
alias startx='startx -- :1'
alias zshconfig="vim ~/.zshrc"
#
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

if [[ -z "${DISPLAY}" ]]; then
    DATE=`date "+%y.%m.%d%_%H%M%S"`
    ssh_agent_file=${HOME}/.ssh/environment.${DATE}
    ssh-agent -s > ${ssh_agent_file}
    if [[ -f ${ssh_agent_file} ]]; then
	source ${ssh_agent_file}
	rm ${ssh_agent_file}
    fi
fi

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git colorize github mercurial node npm rsync svn)
source $ZSH/oh-my-zsh.sh


# User configuration

export PATH="/sbin:/bin:/usr/sbin:/usr/bin:/usr/games:/usr/local/sbin:/usr/local/bin:/home/nivit/bin:/home/nivit/npm/bin:/home/nivit/node_modules/.bin"
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=it_IT.UTF-8
# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

