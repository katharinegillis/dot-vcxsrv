#!/usr/bin/env bash

choco.exe uninstall vcxsrv -y

WIN_STARTUP_PATH=$(powershell.exe -Command "[Environment]::GetFolderPath(\"Startup\")")
STARTUP_PATH=$(wslpath "$WIN_STARTUP_PATH")
STARTUP_PATH=${STARTUP_PATH%$'\r'}

rm "$STARTUP_PATH/config.xlaunch"