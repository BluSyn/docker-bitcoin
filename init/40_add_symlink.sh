#!/bin/bash

# Allows bitcoin-cli to run without params
mkdir -p /root/.bitcoin
ln -sf /config/bitcoin.conf /root/.bitcoin/bitcoin.conf
