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
IUSE="+balls +psvis +crowd +snowman"
DEPEND=">=vr-libs/cavelib-3.2 media-libs/freeglut media-libs/glew
	psvis? ( media-libs/glm )
	crowd? ( media-libs/devil media-libs/glm dev-libs/rapidxml dev-libs/boost dev-libs/rapidxml )
	"

RESTRICT=""
EGIT_REPO_URI="anon@git.iim.cz:cave_students"
EGIT_COMMIT="a0deecf1147f496b76238a12163051ca37cd826a"

src_configure() {
        local mycmakeargs=(
		$(cmake-utils_use_build balls BALLS)
		$(cmake-utils_use_build psvis PSVIS)
		$(cmake-utils_use_build crowd CROWD)
		$(cmake-utils_use_build snowman SNOWMAN)
        )
        cmake-utils_src_configure
}

