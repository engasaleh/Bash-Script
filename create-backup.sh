#!/bin/bash 
# Author: Abdallah Saleh
# Date: 19-Apr-2026
# Description: This script creates a backup of the specified directory /etc & /var and saves it to the specified location.
# Modified: 19-Apr-2026


tar cvf /tmp/backup.tar /etc /var

gzip /tmp/backup.tar 

find /tmp/backup.tar.gz -mtime -1 -type f -print &> /dev/null

if [ $? -eq 0 ] 
then 
echo "Backup created successfully"
echo 
echo "Archiving backup"
# scp /tmp/backup.tar.gz root@192.168.1.x:/path
else
echo "Backup creation failed"
fi


