
resource "tencentcloud_route_table" "rtb_pub_test" {
  vpc_id = var.vpc_id
  name   = var.rtb_pub_name
}
resource "tencentcloud_route_table_entry" "rtb_pub_entry_test" {
  destination_cidr_block = var.destination_cidr_block
  next_type              = var.next_type
  next_hub               = var.next_hub
  route_table_id         = tencentcloud_route_table.rtb_pub_test.id
}
