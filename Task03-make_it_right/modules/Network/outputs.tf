output "vpc_id" {
  value       = aws_vpc.vpc.id
  description = "give VPC details"
}

// outputs a list of the subnets from this module
output "subnets_id" {
  value       = length(aws_subnet.sub2) != 0 ? [aws_subnet.sub1.id, aws_subnet.sub2[0].id] : [aws_subnet.sub1.id]
  description = "list of all subnet's id"
}