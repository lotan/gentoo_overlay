# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="5"

PYTHON_COMPAT=( python3_4 )

inherit git-2 distutils-r1 python-r1 python-utils-r1 gnome2-utils

DESCRIPTION="Rhythmbox plugin to stream music from Ampache"
HOMEPAGE="http://code.google.com/p/rhythmbox-ampache"
EGIT_REPO_URI="https://github.com/lotan/rhythmbox-ampache.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""

RDEPEND="${DEPEND}
   ${PYTHON_DEPS}
   >=media-sound/rhythmbox-2.9[python]"

src_install() {
	distutils-r1_src_install

	# remove compiled gschemas
	rm -f ${D}/usr/share/glib-2.0/schemas/gschemas.compiled

	# remove eggs
	remove_eggs() {
		rm -rf ${D}$(echo $(python_get_sitedir)|sed -e 's/\/site-packages//')
	}
	python_foreach_impl remove_eggs
}

pkg_postinst() {
	/usr/bin/glib-compile-schemas /usr/share/glib-2.0/schemas
}

pkg_postrm() {
	pkg_postinst
}
