if [ ! "$_LIBTOOL_INCLUDED_" == "1" ]; then 
_LIBTOOL_INCLUDED_=1


function feature_libtool() {
	FEAT_NAME=libtool
	FEAT_LIST_SCHEMA="2_4_2:source"
	FEAT_DEFAULT_VERSION=2_4_2
	FEAT_DEFAULT_ARCH=
	FEAT_DEFAULT_FLAVOUR="source"
}

function feature_libtool_2_4_2() {
	FEAT_VERSION=2_4_2

	FEAT_SOURCE_URL=http://ftp.gnu.org/gnu/libtool/libtool-2.4.2.tar.gz
	FEAT_SOURCE_URL_FILENAME=libtool-2.4.2.tar.gz
	FEAT_SOURCE_CALLBACK=
	FEAT_BINARY_URL=
	FEAT_BINARY_URL_FILENAME=
	FEAT_BINARY_CALLBACK=

	FEAT_DEPENDENCIES=
	FEAT_INSTALL_TEST="$FEAT_INSTALL_ROOT"/bin/libtool
	FEAT_SEARCH_PATH="$FEAT_INSTALL_ROOT"/bin
	FEAT_ENV_CALLBACK=
	
	FEAT_BUNDLE_ITEM=
}

function feature_libtool_install_source() {
	INSTALL_DIR="$FEAT_INSTALL_ROOT"
	SRC_DIR="$STELLA_APP_FEATURE_ROOT/$FEAT_NAME-$FEAT_VERSION-src"
	BUILD_DIR="$STELLA_APP_FEATURE_ROOT/$FEAT_NAME-$FEAT_VERSION-build"
	
	AUTO_INSTALL_FLAG_PREFIX=
	AUTO_INSTALL_FLAG_POSTFIX=

	__auto_install "configure" "libtool" "$FEAT_SOURCE_URL_FILENAME" "$FEAT_SOURCE_URL" "$SRC_DIR" "$BUILD_DIR" "$INSTALL_DIR" "STRIP"
}

fi