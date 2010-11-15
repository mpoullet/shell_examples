function _D()
{
 [ "${_DEBUG}" == "on" ] &&  echo "$@"
}

function DEBUG()
{
 [ "${_DEBUG}" == "on" ] &&  $@
}

export -f _D
export -f DEBUG
