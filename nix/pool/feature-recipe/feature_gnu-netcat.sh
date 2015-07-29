if [ ! "$_GNUNETCAT_INCLUDED_" == "1" ]; then 
_GNUNETCAT_INCLUDED_=1



function feature_gnu-netcat() {
	FEAT_NAME=gnu-netcat
	FEAT_LIST_SCHEMA="0_7_1:source"
	FEAT_DEFAULT_VERSION=0_7_1
	FEAT_DEFAULT_ARCH=
	FEAT_DEFAULT_FLAVOUR="source"
}

function feature_gnu-netcat_0_7_1() {
	FEAT_VERSION=0_7_1

	FEAT_SOURCE_DEPENDENCIES=
	FEAT_BINARY_DEPENDENCIES=

	FEAT_SOURCE_URL=http:/:sourceforge.net/projects/netcat/files/netcat/0.7.1/netcat-0.7.1.tar.gz
	FEAT_SOURCE_URL_FILENAME=netcat-0.7.1.tar.gz
	FEAT_SOURCE_URL_PROTOCOL=HTTP_ZIP

	FEAT_BINARY_URL=
	FEAT_BINARY_URL_FILENAME=
	FEAT_BINARY_URL_PROTOCOL=

	FEAT_SOURCE_CALLBACK=
	FEAT_BINARY_CALLBACK=
	FEAT_ENV_CALLBACK=

	FEAT_INSTALL_TEST="$FEAT_INSTALL_ROOT"/bin/netcat
	FEAT_SEARCH_PATH="$FEAT_INSTALL_ROOT"/bin
}



function feature_gnu-netcat_install_source() {
	INSTALL_DIR="$FEAT_INSTALL_ROOT"
	SRC_DIR="$STELLA_APP_FEATURE_ROOT/$FEAT_NAME-$FEAT_VERSION-src"
	
	AUTO_INSTALL_CONF_FLAG_PREFIX=
	AUTO_INSTALL_CONF_FLAG_POSTFIX=
	AUTO_INSTALL_BUILD_FLAG_PREFIX=
	AUTO_INSTALL_BUILD_FLAG_POSTFIX=

	__auto_install "gnu-netcat" "$FEAT_SOURCE_URL_FILENAME" "$FEAT_SOURCE_URL" "$FEAT_SOURCE_URL_PROTOCOL" "$SRC_DIR" "$INSTALL_DIR" "CONF_TOOL configure BUILD_TOOL make"

}


fi