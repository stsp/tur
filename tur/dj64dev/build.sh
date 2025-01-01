TERMUX_PKG_HOMEPAGE=https://github.com/stsp/dj64dev
TERMUX_PKG_DESCRIPTION="development suite that allows to cross-build 64-bit programs for DOS"
TERMUX_PKG_LICENSE="GPL-3.0"
TERMUX_PKG_MAINTAINER="@stsp"
TERMUX_PKG_VERSION="0.5"
TERMUX_PKG_REVISION=99
TERMUX_PKG_SRCURL=git+https://github.com/stsp/dj64dev
TERMUX_PKG_GIT_BRANCH=master
TERMUX_PKG_SETUP_PYTHON=true
TERMUX_PKG_DEPENDS="libelf, pkg-config"
TERMUX_PKG_BUILD_DEPENDS="ctags, ctags-cross, thunk-gen, thunk-gen-cross"
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="
--disable-ncurses
--disable-32bit
"

termux_step_pre_configure() {
	if [[ "$TERMUX_ON_DEVICE_BUILD" == "false" ]]; then
		local _PREFIX_FOR_CTAGS="${TERMUX_PREFIX}/opt/ctags/cross"
		local _PREFIX_FOR_THUNK_GEN="${TERMUX_PREFIX}/opt/thunk-gen/cross"
		export PATH="$PATH:${_PREFIX_FOR_CTAGS}/bin"
		export PKG_CONFIG_PATH="${_PREFIX_FOR_THUNK_GEN}/share/pkgconfig"
	fi

	cd "$TERMUX_PKG_SRCDIR"
	autoreconf -v -i -I m4
}
