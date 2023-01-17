###### required ######
# global
variable "vpc_id" {
  description = "VPC id"
  type        = string
}

# alb.tf vars
variable "alb_name" {
  description = "ALB name"
  type        = string
}

variable "subnets_id" {
  description = "Id's of subnets to route traffic to"
  type        = list(string)
}

variable "tg_name" {
  description = "Target group name"
  type        = string
}

variable "alb_sg_name" {
  description = "ALB's security group name"
  type        = string
}

# ec2.tf vars
variable "ec2_ssh_key" {
  description = "ec2 key pair"
  type        = string
}

variable "ec2_instance1_name" {
  description = "Name of first ec2 instance"
  type        = string
}

variable "ec2_instance2_name" {
  description = "Name of second ec2 instance"
  type        = string
}

variable "ec2_sg_name" {
  description = "Name of ec2 instances' security group"
  type        = string
}

variable "ec2_sg_ingeress_ssh_ip" {
  description = "Your ip address form the ssh"
  type        = string
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

# alb.tf vars
variable "tg_port" {
  description = "Port to route traffic to ec2 in target group"
  type        = number
  default = 80
}

variable "tg_protocol" {
  description = "protocol to route traffic to ec2 in target group"
  type        = string
  default = "HTTP"
}

variable "alb_listener_port" {
  description = "Port alb listen to in order to route traffic to target group"
  type        = number
  default = 80
}

variable "alb_listener_protocol" {
  description = "Protocol alb listen to in order to route traffic to target group"
  type        = string
  default = "HTTP"
}

variable "alb_sg_ingress_cidr" {
  description = "cidr to recive trffic from"
  type        = string
  default = "0.0.0.0/0"
}

variable "alb_sg_ingress_from_port" {
  description = "starting port range"
  type        = number
  default = 80
}

variable "alb_sg_ingress_to_port" {
  description = "end port range"
  type        = number
  default = 80
}

variable "alb_sg_ingress_protocol" {
  description = "Protocol of sg ports"
  type        = string
  default = "TCP"
}

# ec2.tf vars
variable "ec2_ami" {
  description = "ami of the ec2"
  type        = string
  default     = "ami-0039da1f3917fa8e3"
}

variable "ec2_type" {
  description = "ec2 instance type"
  type        = string
  default     = "t3a.micro"
}

variable "ec2_sg_ingress_from_port" {
  description = "Starting port range"
  type        = number
  default     = 80
}

variable "ec2_sg_ingress_to_port" {
  description = "End port range"
  type        = number
  default     = 80
}

variable "ec2_sg_ingress_protocol" {
  description = "Protocol of sg ports"
  type        = string
  default     = "TCP"
}

variable "one_ec2" {
  description = "one ec2 if true or 2 if false"
  type        = bool
  default     = false
}
