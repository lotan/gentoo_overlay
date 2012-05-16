EAPI="2"

inherit eutils git-2 autotools

EGIT_REPO_URI="git://github.com/signal11/hidapi.git"
DESCRIPTION="A Simple library for communicating with USB and Bluetooth HID
devices on Linux, Mac, and Windows."
HOMEPAGE="https://github.com/signal11/hidapi"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=""
DEPEND=""

src_prepare() {
	epatch "${FILESDIR}"/fix_makefile.patch
}

src_compile() {
	cd "${S}"/linux
	if [ -f Makefile ] || [ -f GNUmakefile ] || [ -f makefile ];
	then
		emake || die "emake failed"
	fi
	mv libhidapi-hidraw.so libhidapi-hidraw.so.0

	cd "${S}"/libusb
	if [ -f Makefile ] || [ -f GNUmakefile ] || [ -f makefile ];
	then
		emake || die "emake failed"
	fi
	mv libhidapi-libusb.so libhidapi-libusb.so.0
}

src_install() {
	insinto /usr/include
	doins "${S}"/hidapi/hidapi.h || die

	dolib.so "${S}"/linux/libhidapi-hidraw.so.0
	dosym libhidapi-hidraw.so.0 /usr/$(get_libdir)/libhidapi-hidraw.so

	dolib.so "${S}"/libusb/libhidapi-libusb.so.0
	dosym libhidapi-libusb.so.0 /usr/$(get_libdir)/libhidapi-libusb.so
}
