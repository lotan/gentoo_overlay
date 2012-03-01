# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="A utility for management and user-mode mounting of encrypted filesystems"
HOMEPAGE="http://squidkerbauth.sourceforge.net"
SRC_URI="mirror://sourceforge/squidkerbauth/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND=">=net-proxy/squid-3
   >=net-nds/openldap-2
   app-crypt/mit-krb5
   dev-libs/cyrus-sasl"
DEPEND="${RDEPEND}"

src_install() {
	emake DESTDIR="${D}" install || die "Install failed"
	dodoc AUTHORS ChangeLog NEWS README || die
}
