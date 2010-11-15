#!/bin/sh

VERSION=1.0

load_helper_functions() {
source ${SCRIPT_HOME}/include/debug.sh
}

goto_script_home() {
SCRIPT_HOME=$(readlink -f $(dirname $0))
cd ${SCRIPT_HOME}
}

parse_command_line() {
while getopts ":hv-:" option ; do
	if [ "${option}" = "-" ]; then
		case ${OPTARG} in
		help ) option=h ;;
		version ) option=v ;;
		* ) echo "Unknown option ${OPTARG}" ;;
		esac
	fi
	case $option in
		h ) print_usage ;;
		v ) echo "${SCRIPT_NAME} ${VERSION}" ;;
		? ) echo "Unknown option" ;;
	esac
done

shift $((OPTIND - 1))
}

print_usage() {
echo "Usage: ${SCRIPT_NAME} [option...]"
echo "Options :"
echo "-v --version : Version nummer"
echo "-h --help : Print usage"
}

main_function() {
SCRIPT_NAME="$(basename $0)"
goto_script_home
load_helper_functions
_D "SCRIPT_NAME=${SCRIPT_NAME}"
_D "SCRIPT_HOME=${SCRIPT_HOME}"
parse_command_line "$@"
}

main_function "$@"
