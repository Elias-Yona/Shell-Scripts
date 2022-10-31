#!/bin/bash
#: Title: concat - outputs the listing of all words in file with their line numbers
#: Synopsis: c.sh filename
#: Date: 2022-10-31
#: Version: 1.0
#: Author: 

# linked list implementation
llinsert() {
   local end=${#list[@]}
   local i

   for((i=0; next[i]; i=next[i]))
   do
     [ "${list[next[i]]}" \> "$1" ] && break
   done

   list[end]="$1"
   ((next[end]=next[i]))
   ((next[i]=end))

  shift
  (($#)) && llinsert $@
}

llfirst() {
  pos=next[0]
  echo "${list[pos]}"
}

llnext() {
   (( next[pos] )) && {
       ((pos=next[pos]))
       echo "${list[pos]}"
   }
}


# Loops through the file contents while inserting them into the linked list
readFromFile(){   
    file=$1 
    i=1  
    while read line
    do
        echo "Line No. $i : $line"  
        llinsert $line
        i=$((i+1))  
    done < $file  
}

list=("")

# One commandline argument is required (filename)
if (($# < 1))
then
    printf "NOTE: Words should be newline delimited.\nCommand usage is: ./c.sh filename \nExample: ./c.sh Weather.txt"
else
    readFromFile "$1"

    llfirst
    while llnext
    do
    :
    done

    # Display linked list contents
    echo
    printf "%-4s %-5s %-3s\n" "Index OR line number" Word "Cross Reference"
    printf "%-4s %-5s %-3s\n" -------------------- ---- ---------------
    for((i=0;i<${#next[@]};i++)) {
    printf "%-21s %-10s %-3s\n" "$i" "${list[i]}" "${next[i]}"
    }
fi

