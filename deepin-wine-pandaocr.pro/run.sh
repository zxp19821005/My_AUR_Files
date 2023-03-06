#!/bin/sh
BOTTLENAME="Deepin-PandaOCR.Pro"
APPVER="4.18.1.1007"
EXEC_PATH="c:/Program Files/PandaOCR.Pro/PandaOCR.Pro.exe"
START_SHELL_PATH="/opt/deepinwine/tools/run_v4.sh"
EXPORT_ENVS=""
 
export SPECIFY_SHELL_DIR=`dirname $START_SHELL_PATH`
ARCHIVE_FILE_DIR="/opt/apps/$DEB_PACKAGE_NAME/files"
export WINEDLLPATH=/opt/$APPRUN_CMD/lib:/opt/$APPRUN_CMD/lib64
export WINEPREDLL="$ARCHIVE_FILE_DIR/dlls"
export MIME_TYPE=""
export DEB_PACKAGE_NAME="deepin-wine-pandaocr.pro"
export APPRUN_CMD="deepin-wine6-stable"
   
if [ -n "$EXPORT_ENVS" ];then
    export $EXPORT_ENVS
fi
 
if [ -n "$EXEC_PATH" ];then
    if [ -z "${EXEC_PATH##*.lnk*}" ];then
        $START_SHELL_PATH $BOTTLENAME $APPVER "C:/windows/command/start.exe" "/Unix" "$EXEC_PATH" "$@"
    else
        $START_SHELL_PATH $BOTTLENAME $APPVER "$EXEC_PATH" "$@"
    fi
else
    $START_SHELL_PATH $BOTTLENAME $APPVER "uninstaller.exe" "$@"
fi