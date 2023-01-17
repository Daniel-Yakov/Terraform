module "vpc_network" {
  source = "./modules/Network"

  vpc_name = "${var.vpc_name}-${terraform.workspace}"
  subnets_name = var.subnets_name
  az = var.az_list
  one_subnet = var.one_subnet
}

module "compute" {
  source = "./modules/Compute"

  vpc_id = module.vpc_network.vpc_id
  alb_name = "${var.alb_name}-${terraform.workspace}"
  subnets_id = module.vpc_network.subnets_id // list of subnets id from network module
  tg_name = "${var.tg_name}-${terraform.workspace}"
  alb_sg_name = "${var.alb_sg_name}-${terraform.workspace}"
  ec2_ssh_key = var.ec2_ssh_key
  ec2_instance1_name = "${var.ec2_instance1_name}-${terraform.workspace}"
  ec2_instance2_name = "${var.ec2_instance2_name}-${terraform.workspace}"
  ec2_sg_name = "${var.ec2_sg_name}-${terraform.workspace}"
  ec2_sg_ingeress_ssh_ip = var.ec2_sg_ingeress_ssh_ip
  one_ec2 = var.one_ec2
}