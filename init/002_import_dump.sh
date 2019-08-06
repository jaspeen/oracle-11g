echo "*****************"
echo "Running import..."
chmod 466 /opt/oracle/dpdump/csr3o_mgrlive.dmp
impdp system/oracle@localhost:1521/orcl dumpfile=csr3o_mgrlive.dmp
echo "Running import DONE."
echo "*****************"
