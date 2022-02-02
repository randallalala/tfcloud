output public_ip {
  value = tencentcloud_eip.test_eip.public_ip
}

output "natgw_id" {
  value = tencentcloud_nat_gateway.test_nat_gw.id
}


