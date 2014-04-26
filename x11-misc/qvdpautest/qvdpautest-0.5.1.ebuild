# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit qt4-r2

DESCRIPTION="VDPAU benchmarking tool"

HOMEPAGE="http://www.nvnews.net/vbulletin/showthread.php?t=133465"

SRC_URI="http://hftom.free.fr/${P}.tar.gz"

LICENSE="LGPL-2.1"

SLOT="0"

KEYWORDS="~x86 ~amd64"

IUSE=""

DEPEND="x11-libs/libvdpau
        dev-qt/qtgui:4"

RDEPEND="${DEPEND}"

src_prepare() {
        cd ${WORKDIR}/${P}
        echo "#!/bin/bash" > ${PN}.sh
        echo '' >> ${PN}.sh
        echo 'CURRDIR="$(pwd)"' >> ${PN}.sh
        echo "cd /usr/share/${PN}" >> ${PN}.sh
        echo "./${PN}-exec \"\$@\"" >> ${PN}.sh
        echo 'cd "${CURRDIR}"' >> ${PN}.sh
}

src_install() {
        newbin ${PN}.sh ${PN}
        dodoc README
        exeinto /usr/share/${PN}
        newexe ${PN} ${PN}-exec
        insinto /usr/share/${PN}
        doins *.dat
}
