#!/bin/bash

sudo rm -rf oradata/
docker rm oracle11g-aqa
docker run --privileged -p 1521:1521 -d --name oracle11g-aqa -v $PWD/init:/opt/init -v $PWD/oradata:/opt/oracle/data -v $PWD/local_dump:/opt/oracle/dpdump 550144299809.dkr.ecr.eu-central-1.amazonaws.com/aero-crew/oracle-11g-aqa
