# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
EAPI=8
inherit git-r3 cmake

DESCRIPTION="libyuri - a configurable A/V processing framework"
HOMEPAGE="http://www.libyuri.org"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 ~arm ~x86"
IUSE="+sdl +opencv +gphoto +boost +snappy ultragrid test"
# TODO: snappy depend should be optional but upstream doesn't support that yet.
DEPEND="media-libs/glew
	media-gfx/imagemagick
	app-arch/snappy
	media-video/ffmpeg
	boost? ( dev-libs/boost )
	sdl? ( media-libs/libsdl )
	opencv? ( media-libs/opencv )
	ultragrid? ( media-libs/glew media-libs/speex app-arch/zip )
	gphoto? ( media-libs/libgphoto2 )
	"
PATCHES=(
	"${FILESDIR}/ffmpeg-6-fixes.patch"
)

RESTRICT=""

EGIT_REPO_URI="https://github.com/v154c1/libyuri"
EGIT_BRANCH="2.8.x"
EGIT_COMMIT="b05b7d72cba50afa92ad3be6ca4a513acaa55ce1"

EGIT_UV_REPO="anon@git.iim.cz:ultragrid"

src_unpack() {
	git-r3_fetch
	git-r3_checkout
	if use ultragrid; then
		git-r3_fetch ${EGIT_UV_REPO} HEAD
		git-r3_checkout ${EGIT_UV_REPO} ultragrid
		cd "${WORKDIR}"/ultragrid
		eapply "${FILESDIR}/uv_missing_includes.patch"
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
		cd "${WORKDIR}"/ultragrid
		/bin/bash ./autogen.sh --enable-gpl --disable-cuda-dxt --disable-cuda
		mycmakeargs+=(-DYURI_DISABLE_ULTRAGRID=OFF)
		cd "${S}"
	fi
	cmake_src_configure ${mycmakeargs}
}

src_compile() {
	if use ultragrid; then
		einfo "Compiling ultragrid"
		cd "${WORKDIR}"/ultragrid
		emake
		mycmakeargs+=(-DYURI_DISABLE_ULTRAGRID=OFF)
		cd "${S}"
	fi
	cmake_src_compile
}
