variable "account" {
  description = "Provide Aviatrix Access Account name"
  type = string
}

variable "region1_code" {
  default = "ue1"
  description = "Three letter of region code, EG: us-east-2 -> ue2"
}


variable "region2_code" {
  default = "ue2"
  description = "Three letter of region code, EG: us-east-2 -> ue2"
}

variable "onprem_code" {
  default = "ue1-onprem"
  description = "Three letter of region code, EG: us-east-2 -> ue2"
}

variable "region1" {
  default = "us-east-1"
  description = "Specify the region of the deployment"
}

variable "region2" {
  default = "us-east-2"
  description = "Specify the region of the deployment"
}

variable "onprem_region" {
  default = "us-east-1"
  description = "Specify the region of the deployment"
}

variable "region1_transit_cidr" {
  type        = string
  description = "Provide transit VPC CIDR"
  default = "10.0.100.0/23"
}

variable "region2_transit_cidr" {
  type        = string
  description = "Provide transit VPC CIDR"
  default = "10.200.0.0/23"
}

variable "onprem_transit_cidr" {
  type        = string
  description = "Provide transit VPC CIDR"
  default = "10.0.0.0/23"
}

variable "region1_local_as_number" {
  type = number
  description = "Provide transit ASN number"
  default = 65111
}

variable "region2_local_as_number" {
  type = number
  description = "Provide transit ASN number"
  default = 65112
}

variable "onprem_local_as_number" {
  type = number
  description = "Provide transit ASN number"
  default = 65000
}


variable "instance_size" {
  type = string
  description = "Provide instance side for transit/spoke/test instances"
  default = "c5n.xlarge"
}

variable "bgp_ecmp" {
  type = bool
  description = "Enable BGP ECMP or not"
  default = true
}

variable "enable_transit_firenet" {
  type = bool
  description = "Enable transit firenet or not"
  default = true
}

variable "insane_mode" {
  type = bool
  description = "Is HPE insane mode enabled or not"
  default = false
}

variable "ha_gw" {
  type = bool
  description = "Enable or disable HA Gateway"
  default = false
}

variable "enable_segmentation" {
  type = bool
  description = "Enable network domain segmentation or not"
  default = false
}



variable "tgw_region1" {
  default = "ue1tgw"
}

variable "tgw_region1_asn" {
  default = 65101
}

variable "tgw_region2" {
  default = "ue2tgw"  
}

variable "tgw_region2_asn" {
  default = 65102
}

variable "onprem_gw_name_region1" {
  default = "ue1onpremgw"
  description = "OnPrem VPN gateway name"
}

variable "onpremgw_asn_region1" {
  default = 65001
  description = "ASN of onprem VPN gateway"
}

variable "onprem_gw_name_region2" {
  default = "ue2onpremgw"
  description = "OnPrem VPN gateway name"
}

variable "onpremgw_asn_region2" {
  default = 65002
  description = "ASN of onprem VPN gateway"
}

variable "key_name" {
  description = "Provide EC2 Key Pair name for test machines launched in Public subnets"
}

variable "avx_spoke_cidrs" {
  type = list
  default = ["10.100.1.0/24","10.100.2.0/24","10.100.3.0/24","10.100.4.0/24"]
}


variable "tgw_spoke_cidrs" {
  type = list
  default = ["10.200.1.0/24","10.200.2.0/24","10.200.3.0/24","10.200.4.0/24"]
}
