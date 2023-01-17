// Create ALB
resource "aws_lb" "alb" {
    count = length(var.subnets_id) > 1 ? 1 : 0 // only when there are 2 ec2, create alb
    name = var.alb_name
    internal = false
    load_balancer_type = "application"
    security_groups = [ aws_security_group.alb_sg[0].id ]
    subnets = var.subnets_id
}

// Create target Group
resource "aws_lb_target_group" "tg" {
    name = var.tg_name
    port = var.tg_port
    protocol = var.tg_protocol
    vpc_id = var.vpc_id
}

// Assocaite app1 to the target group
resource "aws_lb_target_group_attachment" "tg1" {
    target_group_arn = aws_lb_target_group.tg.arn
    target_id = aws_instance.app1.id
}

// Assocaite app2 to the target group
resource "aws_lb_target_group_attachment" "tg2" {
    count = var.one_ec2 ? 0 : 1
    target_group_arn = aws_lb_target_group.tg.arn
    target_id = aws_instance.app2[count.index].id
}

// Add listener to ALB
resource "aws_lb_listener" "tg" {  
    count = length(var.subnets_id) > 1 ? 1 : 0 // only when there are 2 ec2, create alb listener
    load_balancer_arn = aws_lb.alb[0].arn
    port = var.alb_listener_port
    protocol = var.alb_listener_protocol // default

    default_action {
        type = "forward"
        target_group_arn = aws_lb_target_group.tg.arn
    }
}

// ALB security group
resource "aws_security_group" "alb_sg" {
    count = length(var.subnets_id) > 1 ? 1 : 0 // only when there are 2 ec2, create alb sg
    name = var.alb_sg_name
    description = var.alb_sg_name
    vpc_id = var.vpc_id

    ingress {
      cidr_blocks = [ var.alb_sg_ingress_cidr ]
      from_port = var.alb_sg_ingress_from_port
      to_port = var.alb_sg_ingress_to_port
      protocol = var.alb_sg_ingress_protocol
    }

    egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
}