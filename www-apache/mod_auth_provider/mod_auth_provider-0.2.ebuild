# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/www-apache/mod_auth_kerb/mod_auth_kerb-5.4.ebuild,v 1.1 2009/09/17 06:50:34 hollow Exp $

inherit apache-module

DESCRIPTION="An Apache authentication module controlling authentication calling
order."
HOMEPAGE="http://meta.cesnet.cz/soubory/"
SRC_URI="http://is.muni.cz/th/172546/fi_b/${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

APACHE2_MOD_CONF="11_${PN}"
APACHE2_MOD_DEFINE="AUTH_PROVIDER"

DOCFILES="INSTALL README"

need_apache

src_compile() {
	CFLAGS="" APXS="${APXS}" econf || die "econf failed"
	emake || die "emake failed"
}
