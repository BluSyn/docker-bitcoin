#!/bin/bash

chown -R abc:abc /config
chown -R abc:abc /data
if [ -f /data/.lock ]; then rm /data/.lock; fi
