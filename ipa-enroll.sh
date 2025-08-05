#!/bin/bash
set -e
if [ ! -f /etc/ipa/default.conf ]; then
    ipa-client-install \
        --unattended \
        --mkhomedir \
        --server=ipa.example.test \
        --domain=example.test \
        --realm=EXAMPLE.TEST \
        --no-ntp \
        --no-nisdomain \
        --force-join  \
        -p admin -w password

fi
