# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="Calculate Utilities meta package"
HOMEPAGE="http://www.calculate-linux.org/main/en/calculate2"
SRC_URI=""

LICENSE="Apache-2.0"
SLOT="3"
KEYWORDS="x86 amd64"
IUSE="cl_consolegui cl_client cl_desktop cl_console"

RDEPEND="${RDEPEND}
	=sys-apps/calculate-install-3.2.3-r8
	=sys-apps/calculate-i18n-3.2.3-r3
	=sys-apps/calculate-lib-3.2.3-r6
	=sys-apps/calculate-core-3.2.3-r4
	=sys-apps/calculate-update-3.2.3-r7
	cl_client? ( =sys-apps/calculate-client-3.2.3-r4 )
	cl_desktop? ( =sys-apps/calculate-desktop-3.2.3-r2 )
	cl_consolegui? ( =sys-apps/calculate-console-gui-3.2.3-r3 )
	cl_console? ( =sys-apps/calculate-console-3.2.3-r3 )
"
