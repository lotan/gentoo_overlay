# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-libs/libdmapsharing/libdmapsharing-2.1.13.ebuild,v 1.2 2011/04/08 21:51:49 eva Exp $

EAPI="3"

inherit autotools base eutils

DESCRIPTION="Serve DAAP (iTunes) and DPAP (iPhoto) shares from Linux"
HOMEPAGE="http://www.flyn.org/projects/dmapd"
SRC_URI="http://www.flyn.org/projects/${PN}/${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
    dev-libs/glib
	net-libs/libsoup
	dev-libs/libxml2
	media-libs/libexif
	media-libs/gstreamer
    net-libs/libdmapsharing:3.0
	media-gfx/graphicsmagick
	>=media-libs/vips-7.24.1
"
DEPEND="${RDEPEND}
"

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed."

	newinitd "${FILESDIR}/${PN}.init.d" ${PN} || die
	newconfd "${FILESDIR}/${PN}.conf.d" ${PN} || die
	keepdir /var/cache/dmapd || die

	dodoc AUTHORS ChangeLog README NEWS || die
}

pkg_preinst() {
	enewgroup dmapd
	enewuser dmapd -1 -1 /dev/null dmapd
	fowners -R dmapd:dmapd /var/cache/dmapd
	fperms -R 0700 /var/cache/dmapd
}
