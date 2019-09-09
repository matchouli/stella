if [ ! "$_datamash_INCLUDED_" = "1" ]; then
_datamash_INCLUDED_=1


feature_datamash() {
	FEAT_NAME=datamash
	FEAT_LIST_SCHEMA="1_3:source"
	FEAT_DEFAULT_ARCH=
	FEAT_DEFAULT_FLAVOUR="source"
	
	FEAT_DESC="GNU datamash is a command-line program which performs basic numeric, textual and statistical operations on input textual data files."
	FEAT_LINK="https://www.gnu.org/software/datamash/"
}


feature_datamash_1_3() {
	FEAT_VERSION=1_3
	FEAT_SOURCE_DEPENDENCIES=
	FEAT_BINARY_DEPENDENCIES=

	FEAT_SOURCE_URL=http://ftp.gnu.org/gnu/datamash/datamash-1.3.tar.gz
	FEAT_SOURCE_URL_FILENAME=datamash-v1.3.tar.gz
	FEAT_SOURCE_URL_PROTOCOL=HTTP_ZIP

	FEAT_BINARY_URL=
	FEAT_BINARY_URL_FILENAME=
	FEAT_BINARY_URL_PROTOCOL=

	FEAT_SOURCE_CALLBACK=
	FEAT_BINARY_CALLBACK=
	FEAT_ENV_CALLBACK=

	FEAT_INSTALL_TEST="$FEAT_INSTALL_ROOT"/bin/datamash
	FEAT_SEARCH_PATH="$FEAT_INSTALL_ROOT"/bin

}


feature_datamash_install_source() {
	INSTALL_DIR="$FEAT_INSTALL_ROOT"
	SRC_DIR="$STELLA_APP_FEATURE_ROOT/$FEAT_NAME-$FEAT_VERSION-src"

	__set_toolset "STANDARD"


	__get_resource "$FEAT_NAME" "$FEAT_SOURCE_URL" "$FEAT_SOURCE_URL_PROTOCOL" "$SRC_DIR" "DEST_ERASE STRIP"

	__auto_build "$FEAT_NAME" "$SRC_DIR" "$INSTALL_DIR"

}



fi
