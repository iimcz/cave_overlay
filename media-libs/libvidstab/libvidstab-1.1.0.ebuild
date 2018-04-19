# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
EAPI=6
inherit git-r3 cmake-multilib multilib

DESCRIPTION="Video stabilization library"
HOMEPAGE="http://public.hronopik.de/vid.stab/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="x86 amd64"
IUSE=""
DEPEND=""

RESTRICT=""
CMAKE_VERBOSE=OFF

EGIT_REPO_URI="https://github.com/georgmartius/vid.stab.git"
EGIT_COMMIT="v1.1.0"

