terraform {
  backend "s3" {
    bucket         = "terraform-ec2-backend-k98"
    key            = "terraform-ec2-backend-k98/terraform.tfstate"
    region         = "eu-west-2"
    dynamodb_table = "terraform_ec2_backend_table"
  }
}

provider "aws" {
  region  = var.region
  # Optional: use a named profile
  # profile = "<AWS_PROFILE>"
}

data "aws_vpc" "default" {
  default = true
}

locals {
  name_prefix = "tf-week1"
  common_tags = {
    Project = "tf-week1-ec2"
    Owner   = "<YOUR_EMAIL>"
    Env     = var.environment
  }
}

resource "aws_security_group" "ssh" {
  name        = "${local.name_prefix}-sg"
  description = "Allow SSH ingress"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.ssh_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(local.common_tags, { Name = "${local.name_prefix}-sg" })
}

resource "aws_instance" "app" {
  ami           = var.ami
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.ssh.id]
  tags = merge(local.common_tags, { Name = "${local.name_prefix}-instance" })

  # Optional: do not create public IP if you prefer
  # associate_public_ip_address = true
}
