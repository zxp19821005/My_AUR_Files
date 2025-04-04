#!/bin/bash
set -o pipefail
_APPDIR=/usr/lib/@appname@
_RUNNAME="${_APPDIR}/bin/@runname@"
export PATH="${_APPDIR}:${_APPDIR}/bin:${PATH}"
export LD_LIBRARY_PATH="${_APPDIR}/bin:${_APPDIR}/lib:${_APPDIR}/lib/x86_64-linux-gnu:${LD_LIBRARY_PATH}"
cd "${_APPDIR}"
exec "${_RUNNAME}" "$@" || exit $?