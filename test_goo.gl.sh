#!/bin/sh
URL="http://www.avm.de/"
SURL="http://goo.gl/YxL5"

goto_script_home() {
SCRIPT_HOME=$(readlink -f $(dirname $0))
cd ${SCRIPT_HOME}
}

main_function() {
SCRIPT_NAME="$(basename $0)"
goto_script_home
${SCRIPT_HOME}/goo.gl.sh ${URL}
${SCRIPT_HOME}/goo.gl.sh ${SURL}
${SCRIPT_HOME}/goo.gl.sh -a ${SURL}
}

main_function "$@"
