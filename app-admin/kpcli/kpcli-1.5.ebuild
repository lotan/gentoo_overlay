EAPI="2"

DESCRIPTION="KeePass Command Line Interface (CLI) / interactive shell. Use this program to access and manage your KeePass 1.x database from a Unix-like command line."
HOMEPAGE="http://kpcli.sourceforge.net"
SRC_URI="mirror://sourceforge/kpcli/${P}.pl"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="dev-perl/Clone
         dev-perl/Crypt-Rijndael
         dev-perl/Sort-Naturally
         dev-perl/Term-ShellUI
         dev-perl/File-KeePass"
DEPEND=""

src_unpack() {
	cp "${DISTDIR}/${A}" kpcli
}

src_install() {
	exeinto /usr/bin
	doexe kpcli || die
}
