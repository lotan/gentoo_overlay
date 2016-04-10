EAPI=5
inherit cmake-utils

DESCRIPTION="Cryptographic filesystem for the cloud"
HOMEPAGE="https://www.cryfs.org"
SRC_URI="https://github.com/cryfs/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="dev-libs/crypto++
         dev-libs/boost[static-libs,threads]"
DEPEND="dev-util/cmake
        sys-devel/make
		${RDEPEND}"

src_install() {
	dobin "${CMAKE_BUILD_DIR}/src/${PN}-cli/${PN}"
	dodoc README.md
}
