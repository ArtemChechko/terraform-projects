# vpc variables
variable "vpc_cidr" {
  default       = "10.0.0.0/16"
  description   = "vpc cidr block"
  type          = string
}

variable "public_subnet_az1_cidr" {
  default       = "10.0.0.0/24"
  description   = "public subnet az1 cidr block"
  type          = string  
}

variable "public_subnet_az2_cidr" {
  default       = "10.0.1.0/24"
  description   = "public subnet az2 cidr block"
  type          = string  
}

variable "private_app_subnet_az1_cidr" {
  default       = "10.0.2.0/24"
  description   = "private app subnet az1 cidr block"
  type          = string  
}

variable "private_app_subnet_az2_cidr" {
  default       = "10.0.3.0/24"
  description   = "private app subnet az2 cidr block"
  type          = string  
}

variable "private_data_subnet_az1_cidr" {
  default       = "10.0.4.0/24"
  description   = "private data subnet az1 cidr block"
  type          = string  
}

variable "private_data_subnet_az2_cidr" {
  default       = "10.0.5.0/24"
  description   = "private data subnet az2 cidr block"
  type          = string  
}

# security groups variables
variable "ssh_location" {
  default = "176.36.83.49/32"
  description = "the ip address that can ssh into ec2 instance"
  type = string
}

# rds variables
variable "database_snapshot_identifier" {
  default = "arn:aws:rds:us-east-1:471112565759:snapshot:dev-rds-db-snapshot"
  description = "database snapshot arn"
  type = string
}

variable "database_instance_class" {
  default = "db.t3.micro"
  description = "the database instance type"
  type = string
}

variable "database_instance_identifier" {
  default = "dev-rds-db"
  description = "the database instance identifier"
  type = string
}

variable "multi_az_deployment" {
  default = "false"
  description = "create a standby db instance"
  type = bool
}

# alb variables
variable "ssl_certificate_arn" {
  default = "arn:aws:acm:us-east-1:471112565759:certificate/7d7a864e-ff75-4925-a712-47d73b398c32"
  description = "ssl certificate arn"
  type = string
}

# sns topic variables
variable "operator_email" {
  default = "chechkoartem87@gmail.com"
  description = "a valid email address"
  type = string
}

# auto scaling group variables
variable "launch_template_name" {
  default = "new-dev-launch-template"
  description = "name of the launch template"
  type = string
}

variable "ec2_image_id" {
  default = "ami-0b9fbc2ab3b28d3be"
  description = "id of the ami"
  type = string
}

variable "ec2_instance_type" {
  default = "t2.micro"
  description = "ec2 instance type"
  type = string
}

variable "ec2_key_pair_name" {
  default = "Us-east-1"
  description = "name of the ec2 key pair"
  type = string
}