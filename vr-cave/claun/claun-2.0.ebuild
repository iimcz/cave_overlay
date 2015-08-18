# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
EAPI=5
PYTHON_COMPAT=( python2_7 )


inherit git-r3 distutils-r1

DESCRIPTION="Cave Launcher"
HOMEPAGE="http://www.iim.cz/claun"
#SRC_URI="${P}.tar.bz2"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 amd64"
IUSE=""
#S=${WORKDIR}
DEPEND="dev-python/couchdb-python
	dev-python/docutils
	dev-python/mimeparse
	dev-python/httplib2
	dev-python/pyyaml
	sys-power/acpi
"


RESTRICT=""


EGIT_REPO_URI="anon@git.iim.cz:claun"
EGIT_BRANCH="master"
EGIT_COMMIT="6360bbda7673a5525fc8b701c6d80eb3ea5d3e8c"

S="${S}/src"
