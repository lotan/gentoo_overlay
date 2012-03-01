# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-plugins/banshee-community-extensions/banshee-community-extensions-2.0.0.ebuild,v 1.3 2011/04/27 20:28:49 angelos Exp $

EAPI="3"

inherit base mono git autotools

DESCRIPTION="Community-developed plugins for the Banshee media player"
HOMEPAGE="http://banshee.fm/"
SRC_URI=""

EGIT_REPO_URI="git://gitorious.org/banshee-community-extensions/banshee-community-extensions.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="-*"
IUSE="doc lastfmfingerprint lirc lyrics mirage telepathy"

DEPEND=">=dev-lang/mono-2.0
	>=media-sound/banshee-1.9.6[web]
	>=gnome-base/gconf-2.0
	dev-dotnet/gconf-sharp:2
	doc? ( >=app-text/gnome-doc-utils-0.17.3 )
	lastfmfingerprint? (
		sci-libs/fftw:3.0
		media-libs/libsamplerate
	)
	lirc? ( app-misc/lirc  )
	mirage? (
		dev-libs/glib:2
		dev-db/sqlite:3
		sci-libs/fftw:3.0
		media-libs/libsamplerate
		>=media-libs/gstreamer-0.10.15:0.10
		>=media-libs/gst-plugins-base-0.10.15:0.10
	)
	telepathy? (
		dev-dotnet/notify-sharp
		>=dev-lang/mono-2.4.2
	)"
RDEPEND="${DEPEND}
	!media-plugins/banshee-lyrics
	!media-plugins/banshee-mirage"

src_prepare() {
	ebegin "Running intltoolize --force --copy"
	intltoolize --force --copy
	eend $?
	
	eautoreconf
}

src_configure() {
	# Disable ClutterFlow as we don't have clutter-sharp and co in tree
	# Disable UbuntuOneMusicStore as we don't have ubuntuone-sharp
	# Disable AppIndicator as it's not in tree
	# Disable OpenVP as some of its dependencies are not in the tree
	# Disable SoundMenu as it requires indicate-sharp
	# Disable zeitgeistdataprovider as it requires zeitgeist-sharp
	local myconf="--enable-gnome --disable-static --enable-release
		--with-gconf-schema-file-dir=/etc/gconf/schemas
		--with-vendor-build-id=Gentoo/${PN}/${PVR}
		--disable-scrollkeeper --disable-clutterflow
		--disable-appindicator --disable-openvp --enable-ampache
		--enable-karaoke --enable-jamendo
		--disable-zeitgeistdataprovider --enable-randombylastfm"

	econf \
		$(use_enable doc user-help) \
		$(use_enable lastfmfingerprint) \
		$(use_enable lirc) \
		$(use_enable lyrics) \
		$(use_enable mirage) \
		$(use_enable telepathy) \
		$(use_enable test tests) \
		${myconf}
}

src_install() {
	base_src_install
	find "${ED}" -name "*.la" -delete || die "remove of la files failed"
	dodoc AUTHORS NEWS README || die
}
