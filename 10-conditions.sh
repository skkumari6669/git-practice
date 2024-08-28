#!/bin/bash

# Applying conditions in shell script
# if else conditions
# Algorithm: write your own steps in your own words what do yo want to check there is a class today or not

NUMBER=$1

if [ $NUMBER -gt 30 ]
then 
  echo "The entered num is ::$NUMBER is greater than 30"
else
  echo "The entered num is ::$NUMBER is less than 30"
fi    

