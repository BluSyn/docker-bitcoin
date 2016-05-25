Based on linuxserver docker baseimage. See [LinuxServer.io](https://www.linuxserver.io/)

# blusyn/bitcoin

Run full bitcoind node.

## Usage

```
docker create \
	--name=bitcoin \
	-p 8333:8333 \
	-p 8332:8332 \
	-e PUID=<UID> -e PGID=<GID> \
	-v </path/to/bitcoin.conf>:/config/bitcoin.conf \
	-v <path/to/data>:/data \
	blusyn/bitcoin
```

This container is based on phusion-baseimage with ssh removed. For shell access whilst the container is running do `docker exec -it bitcoin /bin/bash`.

**Parameters**

* `-p 8333:8333` - Main Bitcoind port, for peer discovery
* `-p 8332:8332` - RPC Port for external RPC commands (OPTIONAL)
* `-v /config/bitcoin.conf` - Main Config. See bitcoin.conf.example
* `-v /data` - Location of bitcoin data. Mount to persist blockchain syncing
* `-e PGID` for for GroupID - see below for explanation
* `-e PUID` for for UserID - see below for explanation

### User / Group Identifiers

**TL;DR** - The `PGID` and `PUID` values set the user / group you'd like your container to 'run as' to the host OS. This can be a user you've created or even root (not recommended).

Part of what makes our containers work so well is by allowing you to specify your own `PUID` and `PGID`. This avoids nasty permissions errors with relation to data volumes (`-v` flags). When an application is installed on the host OS it is normally added to the common group called users, Docker apps due to the nature of the technology can't be added to this group. So we added this feature to let you easily choose when running your containers.  

## Updates / Monitoring

* Upgrade to the latest version of bitcoind simply `docker restart bitcoin`.
* Monitor the logs of the container in realtime `docker logs -f bitcooin`.
* Get information about connections and other bitcoind commands: `docker exec bitcoin bitcoin-cli getinfo`

## Notes
Highly recommended you do NOT store bitcoin on this docker container. This is purely for purposes of running a full node.

## TODO

* Improve default config
* Auto generate rpcuser and rpcpassword for config
