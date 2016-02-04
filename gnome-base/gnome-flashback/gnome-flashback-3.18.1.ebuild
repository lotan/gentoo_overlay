# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"
GCONF_DEBUG="yes"

inherit gnome2

DESCRIPTION="Gnome flashback session manager"
HOMEPAGE="https://wiki.gnome.org/Projects/GnomeFlashback"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="
	gnome-base/gnome-settings-daemon
	>=x11-themes/gnome-themes-standard-2.91.92
"
DEPEND="
	>=dev-util/intltool-0.40.6
	${RDEPEND}
"
