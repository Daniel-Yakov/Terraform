output "alb_id" {
  value       = length(var.subnets_id) > 1 ? aws_lb.alb[0].id : null
  description = "ALB id"
}

output "instance1_id" {
  value       = aws_instance.app1.id
  description = "instance1 id"
}

output "instance2_id" {
  value       = var.one_ec2 ? null : aws_instance.app2[0].id
  description = "instance2 id"
}