#!/bin/bash
set -o pipefail
_APPDIR="/usr/lib/@appname@"
_RUNNAME="${_APPDIR}/@runname@"
_PKGVER=@pkgver@
export PATH="${_APPDIR}:${_APPDIR}/${_PKGVER}:${PATH}"
export LD_LIBRARY_PATH="${_APPDIR}/lib:${_APPDIR}/${_PKGVER}:${LD_LIBRARY_PATH}"
export QT_PLUGIN_PATH="${_APPDIR}/plugins:${_APPDIR}/${_PKGVER}/plugins:${QT_PLUGIN_PATH}"
cd "${_APPDIR}" || { echo "Failed to change directory to ${_APPDIR}"; exit 1; }
exec "${_RUNNAME}" "$@" || exit $?