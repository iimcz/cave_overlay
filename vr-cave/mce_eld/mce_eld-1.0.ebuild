# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
EAPI=5
inherit cmake-utils

DESCRIPTION="Marching Cude ELD"
HOMEPAGE=""
SRC_URI="${P}.tar.xz"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 amd64"
IUSE=""
DEPEND=">=vr-libs/cavelib-3.2 media-libs/freeglut"

RESTRICT=""

#src_configure() {
#        cmake-utils_src_configure
#}

