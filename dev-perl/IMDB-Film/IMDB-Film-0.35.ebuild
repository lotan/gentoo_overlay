# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $

EAPI=5

inherit perl-module

DESCRIPTION="IMDB::Film - Acquire information from imdb.com"
SRC_URI="mirror://cpan/authors/id/S/ST/STEPANOV/${P}.tar.gz"
HOMEPAGE="http://search.cpan.org/~stepanov/"

SLOT="0"
LICENSE="Unknown"
KEYWORDS="~x86"
SRC_TEST="do"
IUSE=""
DEPEND="virtual/perl-digest-base
        dev-lang/perl
		dev-perl/Cache-Cache"
