# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_SETUPTOOLS=rdepend
PYTHON_COMPAT=( python3_8 python3_9 python3_10 )

inherit distutils-r1

DESCRIPTION="A python interface to Spotify's onlne music streaming service."
HOMEPAGE="https://github.com/jodal/pyspotify"
SRC_URI="https://github.com/jodal/pyspotify/archive/v${PV}.tar.gz -> ${P}.tar.gz"

IUSE="librespot"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-python/cffi
	librespot? ( media-libs/librespot )
	!librespot? ( media-libs/libspotify )
"
RDEPEND="${DEPEND}"
BDEPEND=""

distutils_enable_tests pytest
