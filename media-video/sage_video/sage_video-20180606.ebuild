# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
EAPI=5
PYTHON_COMPAT=( python{2_7,3_3,3_4,3_5} )
inherit git-r3 python-utils-r1 python-r1

DESCRIPTION="Sage video player"
HOMEPAGE="http://www.libyuri.org"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 amd64 arm"
IUSE="+virtual-camera"
#S=${WORKDIR}
DEPEND="media-libs/libyuri
	media-video/ffmpeg
	virtual-camera? ( media-libs/virtual_camera )
	"


RESTRICT=""
CMAKE_VERBOSE=OFF

EGIT_REPO_URI="https://github.com/v154c1/sage_video"
EGIT_BRANCH="master"
#EGIT_COMMIT="1d002b67bc5407b94e000d659477f3ee1b3ad9e1"


#src_unpack() {
#	git-r3_fetch
#	git-r3_checkout
#}

#src_compile() {
#}

src_install() {

	python_foreach_impl python_doscript python/sage_video/sagevideo.py
	python_foreach_impl python_doscript python/sage_video/sagewebcam.py
	python_foreach_impl python_doscript python/sage_video/sagewebjpeg.py
	python_foreach_impl python_doscript python/sage_video/sagewebrtc.py
	dosym /usr/bin/sagevideo.py /usr/bin/sagevideo
	dosym /usr/bin/sagewebcam.py /usr/bin/sagewebcam
	dosym /usr/bin/sagewebjpeg.py /usr/bin/sagewebjpeg
	dosym /usr/bin/sagewebrtc.py /usr/bin/sagewebrtc
	insinto /etc/sage_video/
	newins python/config.json.sample config.json.sample
	dodir /usr/share/sage_video/configs
	cp -R "${S}/configs" "${D}/usr/share/sage_video/" || die "Install failed!"
	dodir /usr/share/sage_video/sage2_apps
	cp -R "${S}/sage2_apps" "${D}/usr/share/sage_video/" || die "Install failed!"
}
