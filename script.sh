#!/bin/bash

time=$(date +"%m-%d-%Y_%H_%M_%S")
Backup_file=$1
Dest=/home/ubuntu/final-project/backup
filename="file-backup-$time.tar.gz"
LOG_FILE="/home/ubuntu/final-project/backup/logfile.log"

S3_BUCKET="s3-new-course"
FILE_TO_UPLOUD="$Dest/$filename"

if ! command -v aws &> /dev/null
then
    echo "AWS CLI is not installed. please install it first."
    exit 1
fi

if [ -f "$Dest/$filename" ]
then
    echo "Error: file $filename already exists!" | tee -a "$LOG_FILE"
else
    tar -czvf "$Dest/$filename" "$Backup_file"
    echo
    echo "Backup Completed successfully. Backup file $Dest/$filename" | tee -a "$LOG_FILE"
    aws s3 cp "$FILE_TO_UPLOUD" "s3://$S3_BUCKET/"
    if [ $? -eq 0 ]
    then
        echo
        echo "File Uploaded successfully to the S3 bucket: $S3_BUCKET"
    else
        echo "File upload to S3 failed"
    fi
fi




