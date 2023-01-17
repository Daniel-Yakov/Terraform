// First ec2 instance
resource "aws_instance" "app1" {
    ami = var.ec2_ami
    instance_type = var.ec2_type
    key_name = var.ec2_ssh_key
    subnet_id = var.subnets_id[0]
    associate_public_ip_address = true
    vpc_security_group_ids = [ aws_security_group.sg.id ]

    tags = merge(var.tags, {
      Name = var.ec2_instance1_name
    })
}

// Second ec2 instance
resource "aws_instance" "app2" {
    count = var.one_ec2 ? 0 : 1
    ami = var.ec2_ami
    instance_type = var.ec2_type
    key_name = var.ec2_ssh_key
    subnet_id = var.subnets_id[length(var.subnets_id) - 1]
    associate_public_ip_address = true
    vpc_security_group_ids = [ aws_security_group.sg.id ]

    tags = merge(var.tags, {
      Name = var.ec2_instance2_name
    })
}

// Create the ec2 security group
resource "aws_security_group" "sg" {
    name = var.ec2_sg_name
    description = var.ec2_sg_name
    vpc_id = var.vpc_id

    ingress {
      cidr_blocks = [ var.ec2_sg_ingeress_ssh_ip ]
      from_port = 22
      to_port = 22
      protocol = "tcp"
    } 

    ingress {
      security_groups = length(var.subnets_id) > 1 ? [ aws_security_group.alb_sg[0].id ] : null // there is an ALB
      cidr_blocks = length(var.subnets_id) > 1 ? null : [ "0.0.0.0/0" ] // there is not an ALB
      from_port = var.ec2_sg_ingress_from_port
      to_port = var.ec2_sg_ingress_to_port
      protocol = var.ec2_sg_ingress_protocol
    }

    egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
}