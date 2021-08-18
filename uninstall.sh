#!/usr/bin/env bash

SYSTEM=$3

if [ "$SYSTEM" == "wsl" ]; then
    choco.exe uninstall vcxsrv -y

    WIN_STARTUP_PATH=$(powershell.exe -Command "[Environment]::GetFolderPath(\"Startup\")")
    STARTUP_PATH=$(wslpath "$WIN_STARTUP_PATH")
    STARTUP_PATH=${STARTUP_PATH%$'\r'}

    rm "$STARTUP_PATH/config.xlaunch"
else
    echo -e "\e[33mVcxSrv is only installable on Windows platforms, nothing to uninstall."
fi