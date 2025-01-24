# Automate-VM-Data

**Using Bash Script and Scheduling to Automate VM Data Backup & Replication to an Amazon S3 Bucket in AWS**

Create a Bash script that runs on a schedule to compress and back up critical data on a virtual machine (EC2 Instance) in AWS.

## Key Features

- **Backup Scheduling**: 
  - Allow users to schedule backups at specific times or intervals (e.g., daily, weekly, or monthly).

- **Backup Compression**: 
  - Compress the backup files to save storage space using the `tar` command with `gzip` (`tar -czf`) or other compression methods.

- **Logging**: 
  - Create log files to record backup operations, including start time, end time, and any errors encountered during the backup.

- **AWS Integration**: 
  - Seamlessly integrate with the AWS Command Line Interface (CLI) for secure and efficient uploads to Amazon S3 bucket.

## Commands

### Step 1: Create an IAM User

Use the AWS Management Console or the AWS CLI:

**Using the AWS Management Console:**

1. Navigate to the IAM service.
2. Click "Users" and then "Add user."
3. Enter a user name and select "Programmatic access."
4. Click "Next: Permissions."
5. Attach an existing policy or create a new one. For S3 bucket creation, you'll need a policy that grants the necessary permissions (e.g., "AmazonS3FullAccess").
6. Click "Next: Tags" (optional) and "Next: Review."
7. Review the user details and click "Create user."
8. Download the user's credentials (Access Key ID and Secret Access Key). Store these securely as you will not be able to retrieve them later.

### Step 2: Grant Permissions to Create S3 Buckets

- Attach a managed policy:
  - The easiest way is to attach the "AmazonS3FullAccess" managed policy to the IAM user. However, this grants broad permissions.

### Step 3: Install AWS CLI on Ubuntu

1. **Update package lists:**

   ```bash
   sudo apt update
 2. **Install necessary packages:
    ```bash
    sudo apt install python3-pip
3. **Install AWS CLI

   ```bash
   sudo pip3 install awscli --upgrade --user
   
4. **Create an S3 Bucket
Use the AWS CLI command:
   ```bash
   aws s3api create-bucket --bucket <your_bucket_name> --region <your_region> --create-bucket-configuration LocationConstraint=<your_region>
Step 5: Add the Bucket Name to Your Script

FinallgbMake sure to update your script with the S3 bucket name you created.

    
