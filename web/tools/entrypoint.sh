#!/bin/sh
set -e
echo "Inicializando el servicio de Apache"
service httpd restart

echo "Inicializando el servicio de SSH"
service sshd restart

echo "Inicializando el servicio de MySQL"
service mysqld restart

