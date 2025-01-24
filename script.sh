#!/bin/bash

# Get the current date and time formatted as month-day-year_hour_minute_second
time=$(date +"%m-%d-%Y_%H_%M_%S")

# The first argument passed to the script, which is the file to back up
Backup_file=$1

# Destination directory where the backup will be stored
Dest=/home/ubuntu/final-project/backup

# Name of the backup file including timestamp
filename="file-backup-$time.tar.gz"

# Log file path for recording backup operations
LOG_FILE="/home/ubuntu/final-project/backup/logfile.log"

# S3 bucket name where the backup will be uploaded
S3_BUCKET="s3-new-course"

# Full path to the file to upload to S3
FILE_TO_UPLOAD="$Dest/$filename"

# Check if AWS CLI is installed
if ! command -v aws &> /dev/null
then
    echo "AWS CLI is not installed. Please install it first."
    exit 1
fi

# Check if the backup file already exists
if [ -f "$Dest/$filename" ]
then
    echo "Error: file $filename already exists!" | tee -a "$LOG_FILE"
else
    # Create a compressed tarball of the backup file
    tar -czvf "$Dest/$filename" "$Backup_file"

    # Notify that the backup was completed successfully
    echo
    echo "Backup completed successfully. Backup file: $Dest/$filename" | tee -a "$LOG_FILE"

    # Upload the backup file to the specified S3 bucket
    aws s3 cp "$FILE_TO_UPLOAD" "s3://$S3_BUCKET/"
    
    # Check if the upload was successful
    if [ $? -eq 0 ]
    then
        echo
        echo "File uploaded successfully to the S3 bucket: $S3_BUCKET"
    else
        echo "File upload to S3 failed"
    fi
fi