#!/bin/bash

set -e # if we get any error it will stop there not move to next command
# set -ex # if we use this in detailing we get the error in debug mode"

failure(){
    echo "Failed at: $1:$2"
}

trap 'failure "${LINENo}" "$BASH_COMMAND"' ERR # ERR is the error signal

echo "Hello world success"
echooooo "Hello world failure"
echo "Hello world after failure"



