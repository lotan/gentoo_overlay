EAPI="2"

inherit eutils git-2 autotools

EGIT_REPO_URI="git://github.com/Cloudef/verynice-fork.git"
DESCRIPTION="Verynice fork with ionice support."
HOMEPAGE="https://github.com/Cloudef/verynice-fork"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=""
DEPEND=""

src_prepare() {
	epatch "${FILESDIR}/gentoo_init.patch"
}

src_install() {
	dodir /etc/init.d
	einstall RPM_BUILD_ROOT="${D}" PREFIX=/usr INIT_FILE="verynice.init.gentoo" INIT_SYS="/etc/init.d" || die

	# odd, the config file is installed +x
	fperms a-x /etc/verynice.conf

	dodoc README COPYING || die
}
