# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="2:2.7"
RESTRICT_PYTHON_ABIS="2.4 2.5 2.6 3.*"

inherit distutils eutils

SRC_URI="ftp://ftp.calculate.ru/pub/calculate/calculate2/${PN}/${P}.tar.bz2
	http://mirror.yandex.ru/calculate/calculate2/${PN}/${P}.tar.bz2"

DESCRIPTION="The utilities for assembling tasks of Calculate Linux"
HOMEPAGE="http://www.calculate-linux.org/main/en/calculate2"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 x86"

RDEPEND=">=sys-apps/calculate-lib-2.2.19
	!<sys-apps/calculate-install-2.2.19
	!<sys-apps/calculate-client-2.2.19
	!<sys-apps/calculate-desktop-2.2.19
	!<sys-apps/calculate-builder-2.2.19
	!<sys-apps/calculate-assemble-2.2.19"

DEPEND="sys-devel/gettext
	${DEPEND}"
