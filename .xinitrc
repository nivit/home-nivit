#!/bin/sh
export LANG=it_IT.UTF-8
export MM_CHARSET=utf-8
#export TERM=xterm-256color
export TERM=xterm-color

# General setup
TWM_THEME=yes
WITH_CONKY=yes
WITH_FEH_BG=yes
WITH_GMAIL_NOTIFIER=yes
WITH_GNOMEPIE=yes
WITH_GNOME_SETTINGS_DAEMON=yes
WITH_GOL=yes
WITH_GTMIXER=yes
WITH_GUAKE=yes
WITH_OSDMIXER=no
WITH_SCREENSAVER=yes
WITH_TICKR=yes
WITH_TRAYER=yes
WITH_WBAR=yes
WITH_XCLOCK=no
WITH_XSNOW=yes

SEASON="leonidafremov"
SEASON?=$(${HOME}/bin/get-season.py)
case "${SEASON}" in
    "autumn")
      	FGRGB='rgb:ff/ff/ff'; \
        BGRGB='rgb:73/57/30'; \
        BG='FF735730';;
    "winter")
      	FGRGB='rgb:ff/ff/ff'; \
        BGRGB='rgb:3a/68/d7'; \
        BG='3A68D7';;
    "spring")
        FGRGB='rgb:ff/ff/ff'; \
        BGRGB='rgb:22/8b/22'; \
        BG='228B22'; \
        TICKRID0=''; \
        TICKRID1='1';;
    "summer")
        FGRGB='rgb:00/00/00'; \
        BGRGB='rgb:ff/d7/00'; \
        BG='FFD700'; \
        TICKRID0='2'; \
        TICKRID1='3';;
    "leonidafremov")
        FGRGB='rgb:ff/ff/ff'; \
        BGRGB='rgb:ff/45/00'; \
        BG='ff4500'; \
        TICKRID0='4'; \
        TICKRID1='5';;
esac

x11_setup() {
    #setxkbmap it&
    xmodmap ~/.Xmodmap&
    xrdb -load ~/.Xdefaults&
    xset b 0 20 300&
    if [ "${WITH_SCREENSAVER}" = "yes" ]; then
        if [ -f /usr/local/bin/gnome-screensaver -a ! -z "${START_GNOME}" ]; then
            /usr/local/bin/gnome-screensaver&
        elif [ -f /usr/local/bin/xscreensaver ]; then
            xscreensaver -no-splash&
        fi
    fi
}

###############
# start xsnow only when 21 dec < day < 07 gen (heavy snowfall!)
let_it_snow() {
    xsnow_day=$(date +%d)
    xsnow_month=$(date +%m)
    if [ ${xsnow_month} -eq 12 -a ${xsnow_day} -ge 21 -o ${xsnow_month} -eq 1 -a ${xsnow_day} -lt 7 ]; then
        xsnow -nokeepsnow -nosanta -norudolf -notrees&
    fi
}

###############
# TWM
start_twm() {
    if [ "${TWM_THEME}" = "yes" ]; then
        THEME=".${SEASON}"
    else
        THEME=""
    fi
    if [ "${WITH_CONKY}" = "yes" ]; then
	    conky -c ${HOME}/.conky/Flat-Weather/conkyrc&
    fi
    if [ "${WITH_FEH_BG}" = "season" ]; then
        feh-set-wallpaper.py ${SEASON}&
    else
        feh-set-${SEASON}-wallpaper.py&
    fi
    if [ "${WITH_TRAYER}" = "yes" ]; then
        trayer --widthtype pixel --width 1260 --monitor 0 \
            --SetPartialStrut true --expand true --transparent true \
            --alpha 0 --tint 0x${BG}&
    fi
    if [ "${WITH_GOL}" = "yes" ]; then
        gol&
    fi
    if [ "${WITH_GNOME_SETTINGS_DAEMON}" = "yes" ]; then
        /usr/local/libexec/gnome-settings-daemon&
    fi
    if [ "${WITH_GNOMEPIE}" = "yes" ]; then
        gnome-pie&
    fi
    if [ "${WITH_GUAKE}" = "yes" ]; then
        guake -n mc -r mc -e mc&
    fi
    if [ "${WITH_OSDMIXER}" = "yes" ]; then
        ${HOME}/bin/osdmixer 200 250 2 1&
    fi
    if [ "${WITH_GMAIL_NOTIFIER}" = "yes" ]; then
        gmail-notifier&
    fi
    if [ "${WITH_XCLOCK}" = "yes" ]; then
        xclock -geometry 205x35+10-43 -digital -bw 0 -bg "${BGRGB}" \
            -fg "${FGRGB}" -strftime '%a %d %b %Y  %H:%M'&
        xclock -geometry 205x35+2335-43 -digital -bw 0 -bg "${BGRGB}" \
            -fg "${FGRGB}" -strftime '%a %d %b %Y  %H:%M'&
    fi
    if [ "${WITH_GTMIXER}" = "yes" ]; then
        gtmixer&
    fi
    if [ "${WITH_WBAR}" = "yes" ]; then
        ${HOME}/bin/start-wbar.sh ${SEASON}&
    fi
    if [ "${WITH_TICKR}" = "yes" ]; then
        if [ -z "${TICKRID0}" ]; then
		        tickr&
	      else
		        tickr -instance-id=${TICKRID0}&
	      fi
	          tickr -instance-id=${TICKRID1}&
    fi
    if [ "${WITH_XSNOW}" = "yes" ]; then
        let_it_snow&
    fi
    exec twm -f ${HOME}/.config/twm/.twmrc${THEME}
}
#############
x11_setup&

#############
# start a window manager
if [ -n "${START_FLUXBOX}" ]; then
    /usr/local/libexec/gnome-settings-daemon&
    exec startfluxbox
elif [ -n "${START_GNOME}" ]; then
    exec ck-launch-session gnome-session
elif [ -n "${START_KDE}" ];then
    exec startkde4
elif [ -n "${START_XFCE4}" ]; then
    exec startxfce4
else
    start_twm
fi
