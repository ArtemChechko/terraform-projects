![Alt text](architecture-diagram.jpg)
---

# Dynamic Ecommerce Website on AWS with Terraform

## Table of Contents
- [Introduction](#introduction)
- [Prerequisites](#prerequisites)
- [Setup Instructions](#setup-instructions)
  - [1. Install Terraform](#1-install-terraform)
  - [2. GitHub Setup](#2-github-setup)
  - [3. Install Git](#3-install-git)
  - [4. SSH Key Pairs](#4-ssh-key-pairs)
  - [5. Visual Studio Code](#5-visual-studio-code)
  - [6. AWS CLI Setup](#6-aws-cli-setup)
- [AWS Setup](#aws-setup)
  - [1. IAM User Creation](#1-iam-user-creation)
  - [2. S3 Bucket for Terraform State](#2-s3-bucket-for-terraform-state)
- [Terraform Code Deployment](#terraform-code-deployment)
  - [1. Git Repository Setup](#1-git-repository-setup)
  - [2. Cloning Repository](#2-cloning-repository)
  - [3. Creating a 3-Tier VPC](#3-creating-a-3-tier-vpc)
  - [4. NAT Gateway Creation](#4-nat-gateway-creation)
  - [5. Security Groups Creation](#5-security-groups-creation)
  - [6. RDS Instance Creation](#6-rds-instance-creation)
  - [7. Application Load Balancer Creation](#7-application-load-balancer-creation)
  - [8. SNS Topic Creation](#8-sns-topic-creation)
  - [9. Auto Scaling Group Creation](#9-auto-scaling-group-creation)
  - [10. Route 53 Record Set](#10-route-53-record-set)
  - [11. Terraform Outputs](#11-terraform-outputs)
- [Clean Up](#clean-up)
- [References](#references)

## Introduction
This project deploys a dynamic ecommerce website on AWS using Terraform. It automates the creation of the infrastructure needed to support a highly available and scalable ecommerce platform.

## Prerequisites
Before you begin, ensure you have the following tools and accounts:
- AWS account
- Terraform installed
- Visual Studio Code with Terraform extension
- GitHub account
- Git installed
- AWS CLI installed and configured

## Setup Instructions

### 1. Install Terraform
Install Terraform by following the [official guide](https://developer.hashicorp.com/terraform/downloads).

### 2. GitHub Setup
- Create a GitHub account if you don't have one.
- Create a new private repository to store your Terraform code.

### 3. Install Git
Install Git by following the instructions [here](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git).

### 4. SSH Key Pairs
- Generate an SSH key pair on your local machine.
- Add the public key to your GitHub account. Instructions can be found [here](https://docs.github.com/en/authentication/connecting-to-github-with-ssh).

### 5. Visual Studio Code
Install Visual Studio Code and the Terraform extension from the [Visual Studio Code Marketplace](https://marketplace.visualstudio.com/items?itemName=HashiCorp.terraform).

### 6. AWS CLI Setup
Install and configure the AWS CLI:
- [Installation Guide](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html)
- Run the following command to configure your AWS CLI with a specific profile:
  ```sh
  aws configure --profile "profile_name"
  ```

## AWS Setup

### 1. IAM User Creation
- Create an IAM user with the necessary policies to manage resources in AWS.
- Generate an access key and secret access key for programmatic access.

### 2. S3 Bucket for Terraform State
- Create an S3 bucket with a unique name to store Terraform state files.
- Enable versioning on the bucket for state management. [Learn more](https://developer.hashicorp.com/terraform/language/state).

## Terraform Code Deployment

### 1. Git Repository Setup
- Add a README file to your repository.
- Add a `.gitignore` file using the Terraform template to exclude unnecessary files.

### 2. Cloning Repository
Clone the repository to your local machine using:
```sh
git clone <repository-url>
```

### 3. Creating a 3-Tier VPC
Create a 3-tier VPC with the following components using Terraform:
- Internet Gateway
- Public and private subnets
- Public route tables and route tables associations with public subnets

**Variables:**
- `vpc_cidr`
- `public_subnet_az1_cidr`
- `public_subnet_az2_cidr`
- `private_app_subnet_az1_cidr`
- `private_app_subnet_az2_cidr`
- `private_data_subnet_az1_cidr`
- `private_data_subnet_az2_cidr`

### 4. NAT Gateway Creation
Create a NAT Gateway with Terraform:
- Elastic IPs
- Private route tables and associations with private subnets

### 5. Security Groups Creation
Create security groups for various components using Terraform:
- Application Load Balancer Security Group
- Bastion Security Group (if needed)
- Application Server Security Group
- Database Security Group

**Variable:**
- `ssh_location`

### 6. RDS Instance Creation
Create an RDS instance with Terraform:
- Database subnet group
- Database instance

**Variables:**
- `database_snapshot_identifier`
- `database_instance_class`
- `database_instance_identifier`
- `multi_az_deployment`

### 7. Application Load Balancer Creation
Create an Application Load Balancer with Terraform:
- Target Group
- Health Check
- HTTP and HTTPS listeners

**Variable:**
- `ssl_certificate_arn`

### 8. SNS Topic Creation
Create an SNS topic using Terraform:
**Variable:**
- `operator_email`

### 9. Auto Scaling Group Creation
Create an Auto Scaling Group for ECS service with Terraform:
- Auto Scaling Group
- Scaling policy

**Variables:**
- `launch_template_name`
- `ec2_image_id`
- `ec2_instance_type`
- `ec2_key_pair_name`

### 10. Route 53 Record Set
Create a Route 53 Record Set using Terraform:
**Variables:**
- `domain_name`
- `record_name`

### 11. Terraform Outputs
Define and manage Terraform outputs in the `outputs.tf` file to capture essential resource information.

## Clean Up
To destroy the resources created by Terraform, run the following command:
```sh
terraform destroy --auto-approve
```

## References
- [Terraform Documentation](https://developer.hashicorp.com/terraform)
- [AWS CLI Documentation](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html)

---

You can customize this template based on your project's specific details and requirements.
