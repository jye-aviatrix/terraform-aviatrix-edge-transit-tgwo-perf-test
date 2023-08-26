# Create an Aviatrix AWS TGW
resource "aviatrix_aws_tgw" "tgwo_region1" {
  account_name                      = var.account
  aws_side_as_number                = var.tgw_region1_asn
  region                            = var.region1
  tgw_name                          = var.tgw_region1
}