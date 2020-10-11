#! /bin/bash

function clean_up
{
# Perform program exit housekeeping
    rm -rf $temp $config
    exit
}

trap clean_up SIGHUP SIGINT SIGTERM


# create a temp file to save the fastest server name
temp=`mktemp`
./servers.txt > $temp
config=client.json
touch $config
chmod 600 $config

# get the server name 
server=$(cat $temp | awk '{print $2}') 
# get the port name
port=$(grep -A1 $server config.json.orig |grep server_port|awk '{print $2}'|sed -e 's/,//')

echo server: $server  port: $port


cat client_template.json |sed -e "s/xxxxxxxx/$server/" -e "s/yyyyyyyy/$port/" > $config

echo "Client config file is " $config

