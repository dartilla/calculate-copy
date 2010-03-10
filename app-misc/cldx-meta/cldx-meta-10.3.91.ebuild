# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

DESCRIPTION="Calculate Linux Desktop XFCE (meta package)"
HOMEPAGE="http://www.calculate-linux.org/main/en/cld"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	app-admin/sudo
	app-arch/rar
	app-cdr/xfburn
	app-dicts/myspell-de
	app-dicts/myspell-en
	app-dicts/myspell-es
	app-dicts/myspell-fr
	app-dicts/myspell-it
	app-dicts/myspell-pl
	app-dicts/myspell-pt
	app-dicts/myspell-ru
	app-dicts/myspell-uk
	app-text/stardict
	app-editors/mousepad
	~app-misc/cls-meta-${PV}
	app-office/openoffice
	app-text/evince
	app-text/fbreader
	mail-client/claws-mail
	mail-client/claws-mail-gtkhtml
	mail-client/claws-mail-rssyl
	~media-gfx/cldx-themes-10.4
	media-gfx/gimp
	media-gfx/gqview
	media-gfx/gtkam
	media-gfx/xsane
	media-libs/win32codecs
	media-sound/audacious
	media-sound/sox
	media-video/gnome-mplayer
	media-video/mplayer
	net-analyzer/macchanger
	net-dialup/gnome-ppp
	net-dialup/minicom
	net-dialup/xl2tpd
	net-dns/bind-tools
	net-fs/fusesmb
	net-fs/samba
	net-im/pidgin
	net-irc/xchat
	net-misc/ifenslave
	net-misc/rdesktop
	net-misc/wicd
	net-misc/wol
	net-p2p/transmission
	sci-calculators/galculator
	sys-apps/calculate-client
	sys-apps/ethtool
	sys-apps/hdparm
	sys-apps/kexec-tools
	sys-apps/keyexec
	sys-apps/keyutils
	sys-apps/pcmciautils
	sys-apps/preload
	sys-apps/usb_modeswitch
	sys-auth/nss_ldap
	sys-auth/pam_keystore
	sys-auth/pam_ldap
	sys-auth/thinkfinger
	sys-block/gparted
	sys-power/acpi
	sys-power/acpid
	sys-power/cpufreqd
	sys-power/powernowd
	sys-process/htop
	www-plugins/adblock-mozilla-plugin
	www-plugins/adobe-flash
	www-plugins/spell-mozilla-plugin
	x11-apps/ccsm
	x11-apps/fusion-icon
	x11-apps/mesa-progs
	x11-apps/xdpyinfo
	x11-apps/xev
	x11-misc/slim
	x11-misc/xbindkeys
	x11-misc/xfce4-notifyd
	x11-plugins/pidgin-libnotify
	x11-terms/terminal
	x11-themes/emerald-themes
	x11-themes/tango-icon-theme
	x11-wm/compiz-fusion
	x11-wm/emerald
	xfce-base/xfce4-meta
	xfce-extra/thunar-archive-plugin
	xfce-extra/thunar-thumbnailers
	xfce-extra/thunar-volman
	xfce-extra/xfce4-battery-plugin
	xfce-extra/xfce4-clipman-plugin
	xfce-extra/xfce4-cpugraph-plugin
	xfce-extra/xfce4-datetime-plugin
	xfce-extra/xfce4-mailwatch-plugin
	xfce-extra/xfce4-mixer
	xfce-extra/xfce4-notes-plugin
	xfce-extra/xfce4-power-manager
	xfce-extra/xfce4-screenshooter
	xfce-extra/xfce4-taskmanager
	xfce-extra/xfce4-xkb-plugin"

cxxflags_present_in() {
	grep CXXFLAGS $1 &>/dev/null
	return $?
}

append_cxxflags_to() {
	sed -i '$aCXXFLAGS="\${CFLAGS}"' $1
}


pkg_postinst() {
	cxxflags_present_in /etc/make.conf || append_cxxflags_to /etc/make.conf
	calculate_change_version
}
