EAPI=5
PYTHON_COMPAT=( python{2_6,2_7,3_2,3_3} )

if [[ ${PV} = *9999* ]]; then
inherit git-2
EGIT_REPO_URI="git://github.com/terencehonles/fusepy.git"
else
SRC_URI="https://github.com/terencehonles/fusepy/archive/v${PV}.tar.gz"
fi

inherit distutils-r1

DESCRIPTION="python FUSE bindings using ctypes"
HOMEPAGE="https://github.com/terencehonles/fusepy"
LICENSE="BSD"
KEYWORDS="~x86 ~amd64"
SLOT="0"
IUSE=""
RDEPEND="
"
DEPEND="
	$RDEPEND
"
