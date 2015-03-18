#!/bin/bash  
source ~/.bash_profile      
drush -y make profiles/druparcheky/druparcheky.make --concurrency=5 --force-complete --no-cache
rm download-druparcheky.sh