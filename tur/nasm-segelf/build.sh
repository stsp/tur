TERMUX_PKG_HOMEPAGE=https://github.com/stsp/nasm-segelf
TERMUX_PKG_DESCRIPTION="nasm fork with segelf patches"
TERMUX_PKG_LICENSE="BSD 2-Clause"
TERMUX_PKG_MAINTAINER="@stsp"
TERMUX_PKG_VERSION="2.16.01-4"
TERMUX_PKG_REVISION=99
TERMUX_PKG_SRCURL=git+https://github.com/stsp/nasm-segelf
TERMUX_PKG_GIT_BRANCH=master
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_UPDATE_VERSION_SED_REGEXP="s/nasm-segelf-//g"
TERMUX_PKG_HOSTBUILD=true

termux_step_host_build() {
	local _PREFIX_FOR_BUILD=${TERMUX_PREFIX}/opt/$TERMUX_PKG_NAME/cross
	cd $TERMUX_PKG_HOSTBUILD_DIR
	$TERMUX_PKG_SRCDIR/configure prefix=$_PREFIX_FOR_BUILD
	# not supporting parallel build
	make
	make install
}
