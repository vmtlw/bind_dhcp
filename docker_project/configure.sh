#!/bin/bash


VERSION=9.18

docker compose down
docker run -d --rm --name preparebind internetsystemsconsortium/bind9:$VERSION

docker cp -a preparebind:/etc/bind ./etc
docker cp -a preparebind:/var/cache/bind ./cache
docker cp -a preparebind:/var/lib/bind ./lib
docker cp -a preparebind:/var/log/bind ./log
chown 0:105 -R ./etc/
chown 104:105 -R ./cache/
chown 104:105 -R ./lib/
chown 104:105 -R ./log/


docker stop preparebind

cp -a ./etc/named.conf ./etc/named.conf.example

docker compose up -d




