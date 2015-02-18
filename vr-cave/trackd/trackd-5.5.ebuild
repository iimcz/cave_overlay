# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
EAPI=2
DESCRIPTION="TrackD for CAVElib and other libraries"
HOMEPAGE=""
SRC_URI="http://storage/trackd.tgz sdk? ( http://storage/trackdSDK.tgz )"

LICENSE="proprietary"
SLOT="0"
KEYWORDS="x86 amd64"
IUSE="sdk"
S=${WORKDIR}
DEPEND=""
RESTRICT="binchecks"
QA_PRESTRIPPED="usr/local/CAVE/trackd/bin/cubicmouse.so usr/local/CAVE/trackd/bin/fastrak.so /usr/local/CAVE/trackd/bin/flybox.so /usr/local/CAVE/trackd/bin/fobirds.so /usr/local/CAVE/trackd/bin/is600.so /usr/local/CAVE/trackd/bin/is900.so /usr/local/CAVE/trackd/bin/is_trackers.so /usr/local/CAVE/trackd/bin/laserbird.so /usr/local/CAVE/trackd/bin/libtrackd.so /usr/local/CAVE/trackd/bin/motionstar.so /usr/local/CAVE/trackd/bin/neowand.so /usr/local/CAVE/trackd/bin/pcbird.so /usr/local/CAVE/trackd/bin/pinch.so /usr/local/CAVE/trackd/bin/rs232.so /usr/local/CAVE/trackd/bin/sb3003.so /usr/local/CAVE/trackd/bin/sb4000.so /usr/local/CAVE/trackd/bin/shm.so /usr/local/CAVE/trackd/bin/spaceorb.so /usr/local/CAVE/trackd/bin/spacepad.so /usr/local/CAVE/trackd/bin/udp.so /usr/local/CAVE/trackd/bin/wand.so /usr/local/CAVE/trackd/bin/wanda.so /usr/local/CAVE/trackd/bin/workwand.so usr/local/CAVE/trackd/licenses/VRCO usr/local/CAVE/trackd/licenses/lmgrd usr/local/CAVE/trackd/licenses/lmutil"
QA_EXECSTACK="usr/local/CAVE/trackdSDK/example/DummyTracker.o usr/local/CAVE/trackdSDK/example/DummyController.o usr/local/CAVE/trackdSDK/libs/irix/libBaseMod.a:BaseMod.o usr/local/CAVE/trackdSDK/libs/linux_ia64/libBaseMod.a:BaseMod.o usr/local/CAVE/trackdSDK/libs/sun/libBaseMod.a:BaseMod.o usr/local/CAVE/trackdSDK/libs/linux/libBaseMod.a:BaseMod.o"


src_install() {
	dodir /usr/local/CAVE
	cp -r ${WORKDIR}/trackd ${D}/usr/local/CAVE/
	if use sdk; then
		cp -r ${WORKDIR}/trackdSDK ${D}/usr/local/CAVE/
	fi

}
