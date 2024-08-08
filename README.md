# Dynamic Web App Hosting on AWS with Terraform, Docker, Amazon ECR, and ECS

This project demonstrates how to host a dynamic web application on AWS using Terraform for infrastructure as code, Docker for containerization, Amazon ECR for storing container images, and Amazon ECS for container orchestration.

## Prerequisites

Before you begin, ensure you have the following installed and configured:

1. **AWS Account:** Sign up at [AWS](https://aws.amazon.com/).
2. **Terraform:** [Install Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli).
3. **Git:** [Install Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git).
4. **Visual Studio Code:** [Install VS Code](https://code.visualstudio.com/download) and the [Terraform extension](https://marketplace.visualstudio.com/items?itemName=HashiCorp.terraform).
5. **AWS CLI:** [Install AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html) and configure it by running:

    ```bash
    aws configure --profile "your-profile-name"
    ```

6. **GitHub Account:** Create an account at [GitHub](https://github.com/) and set up SSH key pairs for secure access.

## Setup Guide

### Step 1: Create an IAM User in AWS

1. Create an IAM user with the necessary policies attached.
2. Generate an access key and secret access key for programmatic access.
3. Configure your AWS CLI with the generated credentials using:

    ```bash
    aws configure --profile "your-profile-name"
    ```

### Step 2: Store Terraform State with S3

1. Create an S3 bucket with a unique name and enable versioning to store the Terraform state file.
2. Create a DynamoDB table with `LockID` as the partition key to enable state locking.

### Step 3: Git Repository Setup

1. Create a private GitHub repository to store your Terraform code.
2. Add a `.gitignore` file using the Terraform template.
3. Clone the repository to your local machine:

    ```bash
    git clone git@github.com:your-username/your-repository.git
    ```

### Step 4: Terraform Configuration

1. **Provider Configuration:**
   
   Create a `provider.tf` file to establish a secure connection between Terraform and AWS:

    ```hcl
    provider "aws" {
      region  = "your-region"
      profile = "your-profile-name"

      default_tags {
        tags = {
          "Automation"  = "Terraform"
          "Project"     = "DynamicWebApp"
          "Environment" = "Production"
        }
      }
    }
    ```

2. **Backend Configuration:**

   Create a `backend.tf` file to configure S3 for storing and DynamoDB for locking the Terraform state:

    ```hcl
    terraform {
      backend "s3" {
        bucket         = "your-bucket-name"
        key            = "path/to/terraform.tfstate"
        region         = "your-region"
        profile        = "your-profile-name"
        dynamodb_table = "your-dynamodb-table-name"
      }
    }
    ```

### Step 5: Create AWS Resources with Terraform

1. **VPC Setup:**
   
   Define variables and create a 3-Tier VPC with public and private subnets, an internet gateway, and route tables.

2. **NAT Gateway:**
   
   Create NAT gateways for private subnets using Terraform.

3. **Security Groups:**
   
   Define security groups for the application load balancer, ECS tasks, and other necessary resources.

4. **RDS Instance:**
   
   Provision an RDS instance with Terraform, including database subnet groups and multi-AZ deployment if needed.

5. **SSL Certificate:**
   
   Request an SSL certificate via ACM and validate it using Route 53.

6. **Application Load Balancer:**
   
   Create an ALB with associated target groups and health checks.

7. **S3 Bucket:**
   
   Create an S3 bucket to store the `.env` file for your application.

8. **ECS Task Execution Role:**
   
   Create an IAM role with the necessary policies for ECS task execution.

9. **ECS Service:**
   
   Set up ECS clusters, task definitions, and services using Terraform.

10. **Auto Scaling:**
    
    Configure an Auto Scaling Group to manage the ECS service scaling.

11. **Route 53 Record Set:**
    
    Create a Route 53 DNS record for your application.

### Step 6: Assign Values to Terraform Variables

Define the necessary values in a `terraform.tfvars` file to customize your deployment.

### Step 7: Deploy the Infrastructure

Run the following commands to deploy your infrastructure:

```bash
terraform init
terraform plan
terraform apply
```

### Step 8: Clean Up

Once you're done with the project, you can destroy the infrastructure by running:

```bash
terraform destroy
```

---

Feel free to customize the README further based on your specific project needs!
