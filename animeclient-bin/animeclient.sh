#!/bin/bash
set -e
_APPDIR="/usr/lib/@appname@"
_RUNNAME="${_APPDIR}/@runname@"
_OPTIONS="@options@"
export PATH="${_APPDIR}:${PATH}"
export LD_LIBRARY_PATH="${_APPDIR}/swiftshader:${_APPDIR}/lib:${LD_LIBRARY_PATH}"
export ELECTRON_IS_DEV=0
export ELECTRON_FORCE_IS_PACKAGED=true
export ELECTRON_DISABLE_SECURITY_WARNINGS=true
export ELECTRON_OVERRIDE_DIST_PATH="/usr/bin/electron@electronversion@"
export NODE_ENV=production
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
_FLAGS_FILE="${XDG_CONFIG_HOME}/@appname@-flags.conf"
declare -a flags
if [[ -f "${_FLAGS_FILE}" ]]; then
    mapfile -t < "${_FLAGS_FILE}"
fi
for line in "${MAPFILE[@]}"; do
    if [[ ! "${line}" =~ ^[[:space:]]*#.* ]] && [[ -n "${line}" ]]; then
        flags+=("${line}")
    fi
done
cd "${_APPDIR}"
if [[ "${EUID}" -ne 0 ]] || [[ "${ELECTRON_RUN_AS_NODE}" ]]; then
    exec electron@electronversion@ "${_RUNNAME}" "${_OPTIONS}" "${_USER_FLAGS}" "$@" || exit $?
else
    exec electron@electronversion@ "${_RUNNAME}" "${_OPTIONS}" --no-sandbox "${_USER_FLAGS}" "$@" || exit $?
fi