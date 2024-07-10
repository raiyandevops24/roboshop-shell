LOG_FILE=/tmp/roboshop.log

NODEJS(){
  echo Disable NodeJS Default Version
  dnf module disable nodejs -y &>>$LOG_FILE

  echo Enable NodeJS 20 Module
  dnf module enable nodejs:20 -y &>>$LOG_FILE

  echo Install NodeJS
  dnf install nodejs -y &>>$LOG_FILE

  echo Copy Service File
  cp ${component}.service /etc/systemd/system/${component}.service &>>$LOG_FILE

  echo Copy MongoDB repo file
  cp mongo.repo /etc/yum.repos.d/mongo.repo &>>$LOG_FILE

  echo Adding Application User
  useradd roboshop &>>$LOG_FILE

  echo Removing Old Content
  rm -rf /app &>>$LOG_FILE

  echo Create App Directory
  mkdir /app &>>$LOG_FILE

  echo Download App Content
  curl -o /tmp/${component}.zip https://roboshop-artifacts.s3.amazonaws.com/${component}-v3.zip &>>$LOG_FILE

  cd /app

  echo Extract App Content
  unzip /tmp/${component}.zip &>>$LOG_FILE

  cd /app

  echo Download NodeJS Dependencies
  npm install &>>$LOG_FILE

  echo Start Service
  systemctl daemon-reload &>>$LOG_FILE
  systemctl enable ${component} &>>$LOG_FILE
  systemctl restart ${component} &>>$LOG_FILE

}