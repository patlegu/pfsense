# Configure pfSense using developer shell


* ssh root@192.168.1.1 '/usr/local/sbin/pfSsh.php' < master.conf

The ruby script creator.rb will convert a YAML file into pfSense developer shell commands. This way it is possible to configure your pfSense device.

```yaml
#master.yaml:

system:
  hostname: 'master'
  domain: 'localdomain'
  dnsserver:
    '0': '8.8.8.8'
    '1': '8.8.4.4'
```

Run the script:

```sh
ruby creator.rb master.yaml > master.conf
```

The settings above will look like this after running creator.rb:

```sh
#master.conf:

$config['system']['hostname'] = 'master';
$config['system']['domain'] = 'localdomain';
$config['system']['dnsserver']['0'] = '8.8.8.8';
$config['system']['dnsserver']['1'] = '8.8.4.4';
write_config();
exec
exit
```

You can apply those settings with the following command:

```sh
ssh root@192.168.1.1 '/usr/local/sbin/pfSsh.php' < master.conf
```
