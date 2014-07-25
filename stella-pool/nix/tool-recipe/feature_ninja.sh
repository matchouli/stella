if [ ! "$_NINJA_INCLUDED_" == "1" ]; then 
_NINJA_INCLUDED_=1



function __list_ninja() {
	echo "last_release"
}

function __install_ninja() {
	local _VER=$1
	local _DEFAULT_VER="last_release"

	mkdir -p $TOOL_ROOT/ninja

	if [ "$_VER" == "" ]; then
		__install_ninja_$_DEFAULT_VER
	else
		__install_ninja_$_VER
	fi
}
function __feature_ninja() {
	local _VER=$1
	local _DEFAULT_VER="last_release"

	if [ "$_VER" == "" ]; then
		__feature_ninja_$_DEFAULT_VER
	else
		__feature_ninja_$_VER
	fi
}




function __install_ninja_last_release() {
	URL="https://github.com/martine/ninja/archive/release.zip"
	VER="last_release"
	FILE_NAME=ninja-release.zip
	INSTALL_DIR="$TOOL_ROOT/ninja/$VER"

	echo " ** Installing ninja in $INSTALL_DIR"
	echo " ** NEED : python"

	__feature_ninja_last_release
	if [ "$FORCE" ]; then
		TEST_FEATURE=0
		__del_folder $INSTALL_DIR
	fi
	if [ "$TEST_FEATURE" == "0" ]; then
		__download_uncompress "$URL" "$FILE_NAME" "$INSTALL_DIR" "DEST_ERASE STRIP"

		#TODO
		#prerequites python

		cd "$INSTALL_DIR"
		python ./bootstrap.py

		__feature_ninja_last_release
		if [ ! "$TEST_FEATURE" == "0" ]; then
			echo " ** Ninja installed"
			"$TEST_FEATURE/ninja" --version
		else
			echo "** ERROR"
		fi
	else
		echo " ** Already installed"
	fi
}

function __feature_ninja_last_release() {
	TEST_FEATURE=0
	FEATURE_VER=
	FEATURE_PATH=
	if [ -f "$TOOL_ROOT/ninja/last_release/ninja" ]; then
		TEST_FEATURE="$TOOL_ROOT/ninja/last_release"
	fi

	if [ ! "$TEST_FEATURE" == "0" ]; then
		[ "$VERBOSE_MODE" == "0" ] || echo " ** EXTRA FEATURE Detected : ninja in $TEST_FEATURE"
		NINJA_MAKE_CMD="$TEST_FEATURE/./$NINJA_MAKE_CMD"
		NINJA_MAKE_CMD_VERBOSE="$TEST_FEATURE/./$NINJA_MAKE_CMD_VERBOSE"
		NINJA_MAKE_CMD_VERBOSE_ULTRA="$TEST_FEATURE/./$NINJA_MAKE_CMD_VERBOSE_ULTRA"
		FEATURE_PATH="$TEST_FEATURE"
		FEATURE_VER="last_release"
	fi
}


fi