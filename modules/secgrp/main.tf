
# Create security group
resource "tencentcloud_security_group" "test_sec_grp" {
  name        = var.sec_grp_name
}
