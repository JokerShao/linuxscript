#!/usr/bin/env bash
# AUTHOR:   joker
# FILE:     ssopen.sh
# ROLE:     start shadowsocks.AppImage from command line
# CREATED:  2018-03-04 00:19:04
# MODIFIED: 2018-03-04 01:09:42

######
# run this script to start Shadowsocks-Qt5.App, then
# you can close the terminal.
# you should make a symbol link like:
# ln -s /home/username/path/to/ssopen.sh /home/username/runss
##

SCRIPT_PATH=$(dirname $(readlink -f "$0"))
$SCRIPT_PATH/Shadowsocks-Qt5-3.0.0-x86_64.AppImage &
