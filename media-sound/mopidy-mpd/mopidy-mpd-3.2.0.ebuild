# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_SETUPTOOLS=rdepend
PYTHON_COMPAT=( python3_{8,9} )

inherit distutils-r1

DESCRIPTION="A Mopidy extension to connect to Spotify."
HOMEPAGE="https://mopidy.com/"
SRC_URI="https://github.com/mopidy/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

KEYWORDS="~amd64"
LICENSE="Apache-2.0"
SLOT="0"

RDEPEND="
	media-sound/mopidy
	dev-python/pykka
	dev-python/pygobject
"

DEPEND="
	${RDEPEND}
"

distutils_enable_tests pytest
