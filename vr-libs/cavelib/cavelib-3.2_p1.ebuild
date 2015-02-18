# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="CAVELib."
HOMEPAGE=""
SRC_URI="http://storage/install_cavelibeoe.sh http://storage/install_cavelib.sh"

LICENSE="proprietary"
SLOT="0"
KEYWORDS="x86 amd64"
IUSE=""
S=${WORKDIR}
#DEPEND="x11-libs/openmotif"
RESTRICT="bincheck"


src_unpack() {
	/bin/bash ${DISTDIR}/install_cavelib.sh --noexec --keep
	/bin/bash ${DISTDIR}/install_cavelibeoe.sh --noexec --keep
}

src_install() {
	dodir /usr/local/CAVE
	cp -r ${WORKDIR}/linux/* ${D}/usr/local/CAVE/
	cd ${D}/usr/local/CAVE
	if use amd64; then
		ln -s lib64 lib
	else
		ln -s  lib32 lib
	fi
	insinto /usr/lib/pkgconfig/
        doins "${FILESDIR}"/cavelib.pc
}
