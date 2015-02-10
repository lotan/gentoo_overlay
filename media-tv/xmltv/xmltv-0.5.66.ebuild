# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-tv/xmltv/xmltv-0.5.55.ebuild,v 1.6 2012/12/05 11:38:47 grobian Exp $

EAPI=5

inherit eutils perl-module

DESCRIPTION="Set of utilities to manage TV listings stored in the XMLTV format."
HOMEPAGE="http://membled.com/work/apps/xmltv/"
SRC_URI="mirror://sourceforge/xmltv/${P}.tar.bz2"

IUSE="ar ch dtv_la uk_rt uk_bleb uk_atlas uk_tvguide is it it_dvb na_dd fi fi_sv il es_laguiatv nl huro dk_dr se_swedb hr no_gfeed eu_egon se_tvzon fr fr_kazer pt pt_meo za eu_epgdata tv_combiner tv_check tv_pick_cgi na_dtv tr na_tvmedia"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86 ~x86-linux"
PREFIX="/usr"

# NOTE: you can customize the xmltv installation by
#       defining USE FLAGS (custom ones in
#	/etc/portage/package.use for example).
#
#	Do "equery u media-tv/xmltv" for the complete
#	list of the flags you can set, with description.

# EXAMPLES:
# enable just North American grabber
#  in /etc/portage/package.use : media-tv/xmltv na_dd
#
# enable graphical front-end, Italy grabber
#  in /etc/portage/package.use : media-tv/xmltv tv_check it

RDEPEND=">=dev-perl/libwww-perl-5.65
	>=dev-perl/XML-Parser-2.34
	>=dev-perl/XML-Twig-3.10
	>=dev-perl/DateManip-5.42
	>=dev-perl/XML-Writer-0.6
	virtual/perl-Memoize
	virtual/perl-Storable
	>=dev-perl/Lingua-Preferred-0.2.4
	>=dev-perl/Term-ProgressBar-2.03
	virtual/perl-IO-Compress
	dev-perl/Unicode-String
	dev-perl/TermReadKey
	dev-perl/File-Slurp
	>=dev-lang/perl-5.6.1
	dev-perl/XML-LibXML
	dev-perl/DateTime"

DEPEND="${RDEPEND}
	fi? ( dev-perl/HTML-Tree )
	fr? ( >=dev-perl/HTML-Parser-3.34 dev-perl/HTML-Tree )
	huro? ( dev-perl/HTML-Tree )
	it? ( dev-perl/XML-Simple )
	is? ( dev-perl/XML-LibXSLT )
	na_dd? ( dev-perl/SOAP-Lite dev-perl/TermReadKey )
	no_gfeed? ( dev-perl/HTTP-Cache-Transparent dev-perl/IO-stringy dev-perl/XML-LibXML )
	pt? ( dev-perl/HTML-Tree dev-perl/Unicode-UTF8simple )
	eu_epgdata? ( dev-perl/Archive-Zip )
	se_swedb? ( dev-perl/HTTP-Cache-Transparent dev-perl/IO-stringy dev-perl/XML-LibXML )
	hr? ( dev-perl/HTTP-Cache-Transparent dev-perl/IO-stringy dev-perl/XML-LibXML )
	uk_rt? ( dev-perl/HTTP-Cache-Transparent dev-perl/IO-stringy )
	uk_bleb? ( dev-perl/Archive-Zip dev-perl/IO-stringy )
	tv_combiner? ( dev-perl/XML-LibXML )
	tv_check? ( dev-perl/perl-tk dev-perl/Tk-TableMatrix )
	tv_pick_cgi? ( virtual/perl-CGI dev-perl/Lingua-EN-Numbers-Ordinate )
	na_dtv? ( >=dev-perl/WWW-Mechanize-1.02 dev-perl/TimeDate dev-perl/IO-stringy dev-perl/XML-LibXML )
	"
