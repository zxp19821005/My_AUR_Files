#!/bin/bash
set -o pipefail
_APPDIR="/usr/lib/@appname@"
_RUNNAME="${_APPDIR}/@runname@"
export PATH="${_APPDIR}:${_APPDIR}/lib:${PATH}"
export LD_LIBRARY_PATH="${_APPDIR}/lib:${_APPDIR}/lib/platforms:${_APPDIR}/lib/platforms/imageformats:${_APPDIR}/lib/platforms/platforminputcontexts:${LD_LIBRARY_PATH}"
export QT_PLUGIN_PATH="${_APPDIR}/plugins:$QT_PLUGIN_PATH"
cd "${_APPDIR}" || { echo "Failed to change directory to ${_APPDIR}"; exit 1; }
exec "${_RUNNAME}" "$@" || exit $?