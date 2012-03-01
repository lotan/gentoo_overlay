# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit vdr-plugin

DESCRIPTION="VDR plugin: for 'software only' playback using xine"
HOMEPAGE="http://home.vr-web.de/~rnissl/"
SRC_URI="http://home.vr-web.de/~rnissl/${P}.tgz"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="~x86 ~amd64"
IUSE="yaepg"

DEPEND=">=media-video/vdr-1.3.9
   >=media-libs/xine-lib-1.1.8"

pkg_setup() {
   vdr-plugin_pkg_setup
}

src_unpack() {
   vdr-plugin_src_unpack

   epatch "${FILESDIR}/${P}-gentoo.diff"

   use yaepg && sed -i Makefile -e "s:#VDR_XINE_SET_VIDEO_WINDOW:VDR_XINE_SET_VIDEO_WINDOW:"
}

src_install() {
   vdr-plugin_src_install

   dobin xineplayer

   insinto /usr/share/vdr/xine
   doins data/*
}

pkg_postinst() {
   vdr-plugin_pkg_postinst

   if [[ -d ${ROOT}/etc/vdr/plugins/xine ]]; then
   	ewarn "You have a leftover directory of vdr-xine."
   	ewarn "You can safely remove it with:"
   	ewarn "# rm -rf /etc/vdr/plugins/xine"
   fi
}
