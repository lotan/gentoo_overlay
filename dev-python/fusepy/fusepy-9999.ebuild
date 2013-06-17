EAPI=5
PYTHON_COMPAT=( python{2_6,2_7,3_2,3_3} )

inherit git-2 distutils-r1

DESCRIPTION="python FUSE bindings using ctypes"
HOMEPAGE="https://github.com/terencehonles/fusepy"
SRC_URI=""
LICENSE="BSD"
KEYWORDS="~x86 ~amd64"
SLOT="0"
IUSE=""
RDEPEND="
"
DEPEND="
 $RDEPEND
"

EGIT_REPO_URI="git://github.com/terencehonles/fusepy.git"
