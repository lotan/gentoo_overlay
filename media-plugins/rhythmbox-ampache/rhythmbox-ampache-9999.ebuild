# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="5"

PYTHON_DEPEND="3"

inherit git-2 distutils gnome2-utils

DESCRIPTION="Rhythmbox plugin to stream music from Ampache"
HOMEPAGE="http://code.google.com/p/rhythmbox-ampache"
EGIT_REPO_URI="https://github.com/lotan/rhythmbox-ampache.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""

RDEPEND="${DEPEND}
   >=media-sound/rhythmbox-2.9[python]"

src_install() {
	distutils_src_install
	find ${D} -print
	rm -f ${D}/usr/share/glib-2.0/schemas/gschemas.compiled
	rm -rf ${D}$(python_get_sitedir)
}

pkg_postinst() {
	/usr/bin/glib-compile-schemas /usr/share/glib-2.0/schemas
}

pkg_postrm() {
	pkg_postinst
}
