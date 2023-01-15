// global
variable "tags" {
  description = "neccecry tags for resources"
  type        = map(string)
  default     = {
    Owner           = "Daniel Yakov"
    bootcamp        = "17"
    expiration_date = "01-04-2023"
  }
}

// provider
variable "region" {
  description = "The aws region"
  type = string
  default = "eu-west-3"
}

// networking
variable "vpc_cidr_block" {
  description = "VPC's cidr block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidr_block" {
  description = "Subnet's cidr block"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "az" {
  description = "Availability Zone"
  type        = list(string)
  default     = ["eu-west-3a", "eu-west-3b"]
  
}

// ec2
variable "ec2_ami" {
  description = "ami of the ec2"
  type        = string
  default     = "ami-03c476a1ca8e3ebdc"
}

variable "ec2_type" {
  description = "ec2 instance type"
  type        = string
  default     = "t3a.micro"
}

variable "ec2_ssh_key" {
  description = "ec2 key pair"
  type        = string
  default     = "daniel-key"
}


