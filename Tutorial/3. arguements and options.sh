#!/bin/bash

# space between 2 and 3 are quoted because they are sorrounded by single quotation marks
echo 1 '2 3' 4 5

# space after Now is escaped by a backslash
# -n is an option
echo -n Now\ is the time

# space is quoted with double quotes
printf "%s %s\n" one two three