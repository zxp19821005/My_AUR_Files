#!/bin/bash
set -o pipefail
_APPDIR="/usr/lib/@appname@"
_RUNNAME="${_APPDIR}/@runname@"
export PATH="${_APPDIR}:${PATH}"
export LD_LIBRARY_PATH="${_APPDIR}:${LD_LIBRARY_PATH}"
if [ ! -d "${_APPDIR}" ]; then
    echo "Error: ${_APPDIR} not found!"
    exit 1
fi
if [ ! -f "${_RUNNAME}" ]; then
    echo "Error: ${_RUNNAME} not found!"
    exit 1
fi
if [ ! -x "${_RUNNAME}" ]; then
    echo "Error: ${_RUNNAME} not executable!"
    exit 1
fi
cd "${_APPDIR}" || { echo "Failed to change directory to ${_APPDIR}"; exit 1; }
start_browser() {
    local delay=$1
    local args=$2
    if [ "${delay}" -gt 0 ]; then
        echo "Waiting for ${delay} seconds before start..."
        sleep "${delay}"
    fi
    if [ -n "${args}" ]; then
        "${_RUNNAME}" "${args}" >/dev/null 2>&1 &
    else
        "${_RUNNAME}" >/dev/null 2>&1 &
    fi
    echo "Starting ${_RUNNAME}..."
}
case "$1" in
    "update")
        start_browser 2 "--update"
        ;;
    "")
        start_browser 0
        ;;
    *)
        start_browser 0 "$1"
        ;;
esac
exit 0