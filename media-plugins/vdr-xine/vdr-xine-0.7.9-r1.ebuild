# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-plugins/vdr-xine/vdr-xine-0.7.9-r1.ebuild,v 1.1 2006/07/01 14:52:37 hd_brummy Exp $

RESTRICT="mirror"

inherit vdr-plugin

DESCRIPTION="Video Disk Recorder Xine PlugIn"
HOMEPAGE="http://home.vr-web.de/~rnissl/"
SRC_URI="http://home.vr-web.de/~rnissl/${P}.tgz
		http://home.vr-web.de/~rnissl/attic/${P}.tgz
		mirror://vdrfiles/${PN}/${P}.tgz"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="~x86"
IUSE="vdr-net"

DEPEND=">=media-video/vdr-1.3.9
	>=media-libs/xine-lib-1.1.3"

src_unpack() {
	vdr-plugin_src_unpack

	use vdr-net && epatch "${FILESDIR}/${P}-network.diff"

	sed -i "s/^VDR_XINE_FIFO_DIR.*$/VDR_XINE_FIFO_DIR = \/var\/vdr\/xine/" "${S}"/Makefile

	sed -i "s:config.h):vdr/config.h):" "${S}"/Makefile

	if [[ -f /usr/include/xine/input_vdr.h ]] ; then
		einfo "detected vdr-patched xine-lib."
	else
		eerror "detected unpatched xine-lib!"
		einfo "you need to reemerge xine-lib with use-flag vdr!"
		die "you need to reemerge xine-lib with use-flag vdr!"
	fi
}

src_install() {
	vdr-plugin_src_install

	cd "${S}"
	exeinto /usr/bin
	doexe xineplayer

	insopts -m0644 -ovdr -gvideo
	insinto /etc/vdr/plugins/xine
	doins data/*

	diropts -ovdr -gvideo
	keepdir /var/vdr
}

