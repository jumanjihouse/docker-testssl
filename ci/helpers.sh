# shellcheck shell=bash

# Defaults.
verbosity=1

# Helper functions.
err() {
  echo ERROR: "$*" >&2
}

info() {
  if [[ ${verbosity} -ge 1 ]]; then
    echo INFO: "$*" >&2
  fi
}

warn() {
  if [[ ${verbosity} -ge 1 ]]; then
    echo WARN: "$*" >&2
  fi
}

debug() {
  if [[ ${verbosity} -ge 2 ]]; then
    echo DEBUG: "$*" >&2
  fi
}

finish() {
  local _code=$?
  readonly _code

  if [ ${_code} -eq 0 ]; then
    info "$0" OK
  else
    err "$0" failed with exit code ${_code}
    exit ${_code}
  fi
}

handle_err() {
  local RC=$?

  # $BASH_COMMAND contains the command that was being executed at the time of the trap
  # ${BASH_LINENO[0]} contains the line number in the script of that command
  err "${RC} from \"${BASH_COMMAND}\" on line ${BASH_LINENO[0]}"

  exit ${RC}
}

is_ci() {
  # Are we running in hands-free CI?
  [[ -n "${CIRCLECI:-}" ]]
}

# Traps.
# NOTE: In POSIX, beside signals, only EXIT is valid as an event.
#       You must use bash to use ERR.
trap finish EXIT
trap handle_err ERR
