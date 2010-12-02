function _D()
{
[ "${_DEBUG}" == "on" ] &&  echo "$@"
}

function DEBUG()
{
[ "${_DEBUG}" == "on" ] &&  $@
}

function _DP() {
if [ "${_DEBUG}" == "on" ]; then
	while [ -n "$1" ]; do
		echo "Parameter: $1"
		shift
	done
fi
}

export -f _D
export -f DEBUG
export -f _DP
