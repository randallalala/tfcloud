
#  // ------------------- VPC
resource "tencentcloud_vpc" "vpc_test" {
  name              = var.vpc_name
  cidr_block        = var.cidr_block
}

