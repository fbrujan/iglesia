#!/bin/sh
set -e
chmod 1777 /tmp
echo "Inicializando el servicio de Apache"
chown -R apache:apache /var/www/iglesia
service httpd restart

echo "Inicializando el servicio de SSH"
service sshd restart

echo "Inicializando el servicio de MySQL"
chown -R mysql:mysql /var/lib/mysql
service mysqld restart
/bin/bash
