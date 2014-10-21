# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-perl/HTTP-Cache-Transparent/HTTP-Cache-Transparent-0.7.ebuild,v 1.9 2007/03/05 12:03:56 ticho Exp $

EAPI=5

inherit perl-module

DESCRIPTION="Cache the result of http get-requests persistently."
HOMEPAGE="http://search.cpan.org/~mattiash/${P}"
SRC_URI="mirror://cpan/authors/id/M/MA/MATTIASH/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ia64 ppc sparc x86"
IUSE=""

SRC_TEST="do"

DEPEND="dev-perl/libwww-perl
	virtual/perl-Digest-MD5
	virtual/perl-Storable
	dev-lang/perl"
