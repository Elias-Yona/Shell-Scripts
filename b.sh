#!/bin/bash
#:  Title: concat - Contatenates two strings and finds the length of the resultant string
#: Synopsis: b.sh string1 string2
#: Date: 2022-10-31
#: Version: 1.0
#: Author: 


if (($# < 2))
then
    printf "Command usage is: ./b.sh string1 string2\nExample:\n./b.sh Hello World\n"
else
    concatenated_string="$1$2"
    length=0

    echo $@

    for argument in $@
    do
        for (( i=0; i<${#argument}; i++ )); do
            length=$((length+1))
        done
    done

    printf 'The concatenated string is %s and its length is %d\n' $concatenated_string $length
fi
