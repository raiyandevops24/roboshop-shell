dnf module disable redis -y
dnf module enable redis:7 -y
dnf install redis -y
#update config file in the redis
systemctl enable redis
systemctl start redis