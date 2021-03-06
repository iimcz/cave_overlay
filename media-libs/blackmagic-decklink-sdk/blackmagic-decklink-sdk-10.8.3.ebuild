# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
EAPI=5
#inherit git-r3 cmake-utils

DESCRIPTION="Blackmagic Design Decklink SDK"
HOMEPAGE="http://www.blackmagicdesign.com"
SRC_URI="Blackmagic_DeckLink_SDK_${PV}.zip"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 amd64 arm"
IUSE="+samples"

S="${WORKDIR}/Blackmagic DeckLink SDK ${PV}"

DEPEND=""

RESTRICT="fetch"

INCLUDE_DIR="/usr/include/decklink/include/"
SAMPLE_DIR="/usr/share/BlackmagicDecklinkSDK/Samples/"

src_install() {
	mkdir -p ${D}${INCLUDE_DIR}
	rsync -avP "${S}/Linux/include/" "${D}${INCLUDE_DIR}"
	if use samples; then
		mkdir -p ${D}${SAMPLE_DIR}
		rsync -avP "${S}/Linux/Samples/" "${D}${SAMPLE_DIR}"
	fi

}
