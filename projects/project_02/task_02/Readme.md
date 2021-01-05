# Cloud Developer ND Course 2: Design for Performance and Scalability
** Design, Provision and Monitor AWS Infrastructure at Scale **

# Task 2: Calculate Infrastructure Costs
Use the AWS Pricing Calculator to estimate how much it will cost to run the services in your Part 1 diagram for one month.

Target a monthly estimate between $8,000-$10,000.
Be mindful of AWS regions when you are estimating costs.
Export the estimate as a CSV file named Initial_Cost_Estimate.csv.
Return to the AWS Pricing Calculator and reconfigure your estimates for the following scenarios:

Your budget has been reduced from $8,000-$10,000 to a maximum of $6,500. What services will you modify to meet this new budget? Export the updated costs in a CSV file named Reduced_Cost_Estimate.csv and write up a brief narrative of the changes you made in the CSV file below the cost estimate.

Your budget has been increased to $20,000. What resources will you add and why?
Think about where to add redundancy and how to improve performance. Re-configure your estimate to a monthly invoice of $18K-20K. Export the updated costs to a CSV file named Increased_Cost Estimate.csv and write up a brief narrative of the changes you made in the CSV file below the cost estimate.

## Inital calculation base
- region : us-east-1
- Web Servers
    Operating system (Linux), Quantity (4), Pricing strategy (EC2 Instance Savings Plans 1 Year No Upfront), Storage for each EC2 instance (Provisioned IOPS SSD (io1)), Storage amount (1 TB), Provisioning IOPS (1000), Instance type (c5.9xlarge)
- App Servers
    Operating system (Linux), Quantity (4), Pricing strategy (On-Demand Instances 1 Year No Upfront), Storage for each EC2 instance (Provisioned IOPS SSD (io1)), Storage amount (1 TB), Provisioning IOPS (1000), Instance type (t3.xlarge)
- Databse
    Quantity (2), Pricing strategy (On-Demand Instances 1 Year No Upfront), Storage for each RDS instance (General Purpose SSD (gp2)), Storage amount (250 GB), Instance type (db.m5.8xlarge), Additional backup storage (2 TB)
- Load Balancer
    Number of Application Load Balancers (2)
- VPC : Network Address Translation (NAT) Gateway
    Number of NAT Gateways (2)
- Elastic IP 
    Number of EC2 instances (4), Number of EIPs per instance (1), Number of EIP remaps (10)
- Amazone Route 53
    Number of Elastic Network Interfaces (2)
- Amazone Cloud Front
- S3 Bucket
    S3 Standard storage (10 TB per month)
- AWS Data Transfer
    DT Inbound: All other regions (1 TB per month), DT Outbound: All other regions (20 TB per month), DT Outbound: Not selected (0 TB per month), DT Intra-Region: (0 TB per month), Data transfer cost (409.6)
- AWS Cloudfront
    (Currentliy there ist no price calculator for Amazone Cloudfront)


Inital Estimate :  https://calculator.aws/#/estimate?id=8f02b0b17ee43f862594c1a919697c71d72e8b1c
Total montly cost: 9717 USD


## Reduced budged calculation  
- Database
    - Reduced Size of DB Instance to db.m5.4xlarge
    - Use Multi-AZ but only one instance and a read replica
    - Pricing Strategy: Standard reserved Instances for on year
    Quantity (1), Pricing strategy (On-Demand Instances 1 Year No Upfront), Storage for each RDS instance (General Purpose SSD (gp2)), Storage amount (250 GB), Instance type (db.m5.4xlarge), Additional backup storage (2 TB)
- Web Server 
    - reduced instance size to c5.4xlarge
    Operating system (Linux), Quantity (4), Pricing strategy (On-Demand Instances 1 Year Partial Upfront), Storage for each EC2 instance (Provisioned IOPS SSD (io1)), Storage amount (1 TB), Provisioning IOPS (1000), Instance type (c5.4xlarge)
- VPC: Number of NAT Gateways (reduced to 1)
- Number of Elastic Network Interfaces (reduced to 12)

Reduced Estimate :  https://calculator.aws/#/estimate?id=ca81b01421dfd8c941d6799baa410ea0e63f5cb0
Total montly cost: 6031 USD

## Enhanced performance calculation
- Database
    - increased instance size to db.m5.12large
    - increased storage to 1 GB
    - increased backup storage to 5 TB
    Quantity (2), Pricing strategy (On-Demand Instances 1 Year No Upfront), Storage for each RDS instance (General Purpose SSD (gp2)), Storage amount (1 GB), Instance type (db.m5.12xlarge), Additional backup storage (5 TB)
- Web Server
    - 8 instances
    - 2 TB storage
    Operating system (Linux), Quantity (8), Pricing strategy (EC2 Instance Savings Plans 1 Year No Upfront), Storage for each EC2 instance (Provisioned IOPS SSD (io1)), Storage amount (2 TB), Provisioning IOPS (1000), Instance type (c5.9xlarge)
- App Server
    - increase instance number to 8
    - increased storage to 2 TB
Operating system (Linux), Quantity (8), Pricing strategy (On-Demand Instances 1 Year No Upfront), Storage for each EC2 instance (Provisioned IOPS SSD (io1)), Storage amount (2 TB), Provisioning IOPS (1000), Instance type (t3.xlarge)

Increased Cost Estimate: https://calculator.aws/#/estimate?id=068adcad9a0c3fcc4f5c53208ef68044a07c15b9
