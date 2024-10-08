#!/bin/bash
set -o pipefail
_APPDIR="/usr/lib/@appname@"
_RUNNAME="${_APPDIR}/@runname@"
export PATH="${_APPDIR}:${PATH}"
export LD_LIBRARY_PATH="${_APPDIR}/lib+:${LD_LIBRARY_PATH}"
export QT_PLUGIN_PATH="${_APPDIR}/lib+:${QT_PLUGIN_PATH}"
exec "${_RUNNAME}" "$@" || exit $?