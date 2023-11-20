provider "aws" {
  region     = ""
  access_key = ""
  secret_key = ""

}
variable "subnet-cidr-block" {
  description = "subnet cidr block"
  default     = "10.0.0.20/24"
}
variable "vpc-cidr-block" {
  description = "subnet cidr block"
}
variable "environment" {
  description = "deploying env"

}


resource "aws_vpc" "dev-vpc" {
  cidr_block = var.vpc-cidr-block
  tags = {
    Name : var.environment
    vpc_env : "dev "
  }
}

resource "aws_subnet" "dev-sub-1" {
  vpc_id            = aws_vpc.dev-vpc.id
  cidr_block        = var.subnet-cidr-block
  availability_zone = "us-east-1a"
  tags = {
    Name : "dev-sub-1"
  }
}

data "aws_vpc" "existing_vpc" {
  default = true
}

resource "aws_subnet" "dev-sub-2" {
  vpc_id            = data.aws_vpc.existing_vpc.id
  cidr_block        = "172.31.128.0/20"
  availability_zone = "us-east-1b"
  tags = {
    Name : "default-sub-2"
  }
}

output "dev-vpc-id" {
  value = "aws_vpc.dev-vpc.id"
}

output "dev-subnet-2-id" {
  value = data.aws_vpc.existing_vpc.id

}
