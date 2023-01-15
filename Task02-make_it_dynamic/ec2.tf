resource "aws_instance" "app1" {
    ami = var.ec2_ami
    instance_type = var.ec2_type
    key_name = var.ec2_ssh_key
    subnet_id = aws_subnet.sub1.id
    associate_public_ip_address = true
    vpc_security_group_ids = [ aws_security_group.sg.id ]

    tags = merge(var.tags, {
      Name = "daniel-makeiteasy-1"
    })
}

resource "aws_instance" "app2" {
    ami = var.ec2_ami
    instance_type = var.ec2_type
    key_name = var.ec2_ssh_key
    subnet_id = aws_subnet.sub2.id
    associate_public_ip_address = true
    vpc_security_group_ids = [ aws_security_group.sg.id ]

    tags = merge(var.tags, {
      Name = "daniel-makeiteasy-2"
    })
}

resource "aws_security_group" "sg" {
    name = "daniel-makeiteasy-sg"
    description = "daniel-makeiteasy-sg"
    vpc_id = aws_vpc.vpc.id

    ingress {
      cidr_blocks = [ "84.229.9.148/32" ]
      from_port = 22
      to_port = 22
      protocol = "tcp"
    } 

    ingress {
      security_groups = [ aws_security_group.alb_sg.id ]
      from_port = 80
      to_port = 80
      protocol = "tcp"
    }

    egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
}