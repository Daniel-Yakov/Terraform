// provider
variable "region" {
  description = "The aws region"
  type = string
  default = "eu-central-1"
}

variable "vpc_name" {
  description = "VPC name to create"
  type = string
  default = "daniel-doitright"
}

variable "subnets_name" {
  type        = list(string)
  default     = [ "daniel-1a-pub", "daniel-1b-pub" ]
  description = "list of subnets names to create"
}

variable "az_list" {
  type        = list(string)
  default     = [ "eu-central-1a", "eu-central-1b" ]
  description = "list of AZ to create"
}

variable "one_subnet" {
  type        = bool
  default     = false
  description = "if true cretae only one subnet"
}

variable "alb_name" {
  type        = string
  default     = "daniel-doitright-alb"
  description = "ALB name"
}

variable "tg_name" {
  type        = string
  default     = "daniel-doitright-tg"
  description = "Target group name"
}

variable "alb_sg_name" {
  type        = string
  default     = "daniel-doitright-alb-sg"
  description = "Name of security group of alb"
}

variable "ec2_ssh_key" {
  type        = string
  default     = "daniel-eu-central-1-key"
  description = "Key name to use"
}

variable "ec2_instance1_name" {
  type        = string
  default     = "daniel-doitright-1"
  description = "Instance 1 name"
}

variable "ec2_instance2_name" {
  type        = string
  default     = "daniel-doitright-2"
  description = "Instance 2 name"
}

variable "ec2_sg_name" {
  type        = string
  default     = "daniel-doitright-ec2-sg"
  description = "Instances security group name"
}

variable "ec2_sg_ingeress_ssh_ip" {
  type        = string
  default     = "5.28.129.14/32"
  description = "Instances security group name"
}

variable "one_ec2" {
  type        = bool
  default     = false
  description = "Create only one ec2 if true"
}