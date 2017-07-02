# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
EAPI=5
inherit git-r3 cmake-utils

DESCRIPTION="libyuri"
HOMEPAGE="http://www.libyuri.org"
#SRC_URI="${P}.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 amd64 arm"
IUSE="+sdl +opencv ultragrid +gphoto +boost test"
#S=${WORKDIR}
DEPEND="media-libs/glew
	media-gfx/imagemagick
	boost? ( dev-libs/boost )
	sdl? ( media-libs/libsdl )
	opencv? ( media-libs/opencv )
	ultragrid? ( media-libs/glew media-libs/speex virtual/ffmpeg app-arch/zip )
	gphoto? ( media-libs/libgphoto2 )
	"

RESTRICT=""
CMAKE_VERBOSE=OFF

#EGIT_REPO_URI="anon@git.iim.cz:yuri-light"
EGIT_REPO_URI="https://github.com/v154c1/libyuri"
EGIT_BRANCH="2.8.x"
EGIT_COMMIT="acde43da04b6bce9d27fa4b13c55e2f6c54f1920"

EGIT_UV_REPO="anon@git.iim.cz:ultragrid"

src_unpack() {
	git-r3_fetch
	git-r3_checkout
	if use ultragrid; then
		git-r3_fetch ${EGIT_UV_REPO} HEAD
		git-r3_checkout ${EGIT_UV_REPO} ultragrid
	fi

}

src_configure() {
        local mycmakeargs=(
#		$(cmake-utils_use sdl YURI_DISABLE_)
#		-DENABLE_FW_CAVELIB=ON
#		$(cmake-utils_use ! ultragrid YURI_DISABLE_ULTRAGRID)
        )
	if use test; then
		mycmakeargs=( -DYURI_DISABLE_TESTS=OFF )
	fi
	if use ultragrid; then
		einfo "Configuring ultragrid"
		cd ${WORKDIR}/ultragrid
		/bin/bash ./autogen.sh --enable-gpl --disable-cuda-dxt --disable-cuda
		mycmakeargs+=(-DYURI_DISABLE_ULTRAGRID=OFF)
		cd ${S}
	fi
        cmake-utils_src_configure ${mycmakeargs}
}

src_compile() {
	if use ultragrid; then
		einfo "Compiling ultragrid"
		cd ${WORKDIR}/ultragrid
		emake
		mycmakeargs+=(-DYURI_DISABLE_ULTRAGRID=OFF)
		cd ${S}
	fi
        cmake-utils_src_compile
}
