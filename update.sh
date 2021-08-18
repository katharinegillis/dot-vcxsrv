#!/usr/bin/env bash

SYSTEM=$3

if [ "$SYSTEM" == "wsl" ]; then
    choco.exe upgrade vcxsrv -y

    PKG_PATH=$2
    WIN_STARTUP_PATH=$(powershell.exe -Command "[Environment]::GetFolderPath(\"Startup\")")
    STARTUP_PATH=$(wslpath "$WIN_STARTUP_PATH")
    STARTUP_PATH=${STARTUP_PATH%$'\r'}

    cp "$PKG_PATH/configs/config.xlaunch" "$STARTUP_PATH"
else
    echo -e "\e[33mVcxSrv is only installable on Windows platforms."
fi