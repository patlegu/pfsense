# Configure pfsense firewall using developer shell

* ruby creator.rb master.yaml > master.conf
* ssh root@192.168.1.1 '/usr/local/sbin/pfSsh.php' < master.conf
