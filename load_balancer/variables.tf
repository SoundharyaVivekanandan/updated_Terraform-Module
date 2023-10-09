# load_balancer/variables.tf

variable "elb_security_group_name" {
  description = "Name of the ELB security group"
  type        = string
   default     = "elb-security-group"
}

variable "common_cidr" {
  description = "Common CIDR range for VPC, RDS, and S3"
  type        = string
}