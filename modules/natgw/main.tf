
#  // ------------------- elastic IP
resource "tencentcloud_eip" "test_eip" {
  name = var.eip_name
}

#  // ------------------- nat gateway
resource "tencentcloud_nat_gateway" "test_nat_gw" {
  name             = var.nat_gw_name
  vpc_id           = var.vpc_id
  bandwidth        = var.bandwidth
  max_concurrent   = var.max_concurrent 
  assigned_eip_set = [tencentcloud_eip.test_eip.public_ip]
}

