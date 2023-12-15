#!/bin/sh
set -e
_APPDIR=/opt/@appname@
_APPNAME=@runname@
export PATH="${_APPDIR}:${PATH}"
WEIXIN=`ps -ef | grep weixin | grep -v grep | grep -v weixin.sh | wc -l`
if [ 0 -ne $WEIXIN ];then
  pidof @runname@ | xargs kill -9
fi
cd "${_APPDIR}"
bwrap \
  --dev-bind / / \
  --bind "${_APPDIR}/license/usr/lib/license/libuosdevicea.so" /usr/lib/license/libuosdevicea.so \
  --bind "${_APPDIR}/license/var/lib/uos-license" /var/lib/uos-license \
  --bind "${_APPDIR}/license/var/uos" /var/uos \
  --bind "${_APPDIR}/uos-lsb" /etc/lsb-release \
  --bind "${_APPDIR}/uos-release" /usr/lib/os-release \
  "${_APPDIR}/files/@runname@" --no-sandbox "$@"