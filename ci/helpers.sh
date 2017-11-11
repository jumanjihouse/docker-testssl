# Defaults.
verbosity=1

# Helper functions.
error() {
  echo ERROR: $* >&2
}

info() {
  if [[ ${verbosity} -ge 1 ]]; then
    echo INFO: $* >&2
  fi
}

debug() {
  if [[ ${verbosity} -ge 2 ]]; then
    echo DEBUG: $* >&2
  fi
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

# Traps.
trap finish EXIT
