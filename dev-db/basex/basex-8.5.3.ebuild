# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit autotools eutils

DESCRIPTION="Light-weight, high-performance and scalable XML Database engine and XPath/XQuery 3.1 Processor"
HOMEPAGE="http://basex.org/"
SRC_URI="http://files.basex.org/releases/8.5.3/BaseX853.zip"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="virtual/jre"
DEPEND="${RDEPEND}"

S="${WORKDIR}/basex"

src_install() {
	dodir /opt/basex
	rsync -a ${S}/ ${D}/opt/basex/
	dodir /etc/init.d
	rsync -a ${FILESDIR}/init ${D}/etc/init.d/basex
	chmod +x ${D}/etc/init.d/basex
}

