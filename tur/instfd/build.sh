TERMUX_PKG_HOMEPAGE=https://github.com/dosemu2/install-freedos
TERMUX_PKG_DESCRIPTION="FreeDOS installed for dosemu2"
TERMUX_PKG_LICENSE="GPL-3.0"
TERMUX_PKG_MAINTAINER="@stsp"
TERMUX_PKG_VERSION=0.3
TERMUX_PKG_REVISION=99
TERMUX_PKG_SRCURL=git+https://github.com/dosemu2/install-freedos
TERMUX_PKG_GIT_BRANCH=master
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_DEPENDS="python"
TERMUX_PKG_PYTHON_TARGET_DEPS="tqdm"

termux_step_make_install() {
	make -C $TERMUX_PKG_SRCDIR install
}
