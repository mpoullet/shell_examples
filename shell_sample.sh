#!/bin/sh

VERSION=1.0

goto_script_home() {
export SCRIPT_HOME=$(readlink -f $(dirname $0))
cd ${SCRIPT_HOME}
}

parse_command_line() {
while getopts "v" option ; do
case $option in
v ) echo "$(basename $0) ${VERSION}" ;;
esac
done

shift $((OPTIND - 1))
}

main_function() {
goto_script_home
parse_command_line "$@"
}

main_function "$@"
