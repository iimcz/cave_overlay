# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
EAPI=6

PYTHON_COMPAT=( python2_7 )
inherit eutils python-single-r1 user

PATCHLEVEL="101"

DESCRIPTION="Scalable Adaptive Graphics Environment"
HOMEPAGE="http://www.sagecommons.org/"
SLOT=0
SRC_URI="${SRC_URI}
	https://gitlab.com/melnikoff/sage_packages/raw/master/${PN}-${PV}.tar.bz2"

IUSE="+adduser +newwx"
LICENSE="Sage-3.0"

RDEPEND="media-libs/libsdl
	media-libs/glew
	media-libs/sdl-ttf
	dev-qt/qtcore
	dev-qt/qtgui
	dev-qt/qtnetwork
	app-arch/unzip
	newwx?  ( dev-python/wxpython )
	!newwx? ( dev-python/wxpython:2.8 )
	dev-python/numpy
	media-gfx/imagemagick
	media-libs/portaudio
	media-sound/jack-audio-connection-kit"
DEPEND="${RDEPEND}"

KEYWORDS="amd64 x86 ~arm"

pkg_setup() {
	python-single-r1_pkg_setup
}

pkg_preinst() {
	if use adduser ; then
		#Add sage user
		enewgroup sage
		enewuser sage -1 "/bin/bash" "/home/sage" "sage,users,video,audio"
		dodir "/home/sage"
		cp "${FILESDIR}/.bashrc" "${ED}home/sage/"
		chown sage:sage "${ED}home/sage" "${ED}home/sage/.bashrc"
	fi
}

src_prepare() {
#	EPATCH_SUFFIX="patch" epatch "${WORKDIR}/patches"
	if use newwx ; then
		eapply "${FILESDIR}/sagelib-3.0-wxwidgets.patch"
	fi

	eapply_user
}

src_install() {
	export SAGE_DIRECTORY=/usr/local/sage
	emake PREFIX="${D}" install
	dosym lib64 /usr/local/sage/lib
	dodir /etc/env.d
	echo "CONFIG_PROTECT=/usr/local/sage/sageConfig" >> "${ED}etc/env.d/60sage"
}
