#!/run/current-system/sw/bin/bash

# Debugging
# exec 19>/home/owner/Desktop/startlogfile
# BASH_XTRACEFD=19
# set -x

# Stop display manager
systemctl stop display-manager.service
