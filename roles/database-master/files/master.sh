#!/usr/bin/env bash
# $1 Container's name
# $2 mysql user
# $3 mysql pass
# $4 master user for replication
# $5 master pass for replication
sleep 40
# add replicate to master
docker exec -ti $1 'mysql' \
            -u$2 -p$3 -vvv \
            -e"GRANT REPLICATION SLAVE ON *.* TO $4@'%' IDENTIFIED BY '$5'"
# create database
docker exec -ti $1 'mysql' \
            -u$2 -p$3 -vvv \
            -e"CREATE DATABASE $6;"

# import file *.sql to the database
#docker exec -ti $1 'mysql' \
#            -u$2 -p$3 -vvv \
#            -e"use $6; source /tmp/dump/product.sql;"