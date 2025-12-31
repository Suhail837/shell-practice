#!/bin/bash

# checking whether root user or not

USERID=$(id -u)

PACKAGES=("mysql" "python" "nginx" "https") # storing it in variables 

if [ USERID -ne 0 ]

then 
    echo "ERROR: please run the script with root user"
    exit 1 # give any number other than 0(zero)

else
    echo "u r running with root user"
fi


#validaiong function 

VALIDATE(){
    if [$1 -ne 0]
    then 
        echo "$2 insalled is success"
    else
        echo "$2 insalled is failed"
        exit 1
    fi
     
    }

for package in ${PACKAGES[@]}
do
    dnf list installed $pacakge 
    if [$? -ne 0]
    then    
         echo "$pacakge  is not installed"
        dnf install $pacakge  -y
        Validate $? "$pacakge "
    else
        echo -e  "$pacakge  is already  installed"   
    fi
done


