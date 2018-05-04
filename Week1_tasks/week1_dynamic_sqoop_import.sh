#!/bin/bash
#remya 30/04/2018

dynamic_sqoop_import () {

dbname=$1
tables=$2

echo Database Name = $dbname
echo Tables = $tables

if [ $tables == 'ALL' ]
then
        echo ALL
        	sqoop import-all-tables --connect jdbc:mysql://ybolmpr03.yotabites.com:3306/$dbname --username user1 --password-file /user/remya/mysql_password.txt --m 1
else
        for i in $(echo $tables | sed "s/,/ /g")
        do
                sqoop import --connect jdbc:mysql://ybolmpr03.yotabites.com:3306/$dbname --username user1 --password-file /user/remya/mysql_password.txt --table $i --m 1
        done
fi

}

dynamic_sqoop_import $1 $2


# Add the below line in 'crontab -e' in the shell
# 0 3 * * * /home/remya/dynamic_sqoop_import.sh training ALL
