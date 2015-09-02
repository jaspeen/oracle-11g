#!/usr/bin/env bash
set -e
source /assets/colorecho

trap "echo_red '******* ERROR: Something went wrong.'; exit 1" SIGTERM
trap "echo_red '******* Caught SIGINT signal. Stopping...'; exit 2" SIGINT

if [ ! -d "/install/database" ]; then
	echo_red "Installation files not found. Unzip installation files into mounted(/install) folder"
	exit 1
fi

echo_yellow "Installing Oracle Database 11g"

su oracle -c "/install/database/runInstaller -silent -ignorePrereq -waitforcompletion -responseFile /assets/db_install.rsp"
/opt/oracle/oraInventory/orainstRoot.sh
/opt/oracle/app/product/11.2.0/dbhome_1/root.sh