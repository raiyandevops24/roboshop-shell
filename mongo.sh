source common.sh
component=mongo

PRINT Copy MongoDB Repo File
cp mongo.repo /etc/yum.repos.d/mongo.repo
STAT $?

PRINT Install MongoDB
dnf install mongodb-org -y
STAT $?

PRINT Update MongoDB Config File
sed -i 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf
STAT $?

PRINT Start MongoDB Service
systemctl enable mongod
systemctl restart mongod
STAT $?