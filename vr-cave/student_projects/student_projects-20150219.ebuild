# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
EAPI=5
inherit git-r3 cmake-utils

DESCRIPTION="student projects for cave"
HOMEPAGE=""

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 amd64"
IUSE="+balls +psvis"
DEPEND=">=vr-libs/cavelib-3.2 media-libs/freeglut media-libs/glew
	psvis? ( media-libs/glm )"

RESTRICT=""
EGIT_REPO_URI="anon@git.iim.cz:cave_students"

src_configure() {
        local mycmakeargs=(
		$(cmake-utils_use_build balls BALLS)
		$(cmake-utils_use_build psvis PSVIS)
        )
        cmake-utils_src_configure
}

