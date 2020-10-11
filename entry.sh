#! /bin/sh

privoxy --no-daemon /trojan/config/privoxy.config &

/trojan/bin/trojan --config=/trojan/client.json

