# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
EAPI=8
#inherit git-r3 cmake-utils

DESCRIPTION="Blackmagic Design Decklink SDK"
HOMEPAGE="http://www.blackmagicdesign.com"
SRC_URI="Blackmagic_DeckLink_SDK_${PV}.zip"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 arm ~x86"
IUSE="+examples"

S="${WORKDIR}/Blackmagic DeckLink SDK ${PV}"

DEPEND="app-arch/unzip"

RESTRICT="fetch"

INCLUDE_DIR="/usr/include/decklink/"
SAMPLE_DIR="/usr/share/BlackmagicDecklinkSDK/Samples/"

src_install() {
	mkdir -p "${D}${INCLUDE_DIR}"
	rsync -avP "${S}/Linux/include/" "${D}${INCLUDE_DIR}"
	if use examples; then
		# Demove prebuilt sample binaries
		rm -r "${S}/Linux/Samples/bin"

		mkdir -p "${D}${SAMPLE_DIR}"
		rsync -avP "${S}/Linux/Samples/" "${D}${SAMPLE_DIR}"
	fi

}
