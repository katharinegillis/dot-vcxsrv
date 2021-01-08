#!/usr/bin/env bash

choco.exe upgrade vcxsrv -y

PKG_PATH=$2
WIN_STARTUP_PATH=$(powershell.exe -Command "[Environment]::GetFolderPath(\"Startup\")")
STARTUP_PATH=$(wslpath "$WIN_STARTUP_PATH")
STARTUP_PATH=${STARTUP_PATH%$'\r'}

cp $PKG_PATH/configs/config.xlaunch "$STARTUP_PATH"