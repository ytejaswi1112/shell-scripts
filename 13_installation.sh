#!/bin/bash
USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/home/ec2-user/devops/shell-scripts/($SCRIPT_NAME)-$TIMESTAMP.log
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"


VALIDATE(){
    if [ $1 -ne 0 ]
    then
    echo -e " $2....$R FAILURE $N "
    exit
    else
    echo -e " $2....$G completed successfully $N"

}

if [ $USERID -ne 0 ]
then
echo " $R Install with super user $N "
exit 1
else
echo -e " $G You are super user $N"
fi

for i in @

echo "package to install:$i"
yum list installed $i &>>$LOGFILE
if [ $? -eq 0 ]
then
echo -e " The package is installed .....$Y skipping it $N "
else
yum install $i -y &>>$LOGFILE
VALIDATE $? "! Installation"
fi