if [ ! "$_xzutils_INCLUDED_" == "1" ]; then 
_xzutils_INCLUDED_=1


feature_xzutils() {
	FEAT_NAME=xzutils
	FEAT_LIST_SCHEMA="5_2_1:source"
	FEAT_DEFAULT_VERSION=5_2_1
	FEAT_DEFAULT_ARCH=
	FEAT_DEFAULT_FLAVOUR="source"
}

feature_xzutils_5_2_1() {
	FEAT_VERSION=5_2_1


	FEAT_SOURCE_DEPENDENCIES=
	FEAT_BINARY_DEPENDENCIES=

	FEAT_SOURCE_URL=http://tukaani.org/xz/xz-5.2.1.tar.gz
	FEAT_SOURCE_URL_FILENAME=xz-5.2.1.tar.gz
	FEAT_SOURCE_URL_PROTOCOL=HTTP_ZIP

	FEAT_BINARY_URL=
	FEAT_BINARY_URL_FILENAME=
	FEAT_BINARY_URL_PROTOCOL=

	FEAT_SOURCE_CALLBACK=
	FEAT_BINARY_CALLBACK=
	FEAT_ENV_CALLBACK=

	FEAT_INSTALL_TEST="$FEAT_INSTALL_ROOT"/lib/liblzma.a
	FEAT_SEARCH_PATH="$FEAT_INSTALL_ROOT"/bin

}



feature_xzutils_install_source() {
	INSTALL_DIR="$FEAT_INSTALL_ROOT"
	SRC_DIR="$STELLA_APP_FEATURE_ROOT/$FEAT_NAME-$FEAT_VERSION-src"

	__set_toolset "STANDARD"


	__get_resource "$FEAT_NAME" "$FEAT_SOURCE_URL" "$FEAT_SOURCE_URL_PROTOCOL" "$SRC_DIR" "DEST_ERASE STRIP"

	
	
	AUTO_INSTALL_CONF_FLAG_PREFIX=
	AUTO_INSTALL_CONF_FLAG_POSTFIX="--disable-dependency-tracking"
	AUTO_INSTALL_BUILD_FLAG_PREFIX=
	AUTO_INSTALL_BUILD_FLAG_POSTFIX=

	__auto_build "$FEAT_NAME" "$SRC_DIR" "$INSTALL_DIR"


}


fi
