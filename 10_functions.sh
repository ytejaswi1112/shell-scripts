#/bin/bash
USERID=$(id -u)
TIMESTAMP=$(date +%F -%H -%M -%S)
SCRIPTNAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/home/ec2-user/devops/shell-scripts/$SCRIPTNAME_$TIMESTAMP.log


if [ $USERID -ne 0 ]
then
echo "user is not superuser"
exit 1
else
echo "user is super user"
fi

yum install mysql -y &>>$LOGFILE
if [ $? -ne 0 ]
then
echo "Mysql installation failed"
exit 1
else
echo "MYSQL installation success"
fi

yum install git -y &>>$LOGFILE
if [ $? -ne 0 ]
then
echo "Git installation failed"
exit 1
else
echo "Git installation success"
fi