#!/bin/bash

#loops: repeatedly execute certain set of condtions until it will false 

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

for $PACKAGE in $@
do
  dnf list installed $PACKAGE
   if [ $? -ne 0 ]
   then 
     echo "$PACKAGE is not installed ... please install it"
     dnf install $PACKAGE -y
     VALIDATE $? "Installing $PACKAGE"
   else
     echo "$PACKAGE is already installed... nothing to da..."
   fi 
done


