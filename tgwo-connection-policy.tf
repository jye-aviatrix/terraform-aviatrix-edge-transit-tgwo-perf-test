resource "aviatrix_aws_tgw_peering_domain_conn" "region1_default_to_edge" {
  tgw_name1    = aviatrix_aws_tgw.tgwo_region1.tgw_name
  domain_name1 = aviatrix_aws_tgw_network_domain.region1_default.name
  tgw_name2    = aviatrix_aws_tgw.tgwo_region1.tgw_name
  domain_name2 = aviatrix_aws_tgw_network_domain.region1_edge.name
}