# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit acct-user

DESCRIPTION="User for the mopidy daemon"
ACCT_USER_ID=736
ACCT_USER_HOME=/var/mopidy
ACCT_USER_GROUPS=( mopidy audio )

acct-user_add_deps
