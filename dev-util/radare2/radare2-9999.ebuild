# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-util/radare2/radare2-9999.ebuild,v 2.0 2012/04/04 06:20:21 akochkov Exp $

EAPI="4"
inherit base eutils mercurial

DESCRIPTION="Advanced command line hexadecimal editor and more"
HOMEPAGE="http://www.radare.org"
EHG_REPO_URI="http://radare.org/hg/radare2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="ssl gmp debug"

RDEPEND="ssl? ( dev-libs/openssl ) /
		gmp? (dev-libs/gmp ) /
		"
DEPEND="${RDEPEND}
	dev-util/pkgconfig"

src_prepare() {
	base_src_prepare
}

src_configure() {
	econf $(use_with ssl) $(use_with gmp) $(use_with debug)
}

src_compile() {
	emake -j1 || die "compile failed"
}

src_install() {
	emake DESTDIR="${ED}" INSTALL_PROGRAM="install" install || die "install failed"
}
