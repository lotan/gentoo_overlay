# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/www-apps/ampache/ampache-3.5.4.ebuild,v 1.1 2010/12/09 10:01:47 radhermit Exp $

EAPI="2"

inherit webapp depend.php git-2 eutils

DESCRIPTION="Ampache is a PHP-based tool for managing, updating and playing your audio files via a web interface."
HOMEPAGE="http://www.ampache.org/"

EGIT_REPO_URI="git://github.com/ampache/ampache.git"

LICENSE="GPL-2"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"
IUSE="aac flac mp3 ogg transcode"

RDEPEND="dev-lang/php[gd,hash,iconv,mysql,session,unicode,xml,zlib]
	|| ( <dev-lang/php-5.3[pcre] >=dev-lang/php-5.3 )
	transcode? ( media-sound/lame
		aac? ( || ( media-libs/faad2 media-sound/alac_decoder ) )
		flac? ( media-libs/flac )
		mp3? ( media-sound/mp3splt )
		ogg? ( media-sound/mp3splt media-sound/vorbis-tools )
	)"
DEPEND=""

need_httpd_cgi

src_install() {
	epatch "${FILESDIR}"/no_logrotate.patch
	webapp_src_preinst

	dodoc docs/*
	rm -rf docs/

	insinto "${MY_HTDOCSDIR}"
	doins -r .

#	webapp_postinst_txt en "${FILESDIR}"/installdoc.txt
	webapp_src_install
}

pkg_postinst() {
	elog "Install and upgrade instructions can be found here:"
	elog "  /usr/share/doc/${P}/INSTALL.gz"
	elog "  /usr/share/doc/${P}/MIGRATION.gz"
	webapp_pkg_postinst
}
