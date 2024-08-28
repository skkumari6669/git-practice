#!/bin/bash
USERID=$(id -u)
if [ $USERID -ne 0 ]
then
  echo "please go with root for any installation dont install with normall user"
  exit 1
fi
dnf list installed git -y
if [ $? -ne 0 ]
then
  echo "git is not installed...please install it"
  
  dnf install git -y

    if [ $? -ne 0 ]
    then 
        echo "git is installation is not success.. check it"
        exit 1
    else  
        echo "git installation is success.."
    fi   
else
  echo "git is already installed, nothing to do.."
fi

dnf list installed mysql

if [ $? -ne 0 ]
then
  echo "mysql is not installed please installed it"

        dnf install mysql -y
        if [ $? -ne 0 ]
        then
          echo "mysql is not installed successfully..please check it"
        else
          echo "mysql is installed successfully.."
        fi  
else
  echo "mysql is already installed .."
fi  
