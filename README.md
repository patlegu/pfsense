# Configure pfSense using developer shell

* ruby creator.rb master.yaml > master.conf
* ssh root@192.168.1.1 '/usr/local/sbin/pfSsh.php' < master.conf

The ruby script creator.rb will convert a YAML file into pfSense developer shell commands. This way it is possible to configure your pfSense device.

```yaml
system:
  hostname: 'master'
  domain: 'localdomain'
  dnsserver:
    '0': '8.8.8.8'
    '1': '8.8.4.4'
```
