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

PATCHES=( "${FILESDIR}"/no_symlinks.patch )

python_install() {
	distutils-r1_python_install
	exeinto /usr/sbin
	doexe gdrivefs/tools/gdfs
	doexe gdrivefs/tools/gdfstool
	doexe gdrivefs/tools/gdfsdumpentry
#	dosym $(python_get_sitedir)/gdrivefs/tools/gdfs /usr/sbin/gdfs
#	dosym $(python_get_sitedir)/gdrivefs/tools/gdfstool /usr/sbin/gdfstool
}
