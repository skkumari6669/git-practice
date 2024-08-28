#!/bin/bash

#using special variables in shell script

# $@ = it shows all the variables passed in this
# $# = it shows how args/vars passed in this script
# $0 = script name
# $PWD = current directory
# $HOME = current user home directory
# $$ = PID of current script
# $? = exit code of last command
# $! = pid of last background command

echo "All Variables in the script :: $@"
echo "How many args are in the script "" $#"
echo "current script name :: $0"
echo "Current dir :: $PWD"
echo "Current user of home dir :: $HOME"
echo "PID of current script :: $$"
echo "exit code of last command :: $?"
sleep 100&
echo "pid of last background command :: $!"
