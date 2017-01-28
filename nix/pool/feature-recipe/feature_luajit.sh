if [ ! "$_luajit_INCLUDED_" == "1" ]; then 
_luajit_INCLUDED_=1

# NOTE : Do not need lua

feature_luajit() {
	FEAT_NAME=luajit
	FEAT_LIST_SCHEMA="2_0_4:source"
	FEAT_DEFAULT_VERSION=2_0_4
	FEAT_DEFAULT_ARCH=
	FEAT_DEFAULT_FLAVOUR="source"
}

feature_luajit_2_0_4() {
	FEAT_VERSION=2_0_4


	FEAT_SOURCE_DEPENDENCIES=
	FEAT_BINARY_DEPENDENCIES=

	FEAT_SOURCE_URL=http://luajit.org/download/LuaJIT-2.0.4.tar.gz
	FEAT_SOURCE_URL_FILENAME=LuaJIT-2.0.4.tar.gz
	FEAT_SOURCE_URL_PROTOCOL=HTTP_ZIP

	FEAT_BINARY_URL=
	FEAT_BINARY_URL_FILENAME=
	FEAT_BINARY_URL_PROTOCOL=

	FEAT_SOURCE_CALLBACK=
	FEAT_BINARY_CALLBACK=
	FEAT_ENV_CALLBACK=

	FEAT_INSTALL_TEST="$FEAT_INSTALL_ROOT"/bin/luajit
	FEAT_SEARCH_PATH="$FEAT_INSTALL_ROOT"/bin

}



feature_luajit_install_source() {
	INSTALL_DIR="$FEAT_INSTALL_ROOT"
	SRC_DIR="$STELLA_APP_FEATURE_ROOT/$FEAT_NAME-$FEAT_VERSION-src"
	
	__get_resource "$FEAT_NAME" "$FEAT_SOURCE_URL" "$FEAT_SOURCE_URL_PROTOCOL" "$SRC_DIR" "DEST_ERASE STRIP"

	__set_toolset "STANDARD"

	__auto_build "$FEAT_NAME" "$SRC_DIR" "$INSTALL_DIR" "NO_CONFIG"
	
}


fi
