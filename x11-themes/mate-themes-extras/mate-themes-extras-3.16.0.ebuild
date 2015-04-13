# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"
GCONF_DEBUG="no"

inherit mate

DESCRIPTION="The mate-themes-extras package contains a collection of GTK2/3 desktop themes for MATE"
HOMEPAGE="https://github.com/NiceandGently/mate-themes-extras"
SRC_URI="https://github.com/NiceandGently/mate-themes-extras/archive/v${PV}.tar.gz -> mate-themes-extras-${PV}.tar.gz"
LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

# TODO: ebuilds faience-icon-theme elementary-icon-theme gtk-smooth-engine
RDEPEND=">=x11-libs/gtk+-2:2
	!!=x11-libs/gtk+-3.4
	!!=x11-libs/gtk+-3.8
	>=x11-themes/gtk-engines-2.15.3:2
	x11-themes/gtk-engines-xfce:0
	x11-themes/murrine-themes
	x11-themes/vanilla-dmz-xcursors
	x11-themes/gtk-engines-unico
	x11-themes/gnome-colors-themes
	x11-themes/gnome-icon-theme
	x11-themes/mate-icon-theme"

DEPEND="${RDEPEND}
	>=x11-misc/icon-naming-utils-0.8.7
	virtual/pkgconfig
	>=dev-util/intltool-0.35
	sys-devel/gettext"

#	>=app-text/mate-doc-utils-1.2.1

RESTRICT="binchecks strip"

S="${WORKDIR}/mate-themes-extras-${PV}"

src_configure() {
	DOCS="AUTHORS ChangeLog NEWS README"

	mate_src_configure \
		--enable-Blue-Submarine \
		--enable-clearlooks-phenix \
		--enable-Cologne \
		--enable-DeLorean-Dark \
		--enable-Faience \
		--enable-Faience-Ocre \
		--enable-Gnome-Cupertino \
		--enable-Gnome-Cupertino-Mint \
		--enable-GnomishBeige \
		--enable-Green-Submarine \
		--enable-Smoothly \
		--enable-Smoothly-Black \
		--enable-Zukitwo \
		--enable-Zukitwo-Brave \
		--enable-Zukitwo-Dust \
		--enable-Zukitwo-Human \
		--enable-Zukitwo-Illustrious \
		--enable-Zukitwo-Noble \
		--enable-Zukitwo-Wine \
		--enable-Zukitwo-Wise \
		--enable-Zukitwo-Colors
}
