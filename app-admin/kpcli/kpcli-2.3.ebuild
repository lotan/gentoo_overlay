# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="A command line interface to KeePass database files"
HOMEPAGE="http://kpcli.sourceforge.net"
SRC_URI="http://downloads.sourceforge.net/project/${PN}/${P}.pl"

LICENSE="|| ( Artistic GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="dev-lang/perl
	dev-perl/Capture-Tiny
	dev-perl/Clipboard
	dev-perl/Clone
	dev-perl/Crypt-Rijndael
	dev-perl/File-KeePass
	dev-perl/Sort-Naturally
	dev-perl/TermReadKey
	dev-perl/Term-ReadLine-Gnu
	dev-perl/Term-ShellUI "

# TODO: Term-ReadLine-Gnu, dev-perl/Capture-Tiny dev-perl/Clipboard are optional
# TODO: add optional dep Data::Password (not in portage)

src_unpack() {
	mkdir "${S}"
	cp "${DISTDIR}"/${P}.pl "${S}" || die
}

src_install() {
	mv "${S}"/"${P}".pl "${S}"/"${PN}" || die
	dobin kpcli || die
}
