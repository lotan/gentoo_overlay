# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sys-fs/mtd/mtd-20050519.ebuild,v 1.6 2007/06/26 06:00:24 kumba Exp $

inherit eutils toolchain-funcs

DESCRIPTION="Modifies disk geometry settings saved in a NTFS boot sector"
HOMEPAGE="http://www.linux-ntfs.org/doku.php?id=contrib:ntfsreloc"
SRC_URI="http://cc.jct.ac.il/~shaneh/${PN}.c"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

S="${WORKDIR}"

src_unpack(){
	cd "$DISTDIR" && cp $A "$S" || die "Copying source failed"
}

src_compile() {
	$(tc-getCC) ${CFLAGS} -o ntfsreloc ntfsreloc.c || die
}

src_install() {
	dosbin ntfsreloc
}
