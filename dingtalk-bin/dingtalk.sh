#!/bin/bash
set -o pipefail
_APPDIR="/opt/@appname@/release"
_RUNNAME="${_APPDIR}/@runname@"
export PATH="${_APPDIR}:${PATH:-}"
export QT_PLUGIN_PATH="${_APPDIR}:${QT_PLUGIN_PATH:-}"
export QT_QPA_PLATFORM="wayland;xcb"
export QT_AUTO_SCREEN_SCALE_FACTOR=1
cd "${_APPDIR}" || { echo "Failed to change directory to ${_APPDIR}"; exit 1; }
exec "${_RUNNAME}" "$@"