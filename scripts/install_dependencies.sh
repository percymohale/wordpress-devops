#!/bin/bash
if [ -f /etc/init.d/mysql* ]; then
    echo "Mysql"
else
	# yum install -y mysql-server	
	# service mysqld start
	# mysqladmin -u root password 'password'
	# mysql -u root -pfit2cloud -e "create database wordpress"
	# service mysqld stop
	echo "MySQl installed!"
fi

if [ -f /etc/init.d/httpd* ]; then
    echo "httpd!"
else
	# yum groupinstall -y "Web Server" "PHP Support"
	# yum install -y php-mysql
	# echo "phpmysql!"

fi