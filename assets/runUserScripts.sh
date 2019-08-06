#!/bin/bash
set -e
source /assets/colorecho
source ~/.bashrc

### RUN  USER DEFINED SCRIPTS AND PATCHES
SCRIPTS_ROOT="/opt/init";

# Check whether parameter has been passed on
if [ -z "$SCRIPTS_ROOT" ]; then
   echo_yellow "$0: No SCRIPTS_ROOT passed on, no scripts will be run";
   exit 1;
fi;

# Execute custom provided files (only if directory exists and has files in it)
if [ -d "$SCRIPTS_ROOT" ] && [ -n "$(ls -A $SCRIPTS_ROOT)" ]; then

  echo "";
  echo_green "Executing user defined scripts"

  for f in $SCRIPTS_ROOT/*; do
      case "$f" in
          *.sh)     echo_green "$0: running $f"; . "$f" ;;
          *.sql)    echo_green "$0: running $f"; echo "exit" | $ORACLE_HOME/bin/sqlplus -s "/ as sysdba" @"$f"; echo ;;
          *)        echo_yellow "$0: ignoring $f" ;;
      esac
      echo "";
  done

  echo_green "DONE: Executing user defined scripts"
  echo "";

fi;
