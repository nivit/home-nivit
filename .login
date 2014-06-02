# $FreeBSD: src/share/skel/dot.login,v 1.17.2.1 2009/08/03 08:13:06 kensmith Exp $
#
# .login - csh login script, read by login shell, after `.cshrc' at login.
#
# see also csh(1), environ(7).
#

if ( -x /usr/games/fortune ) /usr/games/fortune freebsd-tips
