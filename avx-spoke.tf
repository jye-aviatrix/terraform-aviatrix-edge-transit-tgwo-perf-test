module "region1_mc_spoke" {
  count = length(var.avx_spoke_cidrs)
  source             = "terraform-aviatrix-modules/mc-spoke/aviatrix"
  version            = "1.6.3"
  cloud              = "AWS"
  name               = "${var.region1_code}-spoke-${count.index+1}"
  region             = var.region1
  cidr               = var.avx_spoke_cidrs[count.index]
  account            = var.account
  gw_name            = "${var.region1_code}-spoke-${count.index+1}"
  insane_mode        = var.insane_mode
  ha_gw              = var.ha_gw
  transit_gw         = module.region1_mc_transit.transit_gateway.gw_name
  instance_size = var.instance_size
}

module "avx_spoke_vm_az1" {
  source  = "jye-aviatrix/aws-linux-vm-public/aws"
  version = "2.0.4"
  count = length(var.avx_spoke_cidrs)
  key_name = var.key_name
  vm_name = "${var.region1_code}-spoke-${count.index+1}-az1"
  vpc_id = module.region1_mc_spoke[count.index].vpc.vpc_id
  subnet_id = module.region1_mc_spoke[count.index].vpc.public_subnets[0].subnet_id
  instance_type = var.instance_size
  use_eip = true
}

# output "avx_spoke_vm_az1" {
#   value = module.avx_spoke_vm_az1
# }

# module "avx_spoke_vm_az2" {
#   source  = "jye-aviatrix/aws-linux-vm-public/aws"
#   version = "2.0.4"
#   count = length(var.avx_spoke_cidrs)
#   key_name = var.key_name
#   vm_name = "${var.region1_code}-spoke-${count.index+1}-az2"
#   vpc_id = module.region1_mc_spoke[count.index].vpc.vpc_id
#   subnet_id = module.region1_mc_spoke[count.index].vpc.public_subnets[1].subnet_id
#   instance_type = var.instance_size
#   use_eip = true
# }

# output "avx_spoke_vm_az2" {
#   value = module.avx_spoke_vm_az2
# }