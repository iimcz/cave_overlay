# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="CAVELib."
HOMEPAGE=""
SRC_URI="cavelibeoe.tar cavelibdev.tar"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="x86"
IUSE=""
S=${WORKDIR}
DEPEND="x11-libs/openmotif"
RESTRICT="fetch"


src_install() {
	dodir /usr/local/CAVE
	cp -r ${WORKDIR}/cavelibeoe/linux/CAVE ${D}/usr/local
	cd ${WORKDIR}/linux/
	cp -r lib32 ${D}/usr/local/CAVE
	cd ${WORKDIR}
	cp -r include examples share ${D}/usr/local/CAVE
	cd ${D}/usr/local/CAVE
	ln -s lib32 lib
}
