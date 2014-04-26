# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-plugins/vdr-nordlichtsepg/vdr-nordlichtsepg-0.9_pre1.ebuild,v 1.2 2008/03/31 01:58:45 mr_bones_ Exp $

EAPI="5"

inherit vdr-plugin-2

IUSE=""
SLOT="0"

MY_P="${P}-test1"

DESCRIPTION="vdr Plugin: Better EPG view than default vdr"
HOMEPAGE="http://martins-kabuff.de/nordlichtsepg.html"
SRC_URI="http://martins-kabuff.de/download/${MY_P}.tgz"
LICENSE="GPL-2"

KEYWORDS="~amd64 ~x86"

DEPEND=">=media-video/vdr-1.3.31"

S="${WORKDIR}/${PN#vdr-}-${PV%_pre*}"

src_prepare() {
   epatch "${FILESDIR}/vdr-nordlichtsepg-0.9-test1-utf8fix.diff"
   epatch "${FILESDIR}/nordlichtsepg-0.9-test1-progressbar_fix.diff"
   epatch "${FILESDIR}/nordlichtsepg-0.9-test1-record_button_fix.diff"
   vdr-plugin-2_src_prepare
}
