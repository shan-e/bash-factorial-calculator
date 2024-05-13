#!/bin/bash

getFactorial() { # computes factorial
    local num=$1 # inner scope
    factorial=1 # global variable
    # loop through multiplying current i by current factorial
    for (( i = 1; i <= num; i++ )); do
        factorial=$((factorial*i))
    done
}

printHeaderFooter() { # print header/footer
    local char=$1 # parse character
    local width=$2 # parse number of chars
    for (( i = 0; i < width; i++ )); do
        printf "%c" "$char" # print char width times
    done
    echo # new line
}

checkUsage() { # ensure input is correct
    # if no args given, print message
    if [ $# -eq 0 ]; then
        echo "Nahh bruh, you is missing another argument styl"
        echo "Usage: $0 <positive number>"
        echo
        exit 1
    fi
    if [ "$num" -lt 0 ]; then
        echo "Yooo who let my guy cook?? aint no one munchin a number less than zero"
        echo "Usage: $0 <positive number>"
        echo
        exit 1
    fi
}

num=$1 # parse arg 1 from command line
sideBorder='!' # controls side border design
getFactorial "$num" # pass num to function

clear # clear console
checkUsage "$@"

printHeaderFooter '"' 21
printf "%c%20c\n" $sideBorder $sideBorder
printf "%c    Factorial %-2d   %c\n" $sideBorder "$num" $sideBorder
printf "%c        is         %c\n" $sideBorder $sideBorder
printf "%c    %-10d     %c\n" $sideBorder $factorial $sideBorder
printf "%c%20c\n" $sideBorder $sideBorder
printHeaderFooter '"' 21