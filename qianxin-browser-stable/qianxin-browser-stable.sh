#!/bin/bash
set -o pipefail
_APPDIR="/usr/lib/@appname@"
_RUNNAME="${_APPDIR}/@runname@"
export PATH="${_APPDIR}:${PATH}"
export LD_LIBRARY_PATH="${_APPDIR}/lib:${LD_LIBRARY_PATH}"
export CHROME_VERSION_EXTRA="stable"
export GNOME_DISABLE_CRASH_DIALOG=SET_BY_GOOGLE_CHROME
exec < /dev/null
exec > >(exec cat)
exec 2> >(exec cat >&2)
cd "${_APPDIR}" || { echo "Failed to change directory to ${_APPDIR}"; exit 1; }
exec -a "$0" "${_APPDIR}/@runname@" "$@" || exit $?