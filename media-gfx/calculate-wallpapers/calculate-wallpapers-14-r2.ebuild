# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="Wallpapers for Calculate Linux"
HOMEPAGE="http://www.calculate-linux.org/packages/media-gfx/calculate-wallpapers"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
VERSION_IUSE="cl11 cl12 cl13"
IUSE="$VERSION_IUSE"

SRC_URI="
	ftp://ftp.calculate.ru/pub/calculate/themes/wallpapers/wallpapers-14-r1.tar.bz2
	http://mirror.yandex.ru/calculate/themes/wallpapers/wallpapers-14-r1.tar.bz2
	cl11? (
		ftp://ftp.calculate.ru/pub/calculate/themes/wallpapers/wallpapers-11.tar.bz2
		http://mirror.yandex.ru/calculate/themes/wallpapers/wallpapers-11.tar.bz2
	)
	cl12? (
		ftp://ftp.calculate.ru/pub/calculate/themes/wallpapers/wallpapers-12.tar.bz2
		http://mirror.yandex.ru/calculate/themes/wallpapers/wallpapers-12.tar.bz2
	)
	cl13? (
		ftp://ftp.calculate.ru/pub/calculate/themes/wallpapers/wallpapers-13.tar.bz2
		http://mirror.yandex.ru/calculate/themes/wallpapers/wallpapers-13.tar.bz2
	)
	"

RDEPEND="!media-gfx/calculate-cldx-themes
		!media-gfx/calculate-cld-themes
		!media-gfx/cld-themes
		!media-gfx/cldx-themes"

DEPEND="${RDEPEND}"

src_install() {
	insinto /
	doins -r .

	for useflag in $VERSION_IUSE
	do
		if use $useflag
		then
			cd $WORKDIR/calculate-wallpapers-${useflag//cl}
			doins -r usr
		fi
	done
}
