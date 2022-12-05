#!/bin/bash

echo $# # expands to the number of positional parameters
echo $0 # path to the currently running script
echo $$ # PID of the current process
echo $? # exit code of the last executed command

printf "Hello %s %s\n" "$1" "$2" # get the first and second arguments

echo $! # PID of the last command executed in the background
echo $- # options flags currently in effect
echo $_ # last argument to the last executed command
