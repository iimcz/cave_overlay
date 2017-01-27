# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
EAPI=6
inherit linux-info linux-mod

DESCRIPTION="Blackmagic Design Desktop video (Driver for blackmagic cards)"
HOMEPAGE="http://www.blackmagicdesign.com"
SRC_URI="Blackmagic_Desktop_Video_Linux_${PV}.tar"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64"
IUSE="+samples"

#S="${WORKDIR}/Blackmagic_Desktop_Video_Linux_${PV}"

DEPEND=""

RESTRICT="fetch"

DRIVER_VERSION="10.8.4a4"
BM_SRC_BASE="${S}/desktopvideo-${DRIVER_VERSION}-x86_64/"
BM_MOD_BASE="${BM_SRC_BASE}usr/src/"
BM_BM_DIR="${BM_MOD_BASE}blackmagic-${DRIVER_VERSION}"
BM_IO_DIR="${BM_MOD_BASE}blackmagic-io-${DRIVER_VERSION}"

src_unpack() {
	unpack ${A}
	mkdir -p ${S}
	cd ${S}
	unpack "${WORKDIR}/Blackmagic_Desktop_Video_Linux_${PV}/other/x86_64/desktopvideo-${DRIVER_VERSION}-x86_64.tar.gz"

}

MODULE_NAMES="blackmagic(video:${BM_BM_DIR}:${BM_BM_DIR} blackmagic-io(video:${BM_IO_DIR}:${BM_IO_DIR} snd_blackmagic-io(video:${BM_IO_DIR}:${BM_IO_DIR}"
BUILD_TARGETS="clean all"

src_compile() {
	linux-mod_src_compile
}


src_install() {
	linux-mod_src_install

	rm -rf "${BM_SRC_BASE}/usr/lib/blackmagic/libQt5"*
	mv "${BM_SRC_BASE}/usr/lib" "${BM_SRC_BASE}/usr/lib64"
	rsync -aP "${BM_SRC_BASE}/" "${D}"
}

