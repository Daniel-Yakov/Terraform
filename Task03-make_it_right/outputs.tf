output "vpc_id" {
  value       = module.vpc_network.vpc_id
  description = "Created vpc id"
}

output "subnet1" {
  value       = module.vpc_network.subnets_id[0]
  description = "Subnet1 id"
}

output "subnet2" {
  value       = length(module.vpc_network.subnets_id) > 1 ? module.vpc_network.subnets_id[1] : "N/A"
  description = "Subnet2 id"
}

output "alb" {
  value       = length(module.vpc_network.subnets_id) > 1 ? module.compute.alb_id : "N/A"
  description = "ALB id"
}

output "instance1" {
  value       = module.compute.instance1_id
  description = "instance1 id"
}

output "instance2" {
  value       = module.compute.instance2_id == null ? "N/A" : module.compute.instance2_id
  description = "instance2 id"
}
