<install_folder>:/install jaspeen/oracle-11g
```
Database located in **/opt/oracle** folder

Users:
* root/install
* oracle/install
* SYS/oracle

Optionally you can map folder to easy upload dumps:
```sh
docker run --privileged --name oracle11g -p 1521:1521 -v <install_folder>:/install -v <local_dpdump>:/opt/oracle/dpdump jaspeen/oracle-11g
```
To execute impdp/expdp just use docker exec command:
```sh
docker exec -it oracle11g impdp ..
```
