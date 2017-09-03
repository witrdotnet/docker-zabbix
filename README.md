# Docker-zabbix
If you begin with zabbix and want to discover basic features. You are trying the <a href="https://github.com/zabbix/zabbix-docker" title="official zabbix docker-compose">official zabbix docker-compose files</a>, but it was too complicated and come with components you don't need, then you are in the right repository !

Whichever you prefer, you have two possible ways to start your zabbix:

* Bash script
* Docker-compose

In both ways, three zabbix components will be started using official zabbix docker images: zabbix-mysql, zabbix-server, and zabbix-web.

Once all zabbix components ready, browse http://localhost:8000 and log in with default zabbix user/passwor: Admin/zabbix.

## Bash script

Under `script` directory run:

```
./docker-zabbix.sh
```

## Docker-compose

Under `compose` directory run:

```
docker-compose up
```
