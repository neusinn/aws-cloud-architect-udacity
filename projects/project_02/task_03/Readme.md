# Cloud Developer ND Course 2: Design for Performance and Scalability
** Design, Provision and Monitor AWS Infrastructure at Scale **


## Task 3: Configure Permissions.
In order to complete this task, please ensure your IAM users have been granted access to the billing dashboard (Activating Access to the Billing and Cost Management Console).

1. Update the AWS password policy.
2. Create a Group named CloudTrailAdmins and give it the two CloudTrail privileges.
3. Create a Group named Reviewers and give it the Billing privilege.
4. Configure a user named CloudTrail and a user named Accountant. Give the users AWS Console access and assign them a password that conforms to your password policy. Require them to change their password when they login.
5. Assign CloudTrail to the CloudTrailAdmins group. Assign Accountant to the Reviewers group .
6. Test both user accounts by logging into the AWS console as the users CloudTrail and Accountant after changing their passwords on login. Login using your numerical AccountID
7. While logged-in as the user CloudTrail, go to the CloudTrail page and create a trail named Udacity_Trail. Enable logging on all Read/Writes Management Events and S3 and Lambda events Data Events. Create a new S3 Bucket to store the CloudTrail log. There is no need for advanced configuration.
8. Download the portion of the CloudTrail log that shows the entire Task 3 timeframe and save it as UdacityCloudTrailLog.csv.
9. Before Logging off, return to the CloudTrail configuration page. Disable S3 logging.
