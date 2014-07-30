EAPI=5
PYTHON_COMPAT=( python{2_6,2_7} )

#if LIVE
inherit git-2
EGIT_REPO_URI="git://github.com/dsoprea/GDriveFS.git
	https://github.com/dsoprea/GDriveFS.git"
#endif

inherit distutils-r1

DESCRIPTION="An innovative FUSE wrapper for Google Drive."
HOMEPAGE="https://github.com/dsoprea/GDriveFS"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="
	dev-python/google-appengine
	dev-python/httplib2
	dev-python/python-dateutil
	dev-python/fusepy
	dev-python/google-api-python-client"
DEPEND="${RDEPEND}"

python_install() {
	distutils-r1_python_install
	dosym /usr/bin/gdfs /sbin/mount.gdfs
}
