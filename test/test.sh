#!/bin/sh

cd /tmp/quantumx-installer/quantumx-installer

if [ -e "./test/preinstall/$IMAGE" ]; then
    "./test/preinstall/$IMAGE"
fi

./install.sh
quantumx_server

