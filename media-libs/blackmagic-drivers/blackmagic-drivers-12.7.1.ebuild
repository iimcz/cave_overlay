# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
EAPI=8
inherit linux-mod-r1 udev

DESCRIPTION="Blackmagic Design Desktop video (Driver for blackmagic cards)"
HOMEPAGE="http://www.blackmagicdesign.com"
SRC_URI="Blackmagic_Desktop_Video_Linux_${PV}.tar"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64"

DEPEND="dev-qt/qtwidgets:5
	dev-qt/qtgui:5
	dev-qt/qtcore:5
	dev-qt/qtnetwork:5
	virtual/udev"

RESTRICT="fetch"

DRIVER_VERSION="12.7.1a1"
BM_SRC_BASE="${S}/desktopvideo-${DRIVER_VERSION}-x86_64/"
BM_MOD_BASE="${BM_SRC_BASE}usr/src/"
BM_BM_DIR="${BM_MOD_BASE}blackmagic-${DRIVER_VERSION}"
BM_IO_DIR="${BM_MOD_BASE}blackmagic-io-${DRIVER_VERSION}"

src_unpack() {
	unpack "${A}"
	mkdir -p "${S}"
	cd "${S}"
	unpack "${WORKDIR}/Blackmagic_Desktop_Video_Linux_${PV}/other/x86_64/desktopvideo-${DRIVER_VERSION}-x86_64.tar.gz"
}

src_compile() {
	local modlist=(
		blackmagic=video:"${BM_BM_DIR}":"${BM_BM_DIR}"
		blackmagic-io=video:"${BM_IO_DIR}":"${BM_IO_DIR}"
		snd_blackmagic-io=video:"${BM_IO_DIR}":"${BM_IO_DIR}"
	)
	linux-mod-r1_src_compile
}

src_install() {
	linux-mod-r1_src_install

	# Move directories around
	mv "${BM_SRC_BASE}usr/lib" "${BM_SRC_BASE}usr/lib64"

	for link in BlackmagicDesktopVideoSetup DesktopVideoUpdater DesktopVideoUpdateTool; do
		rm "${BM_SRC_BASE}usr/bin/${link}"
		ln -s -r "${BM_SRC_BASE}usr/lib64/blackmagic/DesktopVideo/${link}" "${BM_SRC_BASE}usr/bin/${link}"
	done

	udev_dorules "${BM_SRC_BASE}etc/udev/rules.d/55-blackmagic.rules"
	rm -r "${BM_SRC_BASE}etc/udev"

	mkdir -p "${BM_SRC_BASE}usr/share/doc/blackmagic-drivers-${PV}"
	mv "${BM_SRC_BASE}usr/share/doc/desktopvideo" "${BM_SRC_BASE}usr/share/doc/blackmagic-drivers-${PV}/desktopvideo"
	mv "${BM_SRC_BASE}usr/share/doc/desktopvideo-gui" "${BM_SRC_BASE}usr/share/doc/blackmagic-drivers-${PV}/desktopvideo-gui"

	rsync -avP "${BM_SRC_BASE}" "${D}"
}

pkg_postinst() {
	udev_reload
}

pkg_postrm() {
	udev_reload
}
