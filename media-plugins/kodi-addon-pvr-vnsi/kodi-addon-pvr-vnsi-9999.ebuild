EAPI="5"

RELEASE_NAME="Isengard"

inherit cmake-utils

case ${PV} in
	9999)
		inherit git-2
		EGIT_REPO_URI="https://github.com/kodi-pvr/pvr.vdr.vnsi.git"
		EGIT_BRANCH="${RELEASE_NAME}"
		;;
	*_rc*)
		MY_PV="${RELEASE_NAME}${PV/14.0/}"
		MY_P="xbmc-pvr-addons-${MY_PV}"
		SRC_URI="https://github.com/opdenkamp/xbmc-pvr-addons/archive/${MY_PV}.tar.gz -> kodi-addon-pvr-${PV}.tar.gz"
		KEYWORDS="~amd64 ~x86"
		;;
esac

DESCRIPTION="KODI PVR add-ons VNSI"
HOMEPAGE="https://github.com/kodi-pvr/pvr.vdr.vnsi"

LICENSE="GPL-3"
SLOT="0"
IUSE=""

DEPEND=">=media-tv/kodi-15.0"
RDEPEND="${DEPEND}"

src_install() {
	cmake-utils_src_install
	local libdir=$(get_libdir)
	mkdir ${D}/usr/${libdir}/kodi
	mv ${D}/usr/${libdir}/addons ${D}/usr/${libdir}/kodi
}
