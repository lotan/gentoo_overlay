EAPI="6"

inherit cmake-utils eutils git-r3 autotools

EGIT_REPO_URI="git://github.com/edorfaus/TEMPered.git"
DESCRIPTION="C library and program for reading the TEMPer family of thermometer
and hygrometer devices."
HOMEPAGE="https://github.com/edorfaus/TEMPered"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="sys-libs/hidapi
         dev-util/cmake"

DEPEND="${RDEPEND}
        app-misc/pax-utils"

src_prepare() {
	epatch "${FILESDIR}"/fix_cmakelist.patch
	eapply_user
}
