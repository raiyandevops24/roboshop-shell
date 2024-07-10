source common.sh
# shellcheck disable=SC2034
component=catalogue
app_path=/app

NODEJS

echo Install MongoDB Client
dnf install mongodb-mongosh -y &>>$LOG_FILE
STAT $?

echo Load Master Data
mongosh --host mongo.dev.raiyan-m.online </app/db/master-data.js &>>$LOG_FILE
STAT $?