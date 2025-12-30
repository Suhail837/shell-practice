#!/bin/bash

# checking whether root user or not

USERID=$(id -u)

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

# checking whether mysql is installwed or not 

dnf installed mysql

if [$? -ne 0]
then    
    echo "mysql is not installed"
    dnf install mysql -y
    Validate $? "MYSQL"
else
    echo "mysql is already  installed"   
fi

# checking whether pyhtonpyhton is installwed or not 

dnf installed python3

if [$? -ne 0]
then    
    echo "python3 is not installed"
    dnf install python3 -y
    Validate $? "python3"
else
    echo "python3 is already  installed"   
fi

# checking whether nginx is installwed or not 

dnf installed nginx

if [$? -ne 0]
then    
    echo "nginx is not installed"
    dnf install nginx -y
     Validate $? "nginx"
else
    echo "nginx is already  installed"   
fi
     

