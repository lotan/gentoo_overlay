# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-libs/libdmapsharing/libdmapsharing-2.1.13.ebuild,v 1.2 2011/04/08 21:51:49 eva Exp $

EAPI="3"

inherit autotools base eutils

DESCRIPTION="A library that implements the DMAP family of protocols"
HOMEPAGE="http://www.flyn.org/projects/libdmapsharing"
SRC_URI="http://www.flyn.org/projects/${PN}/${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="3.0"
KEYWORDS="~amd64 ~x86"
IUSE="doc"

RDEPEND="
	dev-libs/glib:2
	>=net-dns/avahi-0.6
	>=net-libs/libsoup-2.32:2.4
	>=media-libs/gstreamer-0.10:0.10
	>=media-libs/gst-plugins-base-0.10.24:0.10
	sys-libs/zlib
	|| (
		x11-libs/gdk-pixbuf:2
		x11-libs/gtk+:2 )
"
DEPEND="${RDEPEND}
	dev-util/pkgconfig
	doc? ( >=dev-util/gtk-doc-1 )
"

src_prepare() {
	base_src_prepare

	AT_M4DIR="m4" eautoreconf
}

src_configure() {
	econf --with-mdns=avahi $(use_enable doc gtk-doc)
}

src_install() {
	base_src_install
	find "${ED}" -name "*.la" -delete || die "la file removal failed"
	dodoc AUTHORS ChangeLog NEWS TODO || die "dodoc failed"
}
