# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
EAPI=5
DESCRIPTION="Event driver for TrackD"
HOMEPAGE=""
SRC_URI="https://www.iim.cz/trackd-event-1.0.tar.bz2"

LICENSE="proprietary"
SLOT="0"
KEYWORDS="x86 amd64"
IUSE=""
S=${WORKDIR}
DEPEND="vr-cave/trackd[sdk]"
QA_TEXTRELS="usr/local/CAVE/trackd/bin/event.so"
QA_EXECSTACK="usr/local/CAVE/trackd/bin/event.so"
src_compile() {
	cd ${S}/${P}
	emake
}
src_install() {
	dodir /usr/local/CAVE/trackd/bin
	cp -r ${S}/${P}/event.so ${D}/usr/local/CAVE/trackd/bin/
}
