# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
EAPI=5
inherit cmake-utils

DESCRIPTION=" C++ machine learning library "
HOMEPAGE="http://www.mlpack.org"
SRC_URI="http://www.mlpack.org/files/mlpack-2.0.0.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~x86 amd64"
IUSE="test"
#S=${WORKDIR}
DEPEND="sci-libs/armadillo:0/6"

RESTRICT=""
CMAKE_VERBOSE=OFF

