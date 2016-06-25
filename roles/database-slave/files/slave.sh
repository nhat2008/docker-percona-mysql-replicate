#!/usr/bin/env bash
# Time to wait docker container reloading
sleep 40
# $1 Container's name
# $2 mysql user
# $3 mysql pass,
# $4 Master host
# $5 master user for replication
# $6 master pass for replication
# $7 master log file
# $8 master log pos

docker exec -ti $1 'mysql' -u$2 -p$3 -e"STOP SLAVE;" -vvv


docker exec -ti $1 'mysql' -u$2 -p$3 \
       -e"change master to
       master_host='$4',
       master_user='$5',
       master_password='$6',
       MASTER_AUTO_POSITION = 1" -vvv

docker exec -ti $1 'mysql' -u$2 -p$3 -e"START SLAVE;" -vvv
