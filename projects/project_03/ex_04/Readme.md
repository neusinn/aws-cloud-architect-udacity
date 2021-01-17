# Project 03 - AWS Cloud Architect - Udacity Nanodegree

## Exercise 4 - Implement Security Hardening

**_Deliverables for Exercise 4:_**
- **E4T1.txt** - Answer to the prompts in Exercise 4, Task 1.
- **E4T2_sshbruteforce.png** - Screenshot of terminal window showing the brute force attack and the remediation.
- **E4T2_networksg.png** - Screenshot of the security group change. 
- **E4T2_sshattempt.png** - Screenshot of your SSH attempt.
- **E4T2_s3iampolicy.png** - Screenshot of the updated IAM policy.
- **E4T2_s3copy.png** - Screenshot of the failed copy attempt.
- **E4T2_s3encryption.png** - screenshot of the S3 bucket policy
- **E4T3_securityhub.png** - Screenshot of Security Hub after reevaluating the number of findings.
- **E4T3_config.png** - Screenshot of Config after reevaluating the number of findings.
- **E4T3_inspector.png** - Screenshot of Inspector after reevaluating the number of findings.
- **E4T4.txt** - Answers from prompts in Exercise 4, Task 4.
- _Optional_ **c3-app_solution.yml** and **c3-s3_solution.yml** - Updated cloud formation templates which reflect changes made in E4 tasks related to AWS configuration changes.
- _Optional_ **E4T5.txt** - Additional hardening suggestions from Exercise 4, Task 5.

### Task 1 - Remediation plan

As a Cloud Architect, you have been asked to apply security best practices to the environment so that it can withstand attacks and be more secure.
1. Identify 2-3 changes that can be made to our environment to prevent an SSH brute force attack from the internet.
2. Neither instance should have had access to the secret recipes bucket; even in the instance that API credentials were compromised how could we have prevented access to sensitive data?

Submit answer in E4T1.txt

**Deliverables:**
- **E4T1.txt** - Answer to the prompts in Exercise 4, Task 1.

### Task 2 - Hardening

#### Remove SSH Vulnerability on the Application Instance

1. To disable SSH password login on the application server instance.

```
# open the file /etc/ssh/sshd_config
sudo vi /etc/ssh/sshd_config

# Find this line:
PasswordAuthentication yes

# change it to:
PasswordAuthentication no

# save and exit

#restart SSH server
sudo service ssh restart
```
```
vonallmen$  ssh -i ~/.ssh/mva_aws.pem ubuntu@100.26.62.164
ubuntu@ip-10-192-10-188:~$ sudo nano /etc/ssh/sshd_config
# Change PasswordAuthentication to 
PasswordAuthentication no
ubuntu@ip-10-192-10-188:~$ sudo service ssh restart

```


2. Test that this made a difference.  Run the brute force attack again from Exercise 3, Task 1.  

3. Take a screenshot of the terminal window where you ran the attack highlighting the remediation and name it E4T2_sshbruteforce.png.

**Deliverables:**
- **E4T2_sshbruteforce.png** - Screenshot of terminal window showing the brute force attack and the remediation.

#### Apply Network Controls to Restrict Application Server Traffic

1. Update the security group which is assigned to the web application instance.  The requirement is that we only allow connections to port 5000 from the public subnet where the application load balancer resides.
2. Test that the change worked by attempting to make an SSH connection to the web application instance using its public URL.
3. Submit a screenshot of the security group change and your SSH attempt.

**Deliverables**:
- **E4T2_networksg.png** - Screenshot of the security group change. 
- **E4T2_sshattempt.png** - Screenshot of your SSH attempt.

#### Least Privilege Access to S3  

1. Update the IAM policy for the instance profile role used by the web application instance to only allow read access to the free recipes S3 bucket.
From:
```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "s3:*",
            "Resource": "*",
            "Effect": "Allow"
        }
    ]
}
```
to:
```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "s3:GetObject",
                "s3:ListBucket"
            ],
            "Resource": [
                "arn:aws:s3:::cand-c3-free-recipes-XXXXXXXX4723/*",
                "arn:aws:s3:::cand-c3-free-recipes-XXXXXXXX4723"
            ]
        }
    ]
}
```

2. Test the change by using the attack instance to attempt to copy the secret recipes.
```
ubuntu@ip-10-192-11-164:~$ aws s3 cp s3://cand-c3-secret-recipes-XXXXXXXX4723/secret_recipe.txt  .  --region us-east-1
fatal error: An error occurred (403) when calling the HeadObject operation: Forbidden
```
3. Submit a screenshot of the updated IAM policy and the attempt to copy the files. 

**Deliverables:**
- **E4T2_s3iampolicy.png** - Screenshot of the updated IAM policy.
- **E4T2_s3copy.png** - Screenshot of the failed copy attempt.

#### Apply Default Server-side Encryption to the S3 Bucket

This will cause the S3 service to encrypt any objects that are stored going forward by default.
Use the below guide to enable this on both S3 buckets.   
[Amazon S3 Default Encryption for S3 Buckets](https://docs.aws.amazon.com/AmazonS3/latest/dev/bucket-encryption.html)

Capture the screenshot of the secret recipes bucket showing that default encryption has been enabled.

**Deliverables**:
- **E4T2_s3encryption.png** - Screenshot of the S3 bucket policy.

### Task 3: Check Monitoring Tools to see if the Changes that were made have Reduced the Number of Findings

1. Go to AWS inspector and run the inspector scan that was run in Exercise 2.
2. After 20-30 mins - check Security Hub to see if the finding count reduced.
3. Check AWS Config rules to see if any of the rules are now in compliance.
4. Submit screenshots of Inspector, Security Hub, and AWS Config titled E4T3_inspector.png, E4T3_securityhub.png, and E4T3_config.png respectively.

**Deliverables**:
- **E4T3_securityhub.png** - Screenshot of Security Hub after reevaluating the number of findings.
- **E4T3_config.png** - Screenshot of Config after reevaluating the number of findings.
- **E4T3_inspector.png** - Screenshot of Inspector after reevaluating the number of findings.

### Task 4: Questions and Analysis

1. What additional architectural change can be made to reduce the internet-facing attack surface of the web application instance.
2. Assuming the IAM permissions for the S3 bucket are still insecure, would creating VPC private endpoints for S3 prevent the unauthorized access to the secrets bucket.
3. Will applying default encryption setting to the s3 buckets encrypt the data that already exists?
4. The changes you made above were done through the console or CLI; describe the outcome if the original cloud formation templates are applied to this environment?

Submit your answers in E4T4.txt.

**Deliverables**:
- **E4T4.txt** - Answers from prompts in Exercise 4, Task 4.

###  _Optional Standout Suggestion_ Task 5 - Additional Hardening

Make changes to the environment by updating the cloud formation template. You would do this by copying c3-app.yml and c3-s3.yml and putting your new code into c3-app_solution.yml and c3-s3_solution.yml.
Brainstorm and list additional hardening suggestions aside from those implemented that would protect the data in this environment. Submit your answers in E4T5.txt.

**Deliverables**:
- _Optional_ **c3-app_solution.yml** and **c3-s3_solution.yml** - updated cloud formation templates which reflect changes made in E4 tasks related to AWS configuration changes.
- _Optional_ **E4T5.txt** - Additional hardening suggestions from Exercise 4, Task 5.
