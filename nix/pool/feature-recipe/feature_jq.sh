if [ ! "$_JQ_INCLUDED_" == "1" ]; then 
_JQ_INCLUDED_=1

function feature_jq() {
	FEAT_NAME=jq
	FEAT_LIST_SCHEMA="1_4@x64:binary 1_4@x86:binary"
	FEAT_DEFAULT_VERSION=1_4
	FEAT_DEFAULT_ARCH=x64
	FEAT_DEFAULT_FLAVOUR="binary"
}

function feature_jq_1_4() {
	FEAT_VERSION=1_4
	FEAT_DEPENDENCIES=

	FEAT_SOURCE_URL=
	FEAT_SOURCE_URL_FILENAME=
	FEAT_SOURCE_URL_PROTOCOL=

	if [ "$STELLA_CURRENT_PLATFORM" == "linux" ]; then
		FEAT_BINARY_URL_x86=http://stedolan.github.io/jq/download/linux32/jq
		FEAT_BINARY_URL_FILENAME_x86=jq-1.4-linux-32
		FEAT_BINARY_URL_PROTOCOL_x86=HTTP
		FEAT_BINARY_URL_x64=http://stedolan.github.io/jq/download/linux64/jq
		FEAT_BINARY_URL_FILENAME_x64=jq-1.4-linux-64
		FEAT_BINARY_URL_PROTOCOL_x64=HTTP
		
	fi
	if [ "$STELLA_CURRENT_PLATFORM" == "darwin" ]; then
		FEAT_BINARY_URL_x86=http://stedolan.github.io/jq/download/osx32/jq
		FEAT_BINARY_URL_FILENAME_x86=jq-1.4-osx-32
		FEAT_BINARY_URL_PROTOCOL_x86=HTTP
		FEAT_BINARY_URL_x64=http://stedolan.github.io/jq/download/osx64/jq
		FEAT_BINARY_URL_FILENAME_x64=jq-1.4-osx-64
		FEAT_BINARY_URL_PROTOCOL_x64=HTTP	
	fi

	FEAT_SOURCE_CALLBACK=
	FEAT_BINARY_CALLBACK=
	FEAT_ENV_CALLBACK=

	FEAT_INSTALL_TEST="$FEAT_INSTALL_ROOT"/jq
	FEAT_SEARCH_PATH="$FEAT_INSTALL_ROOT"
	
}


function feature_jq_install_binary() {
	
	__get_resource "$FEAT_NAME" "$FEAT_BINARY_URL" "$FEAT_BINARY_URL_PROTOCOL" "$FEAT_INSTALL_ROOT" "DEST_ERASE STRIP FORCE_NAME $FEAT_BINARY_URL_FILENAME"

	mv "$FEAT_INSTALL_ROOT/$FEAT_BINARY_URL_FILENAME" "$FEAT_INSTALL_ROOT/jq"
	chmod +x "$FEAT_INSTALL_ROOT/jq"
	
}


fi
