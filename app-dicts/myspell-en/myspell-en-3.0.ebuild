# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-dicts/myspell-de/myspell-de-2012.06.17-r1.ebuild,v 1.6 2013/06/30 21:11:34 ago Exp $

EAPI=4

MYSPELL_DICT=(
	"en_GB.aff"
	"en_GB.dic"
)

MYSPELL_HYPH=(
	"hyph_en_GB.dic"
)

MYSPELL_THES=(
	"th_en_US_v2.dat"
	"th_en_US_v2.idx"
)

inherit myspell-r2

DESCRIPTION="German dictionaries for myspell/hunspell"
HOMEPAGE="
	http://extensions.libreoffice.org/extension-center/german-de-de-frami-dictionaries
"
SRC_URI="
    http://extensions.libreoffice.org/extension-center/american-british-canadian-spelling-hyphen-thesaurus-dictionaries/releases/${PV}/kpp-british-english-dictionary-674039-word-list.oxt
"

LICENSE="GPL-2 LGPL-2"
SLOT="0"
KEYWORDS="~alpha amd64 ~arm ~hppa ~ia64 ~mips ppc ~ppc64 ~sh ~sparc x86 ~amd64-fbsd ~x86-fbsd"
IUSE=""

