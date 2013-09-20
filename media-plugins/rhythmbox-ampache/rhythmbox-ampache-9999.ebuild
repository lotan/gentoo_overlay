# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

PYTHON_DEPEND="3"

inherit subversion distutils

DESCRIPTION="Rhythmbox plugin to stream music from Ampache"
HOMEPAGE="http://code.google.com/p/rhythmbox-ampache"
#SRC_URI="http://rhythmbox-ampache.googlecode.com/files/rhythmbox-ampache-0.11.1.tar.gz"
ESVN_REPO_URI="http://rhythmbox-ampache.googlecode.com/svn/branches/for_rhythmbox-gtk+3"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""

RDEPEND="${DEPEND}
   >=media-sound/rhythmbox-2.9[python]"

pkg_preinst() {
	rm -f ${D}/usr/share/glib-2.0/schemas/gschemas.compiled
	rm -rf ${D}/usr/lib/python3.2/site-packages/
}
