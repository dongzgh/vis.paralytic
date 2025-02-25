#!/bin/sh
# Set appname.
appname="visParaflow"

# Set LD_LIBRARY_PATH.
LD_LIBRARY_PATH=/opt/$appname
export LD_LIBRARY_PATH

# Set QT_PLUGIN_PATH.
QT_PLUGIN_PATH=/opt/$appname/plugins
export QT_PLUGIN_PATH

# Set QT_QPA_PLATFORM to xcb or wayland.
export QT_QPA_PLATFORM=wayland

# Run the application.
/opt/$appname/bin/$appname "$@"
