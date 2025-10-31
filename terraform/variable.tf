variable "region" {
  description = "AWS region"
  type        = string
  default     = "<AWS_REGION>"
}

variable "ami" {
  description = "AMI ID to use for the EC2 instance (required)"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "ssh_cidr" {
  description = "CIDR allowed for SSH access (restrict to your IP)"
  type        = string
  default     = "0.0.0.0/0"
}

variable "environment" {
  description = "Environment tag"
  type        = string
  default     = "dev"
}
