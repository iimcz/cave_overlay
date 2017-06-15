# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
EAPI=6
inherit linux-info linux-mod git-r3


DESCRIPTION="Virtual V4L2 webcamera"
HOMEPAGE="https://github.com/v154c1/virtual_camera"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE="+samples"

DEPEND=""

EGIT_REPO_URI="https://github.com/v154c1/virtual_camera.git"

MODULE_NAMES="vcmod(video:module:module}"
BUILD_TARGETS="clean all"

src_compile() {
	linux-mod_src_compile
	cd ${S}/utils
	emake
}

src_install() {
	linux-mod_src_install
	cd ${S}/utils
	emake DESTDIR="${D}" install
	insinto /etc/udev/rules.s
	newins ${S}/udev/66-vcmod.rules 66-vcmod.rules
}

