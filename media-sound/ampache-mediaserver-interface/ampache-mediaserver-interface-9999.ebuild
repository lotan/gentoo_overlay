EAPI="5"

inherit git-2 autotools

DESCRIPTION="Bridge between Ampache and DBus MediaServer client like Rygel."
HOMEPAGE="https://github.com/lotan/ampache-mediaserver-interface"

EGIT_REPO_URI="https://github.com/lotan/ampache-mediaserver-interface.git"

LICENSE="GPL-2"
KEYWORDS="~amd64 ~x86"
SLOT="0"
IUSE=""

RDEPEND=""
DEPEND="dev-lang/vala"

src_prepare() {
	eautoreconf --install --force
}
