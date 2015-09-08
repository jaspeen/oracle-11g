Image for running Oracle Database 11g. Due to oracle license restrictions image is not contain database itself and will install it on first run from external directory.
# Usage
Download database installation files from http://www.oracle.com/technetwork/database/in-memory/downloads/index.html and unpack them to <install_folder>.
Run container and it will install oracle and create database:

```sh
docker run --privileged --name oracle11g -p 1521:1521 -v <install_folder>:/install jaspeen/oracle-11g
```
Then you can commit this container to have installed and configured oracle database:
```sh
docker commit oracle11g oracle11g-installed
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
