EAPI=5
PYTHON_COMPAT=( python{2_6,2_7} )

inherit distutils-r1

DESCRIPTION="Google APIs Client Library for Python"
HOMEPAGE="http://code.google.com/p/google-api-python-client/"
SRC_URI="http://${PN}.googlecode.com/files/${P}.zip"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	dev-python/python-gflags"

PYTHON_DEPEND="2"
