#!/bin/bash

if [[ $# -gt 3 ]]; then
    echo "Too many arguments"
    exit 1

elif [[ $# -lt 3 ]]; then
    echo "Too few arguments"
    exit 1
    
elif [[ $# -eq 3 ]]; then
    START="$1"
    STOP="$2"
    INCREMENT="$3"

    if [[ "$START" -gt "$STOP" ]]; then
        echo "Starting value must be less than stopping value"
        exit 1
    fi

    if [[ $INCREMENT -lt 0 ]]; then
        echo "Increment must be greater than 0"
        exit 1
    fi

    while [ $START -le $STOP ];
    do
        echo $START
        START=$(( $START + $INCREMENT ))
    done
fi