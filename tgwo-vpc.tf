# Create an AWS VPC
resource "aviatrix_vpc" "aws_vpc" {
  count                = length(var.tgw_spoke_cidrs)
  cloud_type           = 1
  account_name         = var.account
  region               = var.region1
  name                 = "${var.region1_code}-tgw-spoke-${count.index + 1}"
  cidr                 = var.tgw_spoke_cidrs[count.index]
  aviatrix_transit_vpc = false
  aviatrix_firenet_vpc = false
}


# Create an Aviatrix AWS TGW VPC Attachment
resource "aviatrix_aws_tgw_vpc_attachment" "aws_tgw_vpc_attachment" {
  count               = length(var.tgw_spoke_cidrs)
  tgw_name            = aviatrix_aws_tgw.tgwo_region1.tgw_name
  region              = aviatrix_aws_tgw.tgwo_region1.region
  network_domain_name = aviatrix_aws_tgw_network_domain.region1_default.name
  vpc_account_name    = var.account
  vpc_id              = aviatrix_vpc.aws_vpc[count.index].vpc_id
}


module "tgw_spoke_vm_az1" {
  source  = "jye-aviatrix/aws-linux-vm-public/aws"
  version = "2.0.4"
  count = length(var.tgw_spoke_cidrs)
  key_name = var.key_name
  vm_name = "${var.region1_code}-tgw-spoke-${count.index+1}-az1"
  vpc_id = aviatrix_vpc.aws_vpc[count.index].vpc_id
  subnet_id = aviatrix_vpc.aws_vpc[count.index].public_subnets[0].subnet_id
  instance_type = var.instance_size
  use_eip = true
}

# output "tgw_spoke_vm_az1" {
#   value = module.tgw_spoke_vm_az1
# }

module "tgw_spoke_vm_az2" {
  source  = "jye-aviatrix/aws-linux-vm-public/aws"
  version = "2.0.4"
  count = length(var.tgw_spoke_cidrs)
  key_name = var.key_name
  vm_name = "${var.region1_code}-tgw-spoke-${count.index+1}-az2"
  vpc_id = aviatrix_vpc.aws_vpc[count.index].vpc_id
  subnet_id = aviatrix_vpc.aws_vpc[count.index].public_subnets[1].subnet_id
  instance_type = var.instance_size
  use_eip = true
}

# output "tgw_spoke_vm_az2" {
#   value = module.tgw_spoke_vm_az2
# }

output "az1" {
  value = [
    for idx, subnet in var.tgw_spoke_cidrs : {
      avx_ssh=module.avx_spoke_vm_az1[idx].ssh
      avx_iperf="iperf3 -c ${module.tgw_spoke_vm_az1[idx].private_ip} -t 120 -P 20"
      tgw_ssh= module.tgw_spoke_vm_az1[idx].ssh
      tgw_iperf="iperf3 -s"
    }
  ]
}

output "az2" {
  value = [
    for idx, subnet in var.tgw_spoke_cidrs : {
      avx_ssh=module.avx_spoke_vm_az2[idx].ssh
      avx_iperf="iperf3 -c ${module.tgw_spoke_vm_az2[idx].private_ip} -t 120 -P 20"
      tgw_ssh= module.tgw_spoke_vm_az2[idx].ssh
      tgw_iperf="iperf3 -s"
    }
  ]
}