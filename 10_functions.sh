#!/bin/bash
USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/home/ec2-user/devops/shell-scripts/logs-$TIMESTAMP.log

VALIDATE(){
if [ $1 -ne 0 ]
then
echo "$2...failed"
exit 1
else
echo "$2...success" 
fi
}

if [ $USERID -ne 0 ]
then
echo "user is not superuser"
exit 1
else
echo "user is super user"
fi
yum install mysql -y &>>$LOGFILE
VALIDATE $? "Installation of MYSQL"
yum install git -y &>>$LOGFILE
VALIDATE $? "Installation of GIT"

#git add 13_installation.sh 
git commit -m "Your message about changes"
git pull
