#!/bin/bash
#:  Title: edms - Manages employee dbms
#: Synopsis: a.sh
#: Date: 2022-10-31
#: Version: 1.0
#: Author: 

clear
AutoNumber()
{
    local eno=0     
    f=0
    for j in `cat Employee.txt`
    do
        eno=$(echo "$j" | cut -d "," -f 1)
        f=1
    done
    if [ $f = 1 ]
    then
        eno=`expr $eno + 1`
    else
        eno=1
    fi
    echo $eno
}



Insert()
{
    clear
    
    eno=$1           
    echo "Enter Employee No: $eno"
    
    echo "Enter Employee Name: \c"
    read enm

    echo "Enter Employee Address: \c"
    read eadd
    
    echo "Enter Employee Age : \c"
    read eage

    echo "Enter Employee Gender: \c"
    read egen
    
    echo "Enter Employee Designation : \c"
    read edes

    echo "Enter Employee Basic Salary : \c"
    read ebal

    echo "$eno,$enm,$eadd,$eage,$egen,$edes,$ebal,true" >> Employee.txt

    echo "                 Insert Sucessfully                           "

}

Display()
{
    clear
    echo "_______________________________________________________________________________________"                       
    echo "                              Employee Details "
    echo "_______________________________________________________________________________________"                       
    echo "_______________________________________________________________________________________"                       
    printf "#ENO \t ENAME \t\t EADDR \t\t EAGE \t EGEN \t EDES \t\t EBAL\n"    

    for j in `cat Employee.txt`
    do
        eno=$(echo "$j" | cut -d "," -f 1)
        enm=$(echo "$j" | cut -d "," -f 2)
        eadd=$(echo "$j" | cut -d "," -f 3)
        eage=$(echo "$j" | cut -d "," -f 4)
        egen=$(echo "$j" | cut -d "," -f 5)
        
        edes=$(echo "$j" | cut -d "," -f 6)
        ebal=$(echo "$j" | cut -d "," -f 7)
        tfval=$(echo "$j" | cut -d "," -f 8)
        if [ $tfval = "true" ]
        then
            printf "_______________________________________________________________________________________\n"
            printf "$eno \t $enm \t\t $eadd \t\t $eage \t $egen \t $edes \t $ebal\n"
        fi
    done   
    printf "_______________________________________________________________________________________\n\n\n\n"                       
}

Search()
{
    clear

    echo "Enter Employee NO: \c"
    read no

    echo "________________________________________________________________"                       
    echo "                 Employee Details                       "
    echo "________________________________________________________________"                       
    flag=0
    for j in `cat Employee.txt`
    do
        eno=$(echo "$j" | cut -d "," -f 1)
        enm=$(echo "$j" | cut -d "," -f 2)
        eadd=$(echo "$j" | cut -d "," -f 3)
        eage=$(echo "$j" | cut -d "," -f 4)
        egen=$(echo "$j" | cut -d "," -f 5)
        edes=$(echo "$j" | cut -d "," -f 6)
        ebal=$(echo "$j" | cut -d "," -f 7)
        tfval=$(echo "$j" | cut -d "," -f 8)
                                
        if [ $no -eq $eno ] && [ $tfval = "true" ]
        then
            flag=1
            echo "________________________________________________________________"                        
            echo "  ENo : $eno                      EName : $enm            "  
            echo "________________________________________________________________"                        
            echo "  EAdd                    :                      $eadd   "
            echo "  EAge                    :                      $eage   "
            echo "  EGen                    :                      $egen   "
            echo "________________________________________________________________"                        
            echo "  EDes                    :                      $edes   "
            echo "________________________________________________________________"                        
            echo "  ESal                      :                    $ebal   "
            echo "________________________________________________________________"                        
        fi
    done
    if [ $flag = 0 ]
    then
        echo "               No Record Found              "
    fi
    printf "________________________________________________________________\n\n\n"                          

}
Delete()
{
    clear
    f=0
    echo "Enter Employee NO: \c"
    read no

    for j in `cat Employee.txt`
    do
        eno=$(echo "$j" | cut -d "," -f 1)
        enm=$(echo "$j" | cut -d "," -f 2)
        eadd=$(echo "$j" | cut -d "," -f 3)
        eage=$(echo "$j" | cut -d "," -f 4)
        egen=$(echo "$j" | cut -d "," -f 5)
        edes=$(echo "$j" | cut -d "," -f 6)
        ebal=$(echo "$j" | cut -d "," -f 7)
        
        if [ $no -eq $eno ]
        then
            f=1                              
            line=$(echo "$eno,$enm,$eadd,$eage,$egen,$edes,$ebal,false")
            fnm=`cat Employee.txt`
            d=$(echo "$fnm" | sed s/$j/$line/g )
            echo $d > Employee.txt          
            printf "                 Delete Successfully                           \n\n\n"
        fi
    done
    if [ f = 0 ]
    then
        printf "               No Record Found              \n\n\n"
    fi
}

