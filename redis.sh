source common.sh
component=redis

PRINT Disable Redis Default Version
dnf module disable redis -y &>>$LOG_FILE
STAT $?

PRINT Enable Redis 7 Version
dnf module enable redis:7 -y &>>$LOG_FILE
STAT $?

PRINT Install Redis
dnf install redis -y &>>$LOG_FILE
STAT $?

PRINT Update Redis Config File
sed -i '/^bind/ c bind 0.0.0.0' -e '/protected-mode/ c protected-mode no' /etc/redis/redis.conf &>>$LOG_FILE
STAT $?

PRINT Start Redis Service
systemctl enable redis &>>$LOG_FILE
systemctl restart redis &>>$LOG_FILE
STAT $?