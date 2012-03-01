# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/www-apache/mod_auth_kerb/mod_auth_kerb-5.4.ebuild,v 1.1 2009/09/17 06:50:34 hollow Exp $

EAPI="2"

inherit apache-module cvs autotools

DESCRIPTION="An Apache authentication module using Kerberos."
HOMEPAGE="http://modauthkerb.sourceforge.net/"
#SRC_URI="mirror://sourceforge/modauthkerb/${P}.tar.gz"
ECVS_SERVER="modauthkerb.cvs.sourceforge.net:/cvsroot/modauthkerb"
ECVS_MODULE="mod_auth_kerb"
ECVS_BRANCH="HEAD"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

S="${WORKDIR}/${PN}"

DEPEND="virtual/krb5"
RDEPEND="${DEPEND}"

APACHE2_MOD_CONF="11_${PN}"
APACHE2_MOD_DEFINE="AUTH_KERB"

DOCFILES="INSTALL README"

need_apache

src_prepare() {
	cd "${S}"
	eautoreconf
}

src_compile() {
	CFLAGS="" APXS="${APXS}" econf --with-krb5=/usr --without-krb4 || die "econf failed"
	emake || die "emake failed"
}
