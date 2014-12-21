EAPI="5"

inherit git-2 autotools

EGIT_REPO_URI="git://github.com/Lekensteyn/ssh-blocker.git"
DESCRIPTION=" Block IP addresses based on SSH logs."
HOMEPAGE="https://github.com/Lekensteyn/ssh-blocker"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="net-firewall/ipset"

DEPEND="${RDEPEND}"

src_prepare() {
	eautoreconf --install --force
}
