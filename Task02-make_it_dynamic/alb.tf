// Create ALB
resource "aws_lb" "alb" {
    name = "daniel-alb-makeiteasy"
    internal = false
    load_balancer_type = "application"
    security_groups = [ aws_security_group.alb_sg.id ]
    subnets = [ aws_subnet.sub1.id, aws_subnet.sub2.id ]
}

// Create target Group
resource "aws_lb_target_group" "tg" {
    name = "makeiteasy-tg"
    port = 80
    protocol = "HTTP"
    vpc_id = aws_vpc.vpc.id
}

// Assocaite app1 to an the target group
resource "aws_lb_target_group_attachment" "tg1" {
    target_group_arn = aws_lb_target_group.tg.arn
    target_id = aws_instance.app1.id
}

// Assocaite app2 to an the target group
resource "aws_lb_target_group_attachment" "tg2" {
    target_group_arn = aws_lb_target_group.tg.arn
    target_id = aws_instance.app2.id
}

// Add listener to ALB
resource "aws_lb_listener" "tg" {  
    load_balancer_arn = aws_lb.alb.arn
    port = 80
    protocol = "HTTP" // default

    default_action {
        type = "forward"
        target_group_arn = aws_lb_target_group.tg.arn
    }
}

// ALB security group
resource "aws_security_group" "alb_sg" {
    name = "daniel-makeiteasy-alb-sg"
    description = "daniel-makeiteasy-alb-sg"
    vpc_id = aws_vpc.vpc.id

    ingress {
      cidr_blocks = [ "0.0.0.0/0" ]
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