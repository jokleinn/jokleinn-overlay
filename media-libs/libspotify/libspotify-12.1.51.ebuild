# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Mopidy's archive of libspotify."
HOMEPAGE="https://github.com/mopidy/libspotify-archive"
SRC_URI="https://github.com/mopidy/libspotify-archive/raw/master/${P}-Linux-x86_64-release.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

QA_PREBUILT="
	usr/lib64/libspotify.so.${PV}
"

src_unpack() {
	unpack ${P}.tar.gz
	# the lazy way
	mv ${WORKDIR}/${P}-Linux-x86_64-release ${WORKDIR}/${P}
}

src_compile() {
	: #noop
}

src_install() {
	dodir usr/include/libspotify
	insinto /usr/include/libspotify
	doins include/libspotify/api.h
	into /usr
	dolib.so lib/libspotify.so.${PV}
	dosym libspotify.so.${PV} usr/lib64/libspotify.so.12
	dosym libspotify.so.12 usr/lib64/libspotify.so

	insinto /usr/lib64/pkgconfig
	doins lib/pkgconfig/libspotify.pc
}
