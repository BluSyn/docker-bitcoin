#!/bin/bash

chown -R abc:abc /config
if [ -f /config/.bitcoin/.lock ]; then rm /config/.bitcoin/.lock; fi
