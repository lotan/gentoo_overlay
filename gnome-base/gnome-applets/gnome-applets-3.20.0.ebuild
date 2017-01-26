# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"
GCONF_DEBUG="yes"

inherit gnome2 eutils

DESCRIPTION="Small applications for the Gnome Panel"
HOMEPAGE="https://wiki.gnome.org/Projects/GnomeApplets"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="
	gnome-base/gnome-panel
"
DEPEND="
	>=dev-util/intltool-0.40.6
	${RDEPEND}
"

src_configure() {
	gnome2_src_configure \
		--with-cpufreq-lib=cpupower
}
