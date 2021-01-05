# Cloud Developer ND Course 2: Design for Performance and Scalability
** Design, Provision and Monitor AWS Infrastructure at Scale **

# Task 1: Create AWS Architecture Schematics
## Part 1
You have been asked to plan and provision a cost-effective AWS infrastructure for a new social media application development project for 50,000 single-region users. The project requires the following AWS infrastructure and services. Please include your name and label all elements of the infrastructure on the diagram.

Infrastructure in the following regions: us-east-1
- Users and Client machines
- One VPC
- Two Availability Zones
- Four Subnets (2 Public, 2 Private)
- A NAT Gateway
- A CloudFront distribution with an S3 bucket
- Web servers in the Public Subnets sized according to your usage estimates
- Application Servers in the Private Subnets sized according to your usage estimates
- DB Servers in the Private Subnets
- Web Servers Load Balanced and Autoscaled
- Application Servers Load Balanced and Autoscaled
- A Master DB in AZ1 with a read replica in AZ2

## Part 2
You have been asked to plan a SERVERLESS architecture schematic for a new application development project. The project requires the following AWS infrastructure and services.

- A user and client machine
- AWS Route 53
- A CloudFront Distribution
- AWS Cognito
- AWS Lambda
- API Gateway
- DynamoDB
- S3 Storage


# Suggestions to Make Your Project Stand Out!
Enhance the original infrastructure to demonstrate a solution suitable for >> 1 million concurrent users: Include multiple regions, Decoupling, CloudFront Distributions, Load Balancing, Auto-Scaling, Route 53 Optimization, Serverless Functions, etc
Demonstrate an understanding of decoupling by using AWS Lambda, SQS, and SNS in the infrastructure Diagram
Use Terraform to provision the following infrastructure in two regions: A VPC, Public subnets, EC2 instance with 20 GB EBS storage, S3 buckets in both regions. Create vars.tf, outputs.tf, main.tf. Save the terraform files in folders as modules. Upload the modules to GitHub
Configure additional CloudWatch alarms to send alerts for CPU usage, memory usage or other metrics.to a valid email address. Alarms related to infrastructure would be particularly impressive