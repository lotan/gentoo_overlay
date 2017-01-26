# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/games-arcade/ultrastar-deluxe/ultrastar-deluxe-1.1.0.ebuild,v 1.1 2008/07/04 08:41:32 frostwork Exp $

EAPI=5

inherit eutils games flag-o-matic git-r3

#ESVN_REPO_URI="svn://svn.code.sf.net/p/ultrastardx/svn/trunk"
#ESVN_REVISION=3088
EGIT_REPO_URI="https://github.com/UltraStar-Deluxe/USDX.git"
#EGIT_COMMIT="d2b3b2e0a78b0e8d93d183bf09d71e58ea58dfcc"

DESCRIPTION="A free and open source karaoke game"
HOMEPAGE="http://ultrastardx.sourceforge.net/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="debug libprojectM"

RDEPEND=">=dev-lang/fpc-3.0.0
   media-libs/libsdl2
   media-libs/sdl2-gfx
   media-libs/sdl2-image
   media-libs/sdl2-mixer
   media-libs/sdl2-net
   media-libs/sdl2-ttf
   libprojectM? ( media-libs/libprojectm )
   >=media-libs/portaudio-19_pre20071207
   >=media-video/ffmpeg-3.0.0
   virtual/opengl
   virtual/glu
   dev-lang/lua"

pkg_setup() {
	filter-ldflags -Wl,--as-needed
}

src_prepare() {
	epatch_user
}

src_configure() {
   egamesconf \
      $(use_with libprojectM) \
	  $(use_enable debug) \
      || die "Configure failed!"
}

src_compile() {
   emake \
   LDFLAGS="" \
   || die "emake failed"
}

src_install() {
   dogamesbin game/ultrastardx

   local datadir="${GAMES_DATADIR}"/${PN}
   insinto "${GAMES_DATADIR}"/${PN}
   doins -r game/plugins game/fonts game/languages game/resources game/sounds game/themes game/visuals || die
   keepdir "${GAMES_DATADIR}"/${PN}/covers
   keepdir "${GAMES_DATADIR}"/${PN}/songs
   doicon icons/ultrastardx-icon_512.png
   make_desktop_entry ${PN} "Ultrastar Deluxe" ultrastardx-icon_512.png
   dodoc README*
   prepgamesdirs
}
