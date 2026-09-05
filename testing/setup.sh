#!/bin/bash

############################################################
#region removeStuff
systemctl stop bugsnitch.socket
systemctl stop bugsnitch.service
systemctl stop bugsnitch.path

rm /run/bugsnitch.sk

#endregion

############################################################
#region copyStuff
cp bugsnitch.service /etc/systemd/system/
cp bugsnitch.socket /etc/systemd/system/
cp bugsnitch.path /etc/systemd/system/
cp restart-bugsnitch.service /etc/systemd/system/

#endregion

############################################################
./mount-files.sh

############################################################
#region reloadAnd(Re)start
systemctl daemon-reload
systemctl start bugsnitch.socket
systemctl start bugsnitch.path

#endregion
