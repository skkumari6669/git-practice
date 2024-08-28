#!/bin/bash

#function : same code writing again and again in multiple areas means repeatedly doing same work. 
#so keep it repeated work means set of repeated statements in a function and call when you want

USERID=$(id -u)

CHECK_ROOT(){

    if [ $? -ne 0 ]
    then
      echo "Before installing anything please check whether you have root access or not"
    exit 1
    fi
}

VALIDATE(){
   
    if [ $? -ne 0 ]
    then
      echo "please check $2 is ....failed"
    else
      echo "$2 is... success"
    fi 
}

CHECK_ROOT

dnf list installed git 

if [ $? -ne 0 ]
then 
  echo "git is not installed ... please install it"
  dnf install git -y
  VALIDATE $? "Installing git"
else
  echo "git is already installed... nothing to da..."
fi    


dnf list installed mysql

if [ $? -ne 0 ]
then
   echo "mysql is not installed... please install it"
   dnf install mysql -y
   VALIDATE $? "Installing mysql"
else
   echo "mysql is already installed nothing to do..."
fi   





# if [ $? -ne 0 ]
# then 
#   echo "git is not installed ... please install it"
#         dnf install git -y

#         if [ $? -ne 0 ]
#         then
#           echo "please check git is not installed successfully"
#         else
#           echo "Git is installed successfully"
#         fi    
# else
#   echo "git is already installed... nothing to da..."
# fi    



