# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="FUSE module to mount camera as filesystem"
HOMEPAGE="http://www.gphoto.org/proj/gphotofs/ "
SRC_URI="mirror://sourceforge/gphoto/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=">=sys-fs/fuse-2.4
		>=media-libs/libgphoto2-2.0
"

src_install(){
	einstall || die 'Installation failed'
}
