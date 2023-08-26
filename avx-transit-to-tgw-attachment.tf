# Create an Aviatrix AWS TGW Transit Gateway Attachment
resource "aviatrix_aws_tgw_transit_gateway_attachment" "region1_transit_gateway_attachment" {
  tgw_name             = aviatrix_aws_tgw.tgwo_region1.tgw_name
  region               = aviatrix_aws_tgw.tgwo_region1.region
  vpc_account_name     = var.account
  vpc_id               = module.region1_mc_transit.vpc.vpc_id
  transit_gateway_name = module.region1_mc_transit.transit_gateway.gw_name
}