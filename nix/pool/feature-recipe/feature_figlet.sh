if [ ! "$_FIGLET_INCLUDED_" == "1" ]; then 
_FIGLET_INCLUDED_=1


feature_figlet() {
	FEAT_NAME=figlet
	FEAT_LIST_SCHEMA="2_2_5:source"
	FEAT_DEFAULT_VERSION=2_2_5
	FEAT_DEFAULT_ARCH=
	FEAT_DEFAULT_FLAVOUR="source"
}

feature_figlet_2_2_5() {
	FEAT_VERSION=2_2_5
	
	FEAT_SOURCE_DEPENDENCIES=
	FEAT_BINARY_DEPENDENCIES=

	FEAT_SOURCE_URL=https://github.com/cmatsuoka/figlet/archive/2.2.5.tar.gz
	FEAT_SOURCE_URL_FILENAME=figlet-2.2.5.tar.gz
	FEAT_SOURCE_URL_PROTOCOL=HTTP_ZIP
	
	FEAT_BINARY_URL=
	FEAT_BINARY_URL_FILENAME=
	FEAT_BINARY_URL_PROTOCOL=

	FEAT_SOURCE_CALLBACK=
	FEAT_BINARY_CALLBACK=
	FEAT_ENV_CALLBACK=

	FEAT_INSTALL_TEST="$FEAT_INSTALL_ROOT"/bin/figlet
	FEAT_SEARCH_PATH="$FEAT_INSTALL_ROOT"/bin

}


feature_figlet_install_source() {
	INSTALL_DIR="$FEAT_INSTALL_ROOT"
	SRC_DIR="$STELLA_APP_FEATURE_ROOT/$FEAT_NAME-$FEAT_VERSION-src"
	
	__set_toolset "STANDARD"

	__get_resource "$FEAT_NAME" "$FEAT_SOURCE_URL" "$FEAT_SOURCE_URL_PROTOCOL" "$SRC_DIR" "DEST_ERASE STRIP FORCE_NAME $FEAT_SOURCE_URL_FILENAME"

	AUTO_INSTALL_CONF_FLAG_PREFIX=
	AUTO_INSTALL_CONF_FLAG_POSTFIX=
	AUTO_INSTALL_BUILD_FLAG_PREFIX=
	AUTO_INSTALL_BUILD_FLAG_POSTFIX=


	__auto_build "$FEAT_NAME" "$SRC_DIR" "$INSTALL_DIR" "NO_CONFIG"


}



fi