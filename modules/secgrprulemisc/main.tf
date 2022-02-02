

# Create security group rules 
resource "tencentcloud_security_group_rule" "test_sec_rules_js" {
  security_group_id = var.sec_grp_id
  type              = var.sec_rules_type
  cidr_ip           = var.sec_rules_cidr_ip
  policy            = var.sec_rules_policy
  ip_protocol       = var.ip_protocol_misc
  port_range        = var.portrange_misc
}
