#!/bin/sh
VERSION=1.0
PROJECTION=""

# Google's URL shortener API documentation:
# http://code.google.com/intl/de-DE/apis/urlshortener/v1/getting_started.html

# API key from Google's console API:
# https://code.google.com/apis/console/b/0/#project:977507411585

googl() {
GOOGLE_URL_SHORTENER="https://www.googleapis.com/urlshortener/v1/url"
API_KEY="AIzaSyDg3gsvG8x1Kh-6N4BUegSddYgxUdHXF-0"
SHORTENED_URL=$(echo $1 | sed -ne '/http:\/\/goo.gl/p')

if [ -n "${SHORTENED_URL}" ]; then
curl "${GOOGLE_URL_SHORTENER}?key=${API_KEY}&shortUrl=${SHORTENED_URL}&${PROJECTION}"
else
curl "${GOOGLE_URL_SHORTENER}?key=${API_KEY}" -H 'Content-Type: application/json' -d "{\"longUrl\": \"$1\"}"
fi
}

goto_script_home() {
SCRIPT_HOME=$(readlink -f $(dirname $0))
cd ${SCRIPT_HOME}
}

parse_command_line() {
while getopts ":ahv-:" option ; do
	if [ "${option}" = "-" ]; then
		case ${OPTARG} in
		help ) option=h ;;
		version ) option=v ;;
		analytics ) option=a ;;
		* ) echo "Unknown option ${OPTARG}" ;;
		esac
	fi
	case $option in
		h ) print_usage && exit;;
		v ) echo "${SCRIPT_NAME} ${VERSION}" && exit;;
		a ) PROJECTION="projection=FULL" ;;
		? ) echo "Unknown option" ;;
	esac
done
}

print_usage() {
echo "Usage: ${SCRIPT_NAME} [option...] URL"
echo "Options :"
echo "-a --analytics : Look up at URL's analytics"
echo "-v --version : Version nummer"
echo "-h --help : Print usage"
}

main_function() {
SCRIPT_NAME="$(basename $0)"
goto_script_home
parse_command_line "$@"
shift $((OPTIND - 1))
googl "$@"
}

main_function "$@"
