EAPI="2"

inherit eutils git-2 autotools

EGIT_REPO_URI="git://github.com/edorfaus/TEMPered.git"
DESCRIPTION="C library and program for reading the TEMPer family of thermometer
and hygrometer devices."
HOMEPAGE="https://github.com/edorfaus/TEMPered"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="sys-libs/hidapi
         dev-util/cmake"

DEPEND="${RDEPEND}
        app-misc/pax-utils"

src_prepare() {
	epatch "${FILESDIR}"/fix_cmakelist.patch
}

src_compile() {
	cd "${S}"
	if [ -f Makefile ] || [ -f GNUmakefile ] || [ -f makefile ];
	then
		emake || die "emake failed"
	fi
	cd "${S}"/build
	if [ -f Makefile ] || [ -f GNUmakefile ] || [ -f makefile ];
	then
		emake || die "emake failed"
	fi

	# fix run paths
	TMPDIR="${S}" /usr/bin/scanelf -BXr ./utils/tempered -o /dev/null
	TMPDIR="${S}" /usr/bin/scanelf -BXr ./utils/enumerate -o /dev/null
}

src_install() {
	insinto /usr/include
	doins "${S}"/libtempered/tempered.h || die

	dolib.so "${S}"/build/libtempered/libtempered.so.0 || die
	dosym libtempered.so.0 /usr/$(get_libdir)/libtempered.so || die

	dobin "${S}"/build/utils/tempered || die
	dobin "${S}"/build/utils/enumerate || die
	dobin "${S}"/build/utils/hid-query || die
}
