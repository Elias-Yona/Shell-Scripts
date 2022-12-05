#!/bin/bash

# Escape sequences are single letters preceded by a backslash

# \a: Alert (bell)
# \b: Backspace
# \e: Escape character
# \f: Form feed
# \n: Newline
# \r: Carriage return
# \t: Horizontal tab
# \v: Vertical tab
# \\: Backslash
# \nnn: A character specified by one to three octal digits
# \xHH: A character specified by one or two hexadecimal digit
printf "Q\t\141\n\x42\n"
