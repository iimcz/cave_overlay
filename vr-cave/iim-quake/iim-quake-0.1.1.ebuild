# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit iim

DESCRIPTION="QUAKE III map viewer for CAVELib."
HOMEPAGE=""
SRC_URI="${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="x86 amd64"
IUSE=""
#S=${WORKDIR}
DEPEND=">=vr-libs/cavelib-3.1.1"
RESTRICT="fetch"

src_compile() {
		cd ${S}
		find_cavelib
		emake CAVEDIR="${CAVEDIR}" CFLAGS="${CFLAGS}"|| die "emake failed"
}
src_install() {
#		emake DESTDIR=${D} install || die Install failed
	cd ${S}	
	dobin iim-quake
	mkdir -p ${D}/usr/share/iim-quake-${PV}/
	cp paul.pk3 ${D}/usr/share/iim-quake-${PV}/

}
