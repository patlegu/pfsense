# pfsense

Configure pfsense firewall using developer shell.

bundle install --path=vendor/bundle

ruby creator.rb master.yml > go

'/usr/local/sbin/pfSsh.php' < go
