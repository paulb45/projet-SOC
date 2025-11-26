#!/bin/bash

sudo docker cp soc_splunk:/opt/splunk/etc/apps/search/local/savedsearches.conf /home/user/savedsearches.conf

sudo chown user:user /home/user/savedsearches.conf
