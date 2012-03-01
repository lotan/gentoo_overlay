# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-plugins/vdr-ffnetdev-svn/vdr-ffnetdev-svn-0.0.1.ebuild,v 1.2 2006/01/31 01:50:01 hd_brummy Exp $

RESTRICT="nomirror"

inherit vdr-plugin subversion

ESVN_REPO_URI="http://svn.berlios.de/svnroot/repos/ffnetdev/trunk"
ESVN_PROJECT="ffnetdev"

S=${WORKDIR}/${VDRPLUGIN}-${PV}

DESCRIPTION="VDR Plugin: Output device which offers OSD via VNC and Video as raw mpeg over network"
HOMEPAGE="http://ffnetdev.berlios.de"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=media-video/vdr-1.3.18
      !media-plugins/vdr-ffnetdev-svn"
RDEPEND="${DEPEND}"

src_unpack() {
   subversion_src_unpack ${A}
   vdr-plugin_src_unpack all_but_unpack
   cd "${S}"
   epatch "${FILESDIR}"/strcpy_buffer_overflow.patch
}

