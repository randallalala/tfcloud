
# create subnet 
resource "tencentcloud_subnet" "test_subnet" {
  availability_zone = var.availability_zone
  name              = var.subnet_name
  vpc_id            = var.vpc_id
  cidr_block        = var.subnet_cidr_block
  route_table_id    = var.route_table_id
}