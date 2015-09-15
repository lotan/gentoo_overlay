# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
#

EAPI=5

inherit multilib

DESCRIPTION="decode and send infra-red signals of many commonly used remote controls"
HOMEPAGE="http://www.lirc.org/"

MY_P=${PN}-${PV/_/}

SRC_URI="mirror://sourceforge/${PN}/${MY_P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ppc ppc64 x86"
IUSE="doc static-libs X"

S="${WORKDIR}/${MY_P}"

RDEPEND="
	X? (
		x11-libs/libX11
		x11-libs/libSM
		x11-libs/libICE
	)"
DEPEND="$RDEPEND"

src_configure() {
	econf \
		--localstatedir=/var \
		$(use_enable static-libs static) \
		$(use_with X x)
}

src_install() {
	emake DESTDIR="${D}" install

#	newinitd "${FILESDIR}"/lircd-0.8.6-r2 lircd
#	newinitd "${FILESDIR}"/lircmd lircmd
#	newconfd "${FILESDIR}"/lircd.conf.4 lircd

#	newinitd "${FILESDIR}"/irexec-initd-0.8.6-r2 irexec
#	newconfd "${FILESDIR}"/irexec-confd irexec

	if use doc ; then
		dohtml doc/html/*.html
		insinto /usr/share/doc/${PF}/images
		doins doc/images/*
	fi

#	insinto /usr/share/lirc/remotes
#	doins -r remotes/*

#	keepdir /etc/lirc
#	if [[ -e "${D}"/etc/lirc/lircd.conf ]]; then
#		newdoc "${D}"/etc/lirc/lircd.conf lircd.conf.example
#	fi

	use static-libs || rm "${D}/usr/$(get_libdir)/liblirc_client.la"
}
