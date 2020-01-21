#!/usr/bin/env sh

set -x
set -e

sed -ie 's/SELINUX=enforcing/SELINUX=permissive/' /etc/selinux/config
setenforce 0

yum clean all
yum -y update
yum -y install net-tools httpd wget

yum -y remove mariadb-libs

cd /usr/local/src
wget http://dev.mysql.com/get/mysql-community-release-el7-5.noarch.rpm
rpm -Uvh mysql-community-release-el7-5.noarch.rpm

yum -y install mysql-community-server

systemctl enable mysqld
systemctl start mysqld

mysqladmin create dvwa
mysqladmin -u root password p@ssw0rd

yum -y install php php-mysql php-pear php-pear-DB php-gd unzip

cd /var/www/html
wget https://github.com/ethicalhack3r/DVWA/archive/v1.9.zip
unzip v1.9.zip
rm v1.9.zip
mv DVWA-1.9/ dvwa

systemctl enable httpd
systemctl start httpd


