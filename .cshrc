# $FreeBSD: src/share/skel/dot.cshrc,v 1.13 2001/01/10 17:35:28 archie Exp $
#
# .cshrc - csh resource script, read at beginning of execution by each shell
#
# see also csh(1), environ(7).
#

alias h		history 25
alias j		jobs -l
alias la	ls -a
alias lf	ls -FA
alias ll	ls -lA

# mine
alias acvs    cvs -d freebsdanoncvs@anoncvs.FreeBSD.org:/home/ncvs
alias acvs1   cvs -d anoncvs@anoncvs1.FreeBSD.org:/home/ncvs
alias csstidy	csstidy --case_properties=true --compress_colors=true --compress_font_weight=true --discard_invalid_properties=true --remove_last_\;=true --sort_properties=true --sort_selectors=true --timestamp=true --optimise_shorthands=true
alias dcvs cvs -d nivit@dcvs.FreeBSD.org:/home/dcvs
alias emacs	emacs -mm
alias mc	mc -a -u
alias mplayer	mplayer -alang it -ao oss
alias pcvs cvs -d nivit@pcvs.FreeBSD.org:/home/pcvs
alias projcvs cvs -d nivit@projcvs.FreeBSD.org:/home/projcvs
alias rxvt	rxvt +sb
alias scvs cvs -d nivit@ncvs.FreeBSD.org:/home/ncvs
alias sf-cvs cvs -d nivit@ufmcontrol.cvs.sourceforge.net:/cvsroot/ufmcontrol
alias ssh-11	ssh 192.168.1.11
alias ssh-3	ssh 192.168.1.55
alias ssh-ffall ssh freefall.FreeBSD.org
alias ssh-mac	ssh 192.168.0.37
alias ssh-sf	ssh nivit@ufmcontrol.sourceforge.net
alias ssh-vps	ssh planetweblog.net
alias startx	startx -listen_tcp -- :2 -f 5
alias startx-gnome env START_GNOME=1 startx
alias startx-kde env START_KDE=1 startx
alias startx-openbox env START_OPENBOX=1 startx
alias startx-twm env START_TWM=1 startx

# A righteous umask
umask 22

set path = (/sbin /bin /usr/sbin /usr/bin /usr/games /usr/local/sbin /usr/local/bin /usr/X11R6/bin /usr/local/kde4/bin /usr/local/share/qooxdoo/tool/bin $HOME/bin)

setenv RAR	-kb
setenv	ASYMPTOTE_PSVIEWER	ggv
setenv	ASYMPTOTE_PDFVIEWER	ggv
setenv	BLOCKSIZE	K
setenv	BROWSER	chrome
setenv	CVSROOT	${HOME}/cvsroot
setenv	EDITOR	emacs
setenv	MAILDIR	${HOME}/Maildir/
setenv	MAIL	${HOME}/Mail/Mailbox
setenv	MAILTMP	${HOME}/tmp/Mailbox_tmp
setenv	MAILHOST	email.it
setenv	MAILUSER	nivit
setenv	PAGER	most
setenv	QMAILINJECT	fc
setenv	QMAILNAME	'Nicola Vitale'
setenv	RI	'--format ansi --width 70'
setenv	TMPDIR	${HOME}/tmp/cache/

if ($?prompt) then
	if ( ! $?DISPLAY ) then
	    kbdcontrol -b 30.100
	endif
	# An interactive shell -- set some stuff up
	set filec
	set coredumpsize = 0
	set autologout = 30
	set history = 100
	set savehist = 100
	#set mail = (/var/mail/$USER)
	if ( $?tcsh ) then
		bindkey "^W" backward-delete-word
		bindkey -k up history-search-backward
		bindkey -k down history-search-forward
	endif
	if ( ! $?DISPLAY ) then
		if ( ! $?SSH_AUTH_SOCK ) then
			set DATA = `date "+%Y%m%d%H%M%S"`
			set ssh_agent_file = ${HOME}/.ssh/${DATA}.ssh-agent
			ssh-agent -c > ${ssh_agent_file}
			if ( `filetest -e ${ssh_agent_file}` ) then
				source ${ssh_agent_file}
				ssh-add
				rm -f ${ssh_agent_file}
			endif
			ssh-add ${HOME}/.ssh/bitbucket
		endif
	endif
endif
