###### required ######
# vpc.tf vars
variable "vpc_name" {
  description = "The name of the vpc"
  type = string
}

# subnets.tf vars
variable "subnets_name" {
  description = "Name of first subnet"
  type        = list(string)
}

variable "az" {
  description = "Availability Zone"
  type        = list(string)
}


###### optional/defualt ######
# global
variable "tags" {
  description = "neccecry tags for resources"
  type        = map(string)
  default     = {
    Owner           = "Daniel Yakov"
    bootcamp        = "17"
    expiration_date = "01-04-2023"
  }
}

# vpc.tf vars
variable "vpc_cidr_block" {
  description = "VPC's cidr block"
  type        = string
  default     = "10.0.0.0/16"
}

# subnets.tf vars
variable "subnet_cidr_block" {
  description = "Subnet's cidr block"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "one_subnet" {
  description = "Provision only one subnet"
  type        = bool
  default     = false
}


