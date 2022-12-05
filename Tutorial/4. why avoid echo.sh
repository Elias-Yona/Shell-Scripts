#!/bin/bash

# Two main branches of Unix are: AT&T's System V and BSD
# The default newline can be supressed in two ways:

# 1. AT&T's way
echo "No Newline\c"

# 2. BSD way
# echo -n No Newline

# bash has the -e option to activate escape sequences such as /c but by default uses -n to
# prevent a newline from being printed
#  bash has an xpg_echo option (XPG stands for X/Open Portability Guide, a specification 
# for Unix systems) that makes echo behave like that other version
# This can be turned on or off while in the shell
shopt -s xpg_echo

echo "No Newline\c"