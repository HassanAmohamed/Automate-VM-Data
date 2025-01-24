# Automate-VM-Data
Using Bash Script and Scheduling to Automate VM Data Backup &amp; Replication to an Amazon S3 Bucket in Aws
Create a bash Script that run on a schedule to copress and backup critical data on a virtual machine(EC2 Instance)in AWS.

Key Features:

Backup Schduling: Allow users to schedule backups at specific times or intervals (e.g., daily, weekly, or monthly)

Backup Compression: Compress the backup files to save storage space using the tar command with gzip(tar-czf) or other compression methods.

Logging: Create Log files to record backup operations, including start time, end thime, and any errors encountered during the backup.

AWS Integration: Seamlessly integrate with the AWS Command LIne Interface (CLI) fir secure and efficient uploads to Amazon S3-bucket.

Command 
first we make AMI rule 
Use the AWS Management Console or the AWS CLI:

Using the AWS Management Console:

Navigate to the IAM service.
Click "Users" and then "Add user."
Enter a user name and select "Programmatic access."
Click "Next: Permissions."
Attach an existing policy or create a new one. For S3 bucket creation, you'll need a policy that grants the necessary permissions (e.g., "AmazonS3FullAccess").
Click "Next: Tags" (optional) and "Next: Review."
Review the user details and click "Create user."
Download the user's credentials (Access Key ID and Secret Access Key). Store these securely as you will not be able to retrieve them later.

then 
Grant Permissions to Create S3 Buckets

Attach a managed policy:

The easiest way is to attach the "AmazonS3FullAccess" managed policy to the IAM user. However, this grants broad permissions.
then 
Install AWS CLI on Ubuntu

Update package lists:
Bash

sudo apt update
Install necessary packages:
Bash

sudo apt install python3-pip
Install AWS CLI:
Bash

sudo pip3 install awscli --upgrade --user 

then create s3 bucket 
2. Create an S3 Bucket

Use the AWS CLI command:
Bash

aws s3api create-bucket --bucket <your_bucket_name> --region <your_region> --create-bucket-configuration LocationConstraint=<your_region>

then add its name to our script .


