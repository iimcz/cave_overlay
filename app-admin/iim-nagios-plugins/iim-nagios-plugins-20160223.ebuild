# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
EAPI=5
inherit git-r3

DESCRIPTION="Nagios plaugins for IIM"
HOMEPAGE="https://github.com/v154c1/nagios_plugins"
#SRC_URI="${P}.tar.bz2"

LICENSE=""
SLOT="0"
KEYWORDS="x86 amd64 arm"
IUSE=""
DEPEND="net-analyzer/nagios-plugins"

RESTRICT=""

EGIT_REPO_URI="https://github.com/v154c1/nagios_plugins.git"
#EGIT_BRANCH=""
#EGIT_COMMIT=""


src_install() {
	insinto /usr/lib/nagios/plugins
	for i in plugins/*; do
		doins ${i}
	done
}
