#!/bin/bash
set -e

echo "start zabbix mysql"
docker run --name zabbix-mysql \
	--rm \
	-e MYSQL_ROOT_PASSWORD=password \
	-d mysql

echo "start zabbix server"
docker run --name zabbix-server \
	--rm \
	--link zabbix-mysql:zabbix-mysql  \
	-e DB_SERVER_HOST="zabbix-mysql" \
	-e MYSQL_USER="root" \
	-e MYSQL_PASSWORD="password" \
	-d zabbix/zabbix-server-mysql

echo "start zabbix web"
docker run --name zabbix-web \
	--rm \
	-p 8000:80 \
	--link zabbix-mysql:zabbix-mysql  \
	-e DB_SERVER_HOST="zabbix-mysql" \
	-e MYSQL_USER="root" \
	-e MYSQL_PASSWORD="password" \
	--link zabbix-server:zabbix-server  \
	-e ZBX_SERVER_HOST="zabbix-server" \
	-e TZ="Europe/Paris" \
	-d zabbix/zabbix-web-apache-mysql

echo "============================="
echo "Browse http://localhost:8000"
echo "If not reachable or 'Database Error' message, may Database not yet ready or zabbix server is creating databse or starting... Wait until all zabbix components are ready. After that connect to zabbix with user:Admin / password:zabbix"
echo "============================="
