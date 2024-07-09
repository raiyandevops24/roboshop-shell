cp payment.service /etc/systemd/system/payment.service
dnf install python3 gcc python3-devel -y
useradd roboshop
mkdir /app
curl -L -o /tmp/payment.zip https://roboshop-artifacts.s3.amazonaws.com/payment-v3.zip
cd /app
unzip /tmp/payment.zip
systemctl daemon-reload
systemctl enable payment
systemctl start payment