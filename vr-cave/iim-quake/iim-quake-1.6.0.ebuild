# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
EAPI=5
inherit cmake-utils

DESCRIPTION="QUAKE III map viewer for CAVELib."
HOMEPAGE=""
SRC_URI="${P}.tar.xz"
CMAKE_USE_DIR="${S}"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="x86 amd64"
IUSE="+sdl +glut +glx"
DEPEND=">=vr-libs/cavelib-3.2"
RESTRICT=""

src_configure() {
        local mycmakeargs=(
        		$(cmake-utils_use_enable glut GLUT), 
                $(cmake-utils_use_enable glx GLX),
                $(cmake-utils_use_enable sdl SDL)
        )
        cmake-utils_src_configure
}