Update()
{
    clear

    echo "Enter Employee NO: \c"
    read no
         
    for j in `cat Employee.txt`
    do
        eno=$(echo "$j" | cut -d "," -f 1)
        enm=$(echo "$j" | cut -d "," -f 2)
        eadd=$(echo "$j" | cut -d "," -f 3)
        eage=$(echo "$j" | cut -d "," -f 4)
        egen=$(echo "$j" | cut -d "," -f 5)
        edes=$(echo "$j" | cut -d "," -f 6)
        ebal=$(echo "$j" | cut -d "," -f 7)

        
        if [ $no -eq $eno ]
        then
            echo "______________Enter New Record______________"
            echo "Enter Employee No: $eno"

            echo "Enter Employee Name: \c"
            read enm

            echo "Enter Employee Address: \c"
            read eadd

            echo "Enter Employee Age : \c"
            read eage

            echo "Enter Employee Gender: \c"
            read egen

            echo "Enter Employee Designation : \c"
            read edes

            echo "Enter Employee Basic Salary : \c"
            read ebal


            line=$(echo "$eno,$enm,$eadd,$eage,$egen,$edes,$ebal,true")

            #line=$(echo "$eno,$snm,$m1,$m2,$m3,$total,$per,true")
            fnm=`cat Employee.txt`
            d=$(echo "$fnm" | sed s/$j/$line/g )
            echo $d > Employee.txt          
            
            echo "                 Update Sucessfully                           "

        fi
    done
}

                                                                                      
while [ true ]
do
echo " ______ __  __ _____  _      ______     ________ ______   _____  ____  __  __  _____ "
echo "|  ____|  \/  |  __ \| |    / __ \ \   / /  ____|  ____| |  __ \|  _ \|  \/  |/ ____|"
echo "| |__  | \  / | |__) | |   | |  | \ \_/ /| |__  | |__    | |  | | |_) | \  / | (___  "
echo "|  __| | |\/| |  ___/| |   | |  | |\   / |  __| |  __|   | |  | |  _ <| |\/| |\___ \ "
echo "| |____| |  | | |    | |___| |__| | | |  | |____| |____  | |__| | |_) | |  | |____) |"
echo "|______|_|  |_|_|    |______\____/  |_|  |______|______| |_____/|____/|_|  |_|_____/ "
echo " _____________________________________________________________________________________"
echo " 1. Insert  "
echo " 2. Delete  "
echo " 3. Update  "
echo " 4. Display "
echo " 5. Search  "
echo " 6. Exit    "
echo " ______________________________________________________________________________________" 
echo "Enter Choice: "
read ch

case $ch in

            1)
               nxtSrNo=$(AutoNumber)
               Insert $nxtSrNo
               ;;
            2) Delete ;;
            3) Update ;;
            4) Display ;;
            5) Search ;;
            6) break;;
            *) echo " Wrong Choice "
esac
done                                                        
