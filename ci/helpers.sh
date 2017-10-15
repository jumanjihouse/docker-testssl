error() {
  {
    echo
    echo ERROR: $*
    echo
  } >&2
}

info() {
  {
    echo
    echo INFO: $*
    echo
  } >&2
}

finish() {
  _code=$?

  if [ ${_code} -eq 0 ]; then
    info $0 OK
  else
    error $0 failed with exit code ${_code}
    exit ${_code}
  fi
}

trap finish EXIT
