#!/bin/bash
set -e

source common/ui.sh
source common/utils.sh

info 'Installing extra packages and upgrading'

debug 'Bringing container up'
utils.lxc.start

# Sleep for a bit so that the container can get an IP
SECS=20
log "Sleeping for $SECS seconds..."
sleep $SECS

# TODO: Support for appending to this list from outside
PACKAGES=(vim curl wget man ca-certificates sudo openssh)

utils.lxc.attach pacman -Sy --noconfirm ${PACKAGES[*]}
utils.lxc.attach systemctl enable sshd
