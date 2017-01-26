# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"
GCONF_DEBUG="yes"

inherit gnome2

DESCRIPTION="Panel of Gnome flashback"
HOMEPAGE="https://wiki.gnome.org/Projects/GnomePanel"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="
	>=dev-libs/libgweather-3.18.1
"
DEPEND="
	>=dev-util/intltool-0.40.6
	${RDEPEND}
"
