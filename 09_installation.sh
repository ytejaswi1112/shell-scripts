#!/bin/bash
USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
echo "you are not super user so get the root access"
exit 1
else
echo "you are super user"
fi

touch logs
yum install mysql -y >> logs

if [ $? -ne 0 ]
then
echo "mysql is installation failed"
exit 1
else 
echo "Mysql is installed"
fi

yum install git -y >> logs

if [ $? -ne 0 ]
then
echo "git is installation failed"
exit 1
else 
echo "git is installed"
fi
