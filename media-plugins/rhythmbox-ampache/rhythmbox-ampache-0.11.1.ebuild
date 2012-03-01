# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-plugins/rhythmbox-equalizer/rhythmbox-equalizer-0.1.ebuild,v 1.1 2011/04/16 17:35:14 nerdboy Exp $

EAPI=3

PYTHON_DEPEND="2:2.6"

inherit eutils python

MY_P="rb-equalizer-${PV}"

DESCRIPTION="Rhythmbox plugin to stream music from Ampache"
HOMEPAGE="http://code.google.com/p/rhythmbox-ampache"
SRC_URI="http://rhythmbox-ampache.googlecode.com/files/rhythmbox-ampache-0.11.1.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""

RDEPEND="${DEPEND}
   >=media-sound/rhythmbox-0.12.8[python]"

src_unpack() {
	unpack ${A}
	cd "${S}"

	epatch "${FILESDIR}"/fix_issue8.patch
}

src_install() {
   cd "${P}"
   insinto /usr/$(get_libdir)/rhythmbox/plugins
   doins -r ampache || die
}

pkg_postinst() {
   python_mod_optimize /usr/$(get_libdir)/rhythmbox/plugins/ampache
}

pkg_postrm() {
   python_mod_cleanup /usr/$(get_libdir)/rhythmbox/plugins/ampache
}
