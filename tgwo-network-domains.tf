resource "aviatrix_aws_tgw_network_domain" "region1_edge" {
  name     = "Aviatrix_Edge_Domain"
  tgw_name = aviatrix_aws_tgw.tgwo_region1.tgw_name
}


resource "aviatrix_aws_tgw_network_domain" "region1_shared" {
  name     = "Shared_Service_Domain"
  tgw_name = aviatrix_aws_tgw.tgwo_region1.tgw_name
}



resource "aviatrix_aws_tgw_network_domain" "region1_default" {
  name     = "Default_Domain"
  tgw_name = aviatrix_aws_tgw.tgwo_region1.tgw_name
}