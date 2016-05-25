#!/bin/bash

# Allows bitcoin-cli to run without params
mkdir /root/.bitcoin
ln -s /config/bitcoin.conf /root/.bitcoin/bitcoin.conf
