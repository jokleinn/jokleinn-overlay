# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8,9} )

DISTUTILS_USE_SETUPTOOLS=rdepend

inherit distutils-r1

IUSE="daemon"

DESCRIPTION="An extensible music server written in Python."
HOMEPAGE="https://mopidy.com/"
SRC_URI="https://github.com/mopidy/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

KEYWORDS="~amd64"
LICENSE="Apache-2.0"
SLOT="0"

RDEPEND="
	dev-python/gst-python[${PYTHON_USEDEP}]
	media-plugins/gst-plugins-meta[mp3,ogg,flac]
	dev-python/pykka[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	www-servers/tornado[${PYTHON_USEDEP}]
	daemon? ( acct-user/mopidy acct-group/mopidy )
"

DEPEND="
	${RDEPEND}

	test? (
		dev-python/responses[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

python_install() {
	distutils-r1_python_install
	if use daemon ; then
		newconfd "${FILESDIR}/mopidy.conf-d" mopidy
		newinitd "${FILESDIR}/mopidy.init-d" mopidy
		keepdir /var/mopidy
		dodir /etc/mopidy
		insinto /etc/mopidy
		newins mopidy/config/default.conf mopidy.conf
		fowners mopidy:mopidy /etc/mopidy/mopidy.conf
		fperms 600 /etc/mopidy/mopidy.conf
	fi
}

python_test() {
	# Ignore broken tests (due to network-sandbox)
	pytest -v --ignore tests/stream/test_playback.py || die
}
