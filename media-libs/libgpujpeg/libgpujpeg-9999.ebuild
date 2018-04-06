# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
EAPI=5
inherit git-r3 cmake-utils

DESCRIPTION="JPEG encoder and decoder library and console application for NVIDIA GPUs."
HOMEPAGE="https://github.com/CESNET/GPUJPEG"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""
#S=${WORKDIR}
DEPEND="dev-util/nvidia-cuda-toolkit
	dev-util/nvidia-cuda-sdk
	virtual/opengl
	media-libs/glew
	media-libs/freeglut
	"

RESTRICT=""
#CMAKE_VERBOSE=OFF

EGIT_REPO_URI="https://github.com/CESNET/GPUJPEG.git"
EGIT_BRANCH="master"
#EGIT_COMMIT="92a1f298715b7bf2bc58fb65ac37c3cedf9513f5"

src_install() {
	doheader -r ${S}/libgpujpeg
	dolib.so ${BUILD_DIR}/libgpujpeg.so
	exeinto /usr/bin
	newexe ${BUILD_DIR}/tester gpujpeg_tester
	newexe ${BUILD_DIR}/decoder_gltex gpujpeg_decoder_gltex
}

