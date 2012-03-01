# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/django/django-9999.ebuild,v 1.13 2011/12/21 07:06:46 floppym Exp $

EAPI="3"
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils subversion eutils

DESCRIPTION="A bridge between Python and the Mozilla SpiderMonkey JavaScript
engine."
HOMEPAGE="http://code.google.com/p/python-spidermonkey"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="dev-lang/spidermonkey"
DEPEND="${RDEPEND}
        dev-python/pyrex"

ESVN_REPO_URI="http://python-spidermonkey.googlecode.com/svn/trunk/"

DOCS="README COPYING"

src_prepare() {
	distutils_src_prepare

	epatch "${FILESDIR}"/cinit.patch
	epatch "${FILESDIR}"/indirect_copy.patch
}
