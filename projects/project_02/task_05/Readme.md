# Cloud Developer ND Course 2: Design for Performance and Scalability
** Design, Provision and Monitor AWS Infrastructure at Scale **


### Part 1
Download the [starter code](https://github.com/udacity/cand-c2-project).
In the main.tf file write the code to provision

AWS as the cloud provider
Use an existing VPC ID
Use an existing public subnet
4 AWS t2.micro EC2 instances named Udacity T2
2 m4.large EC2 instances named Udacity M4
Run Terraform.

Take a screenshot of the 6 EC2 instances in the AWS console. Save it as Terraform_1_1.png or Terraform_1_1.jpg .
Use Terraform to delete the 2 m4.large instances.
Take an updated screenshot of the AWS console showing only the 4 t2.micro instances and save it as Terraform_1_2.png or Terraform_1_2.jpg

### Part 2
In the Exercise_2 folder, write the code to deploy an AWS Lambda Function using Terraform. Your code should include:

A lambda.py file
A main.tf file
An outputs.tf file
A variables.tf file

Take a screenshot of the EC2 instances page and save it as Terraform_2_1.png or Terraform_2_1.jpg.
Take a screenshot of the VPC page and save it as Terraform_2_2.png or Terraform_2_2.jpg.
Take a screenshot of the CloudWatch log entry for the lambda function execution and save it as Terraform_2_3.png or Terraform_2_3.jpg.