# Common CIDR range for VPC, S3, and RDS
variable "common_cidr" {
  description = "Common CIDR range for VPC, RDS, and S3"
  type        = string
  default     = "10.0.0.0/16"  # You can change this to your desired CIDR range
}

# VPC Module Variables
variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"  # Use the common CIDR range as the default
}

variable "private_subnet1_cidr" {
  description = "CIDR block for the private subnet 1"
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet2_cidr" {
  description = "CIDR block for the private subnet 2"
  type        = string
  default     = "10.0.2.0/24"
}

variable "availability_zone_private_subnet1" {
  description = "Availability zone for private subnet 1"
  type        = string
  default     = "ap-south-1a"
}

variable "availability_zone_private_subnet2" {
  description = "Availability zone for private subnet 2"
  type        = string
  default     = "ap-south-1b"
}

# S3 Module Variables
variable "s3_bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
  default     = "my-testterra-bucket"
}

# RDS Module Variables
variable "db_allocated_storage" {
  description = "Allocated storage for the RDS instance"
  type        = number
  default     = 20
}