make_config() {
    # Never except default configuration
    echo "no"

    # Enable Agentina
    use ar && echo "yes" || echo "no"
    # Enable Switzerland
    use ch && echo "yes" || echo "no"
    # Enable Latin America & Caribbean
    use dtv_la && echo "yes" || echo "no"
    # Enable UK and Ireland (Radio Times)
    use uk_rt && echo "yes" || echo "no"
    # Enable fast alternative grabber for the UK
    use uk_bleb && echo "yes" || echo "no"
    # Enable UK and Ireland using Atlas database
    use uk_atlas && echo "yes" || echo "no"
    # Enable UK and Ireland using TV Guide website
    use uk_tvguide && echo "yes" || echo "no"
    #Enable Iceland
    use is && echo "yes" || echo "no"
    # Enable Italy
    use it && echo "yes" || echo "no"
    # Enable Italy from DVB-S stream
    use it_dvb && echo "yes" || echo "no"
    # Enable North America using DataDirect
    use na_dd && echo "yes" || echo "no"
    # Enable Finland
    use fi  && echo "yes" || echo "no"
    # Enable Finland (Swedish)
    use fi_sv  && echo "yes" || echo "no"
    # Israel
    use il && echo "yes" || echo "no"
    # Enable Spain
    use es_laguiatv && echo "yes" || echo "no"
    # Enable Netherlands
    use nl  && echo "yes" || echo "no"
    # Enable Hungary, Romania, Slovakia, Czech Republic
    use huro  && echo "yes" || echo "no"
    # Enable Denmark (dr.dk)
    use dk_dr && echo "yes" || echo "no"
    # Enable Sweden
    use se_swedb  && echo "yes" || echo "no"
    # Enable Croatia
    use hr && echo "yes" || echo "no"
    # Enable Norway (gfeed.info)
    use no_gfeed && echo "yes" || echo "no"
    # Enable german speaking area (Egon zappt)
    use eu_egon && echo "yes" || echo "no"
    # Enable Sweden (tvzon.se)
    use se_tvzon && echo "yes" || echo "no"
    # Enable France
    use fr  && echo "yes" || echo "no"
    # Enable France (Kazer)
    use fr_kazer  && echo "yes" || echo "no"
    # Enable Portugal
    use pt  && echo "yes" || echo "no"
    # Enable Portugal (MEO)
    use pt_meo  && echo "yes" || echo "no"
    # Enable South Africa
    use za  && echo "yes" || echo "no"
    # Enable some European countries (epgdata.com)
    use eu_epgdata && echo "yes" || echo "no"
    # Enable combiner
    use tv_combiner && echo "yes" || echo "no"
    # Enable GUI checking.
    use tv_check && echo "yes" || echo "no"
    # Enable CGI support
    use tv_pick_cgi && echo "yes" || echo "no"
    # Enable North America (DirecTV)
    use na_dtv && echo "yes" || echo "no"
    # Enable Turkey (Digiturk)
    use tr && echo "yes" || echo "no"
    # Enable North America (TVMedia)
    use na_tvmedia && echo "yes" || echo "no"
}

src_unpack() {
	unpack ${A}
	cd "${S}"
}

src_configure() {
	sed -i "s:\$VERSION = '${PV}':\$VERSION = '${PVR}':" Makefile.PL || die

	# latest per-module eclass seems to not allow a real use of pm_echovar,
	# so instead of the default method below we're forced to skip perl-module_src_compile
	pm_echovar=$(make_config)
	perl-module_src_configure || die "error configuring"
}

src_compile() {
	perl-module_src_compile || die "error compiling"
	#make_config | perl Makefile.PL || die "error configuring"
	#make || die "error compiling"
}

src_install() {
	# actually make test should be unneede, but if non na grabbers
	# start to not install remove comment below
	#make test
	#make

	# to bypass build issue
	#make DESTDIR=${D} install || die "error installing"

	perl-module_src_install || die "error installing"

	for i in `grep -rl "${D}" "${D}"` ; do
		sed -e "s:${D}::g" -i "${i}"
	done

	if use tv_pick_cgi ; then
		dobin choose/tv_pick/tv_pick_cgi || die "error creating tv_pick_cgi"
	fi
}

pkg_postinst() {
	if use tv_pick_cgi ; then
		elog "To use tv_pick_cgi, please link it from /usr/bin/tv_pick_cgi"
		elog "to where the ScriptAlias directive is configured."
	fi
}
