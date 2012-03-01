# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-themes/skinenigmang-logos/skinenigmang-logos-20070214-r1.ebuild,v 1.1 2011/01/17 19:29:56 hd_brummy Exp $

EAPI="2"

inherit eutils

DESCRIPTION="VDR - Skin Plugin: enigma-ng logos"
HOMEPAGE="http://andreas.vdr-developer.org/enigmang/download.html"
SRC_URI="!dxr3? ( http://andreas.vdr-developer.org/enigmang/download/${PN}-xpm-hi-${PV}.tgz )
		dxr3? ( http://andreas.vdr-developer.org/enigmang/download/${PN}-xpm-lo-${PV}.tgz )"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="dxr3"

RDEPEND="media-plugins/vdr-skinenigmang
		app-text/convmv"

S=${WORKDIR}/skinenigmang

src_prepare() {

	find -type f -o -type l|while read i; do convmv --notest --nosmart -f iso-8859-1 -t cp850 "$i"; done 2>/dev/null
	find -type f -o -type l|while read i; do convmv --notest --nosmart -f cp850 -t utf-8 "$i"; done 2>/dev/null
}

src_install() {

	insinto /usr/share/vdr/skinenigmang
	cp -r -a "${S}"/* --target="${D}"/usr/share/vdr/skinenigmang
}
