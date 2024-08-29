#!/bin/bash


# /var/log/shell-script/14-redirectors-<timestamp>.log

LOGFOLDER="/var/log/shell-script"
SCRIPTNAME=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%F-%y-%m-%d-%H-%M-%S)

LOGFILE="$LOGFILE/$SCRIPTNAME/$TIMESTAMP.log"

mkdir -p $LOGFOLDER

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

CHECK_ROOT(){
    if [ $? -ne 0]
    then
       echo -e "$R please check whether you have root access ot not $N" | tee -a $LogFILE
       exit 1
    fi   
}

USAGE(){
    echo -e "$R USAGE:: sudo sh 14-redirectors.sh package1 package2... $N"
    exit 1
}

echo "Script started executing at :$(date)" | tee -a $LOGFILE

VALIDATE(){
   if [ $1 -ne 0 ]
    then
        echo -e "$R $packages is not installed successfully please check it $N" | tee -a $LOGFILE
        exit 1
    else
        echo -e "$R $packages is installed successfully $N" | tee -a $LOGFILE
    fi 
}

CHECK_ROOT

if [ $# -eq 0 ]
then
   USAGE
fi

for $packages in $@
do
    dnf list installed $packages &>>$LOGFILE
        if [ $? -ne 0 ]
        then
        echo -e "$R $packages is not installed... please install it $N" | tee -a $LOGFILE
            dnf install $packages -y &>>$LOGFILE
            VALIDATE $? "Installing $packages..."
        else
        echo "$R $packages all ready installed...nothing to do...$N" | tee -a $LOGFILE
        fi    
done


