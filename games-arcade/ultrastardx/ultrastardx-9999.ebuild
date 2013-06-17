# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/games-arcade/ultrastar-deluxe/ultrastar-deluxe-1.1.0.ebuild,v 1.1 2008/07/04 08:41:32 frostwork Exp $

inherit eutils games flag-o-matic subversion

ESVN_REPO_URI="svn://svn.code.sf.net/p/ultrastardx/svn/trunk"

DESCRIPTION="A free and open source karaoke game"
HOMEPAGE="http://ultrastardx.sourceforge.net/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="libprojectM"

RDEPEND="dev-lang/fpc
   media-libs/sdl-image
   media-libs/libsdl
   media-libs/sdl-mixer
   media-libs/sdl-ttf
   libprojectM? ( media-libs/libprojectm )
   >=media-libs/portaudio-19_pre20071207
   media-video/ffmpeg
   virtual/opengl
   virtual/glu
   dev-lang/lua"

src_compile() {
   egamesconf \
      $(use_with libprojectM) \
      --enable-debug \
      || die "Configure failed!"
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
