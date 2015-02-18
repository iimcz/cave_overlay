# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
EAPI=5
inherit git-r3 cmake-utils

DESCRIPTION="student projects for cave"
HOMEPAGE=""
#SRC_URI="${P}.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 amd64"
IUSE="balls"
#S=${WORKDIR}
DEPEND=">=vr-libs/cavelib-3.2 media-libs/freeglut media-libs/glew"
RESTRICT=""
EGIT_REPO_URI="anon@git.iim.cz:cave_students"

src_configure() {
        local mycmakeargs=(
		$(cmake-utils_use_build balls BALLS)
        )
        cmake-utils_src_configure
}

#src_compile() {
#	cmake-utils_compile
#}

#src_install() {
#	cd ${S}
#	dobin iim-quake
#	mkdir -p ${D}/usr/share/iim-quake-${PV}/
#	cp paul.pk3 ${D}/usr/share/iim-quake-${PV}/
#}
