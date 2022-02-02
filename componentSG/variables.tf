

variable "gitlab_token" { default = "xx" }

variable "availability_zone" { default = "" }

variable "region" { default = "ap-singapore" }
variable "az1" { default = "ap-singapore-1" }
variable "az2" { default = "ap-singapore-2" }
variable "az3" { default = "ap-singapore-3" }

// ----------------- VPC
variable "vpc_cidr_block" { default = "ipadd" }
variable "vpc_name" { default = "vpc_sg" }

// ----------------- EIP NAT GW
variable "eip_name" { default = "eip_sg" }
variable "nat_gw_name" { default = "nat_gw_sg" }
variable "bandwidth" { default = 500000 }
variable "max_concurrent" { default = 10000000 }

// ----------------- ROUTE TABLE AND ENTRY
variable "destination_cidr_block" { default = "0.0.0.0/0" }
variable "next_type_eip" { default = "EIP" }
variable "next_hub" { default = "0" }
variable "next_type_nat" { default = "NAT" }
variable "rtb_id" { default = "" }

// ----------------- SUBNET
variable "subnet_name_pub_a" { default = "pub_a" }
variable "pub_a_cidr_block" { default = "ipadd" }

variable "subnet_name_pub_b" { default = "pub_b" }
variable "pub_b_cidr_block" { default = "ipadd" }

variable "subnet_name_pub_c" { default = "pub_c" }
variable "pub_c_cidr_block" { default = "ipadd" }

variable "subnet_name_priv_a" { default = "priv_a" }
variable "priv_a_cidr_block" { default = "ipadd" }

variable "subnet_name_priv_b" { default = "priv_b" }
variable "priv_b_cidr_block" { default = "ipadd" }

variable "subnet_name_priv_c" { default = "priv_c" }
variable "priv_c_cidr_block" { default = "ipadd" }

// ----------------- SEC GRP AND RULES
variable "sec_grp_name" { default = "sec_grp" }
variable "sec_grp_id" { default = "" }
variable "sgvpn" { default = "ipadd" }
variable "sec_rules_type_i" { default = "ingress" }
variable "sec_rules_type_e" { default = "egress" }
variable "policy" { default = "accept" }
variable "vpc_cidr_block_hkg" { default = "ipadd" }

// ----------------- VM INSTANCE 
variable "allocate_public_ip" { default = true }
variable "subnet_id" { default = "" }
variable "vpc_id" { default = "" }
variable "instance_type" { default = "S5.LARGE8" }
variable "image_id" { default = "img-9qasfiouh1xt" }
variable "system_disk_type" { default = "CLOUD_SSDPREM" }
variable "system_disk_size" { default = 10000 }
variable "data_disk_type" { default = "CLOUD_SSDPREM" }
variable "data_disk_size" { default = 20000 }
variable "internet_max_bandwidth_out" { default = 10000 }
variable "instance_name" { default = "vm_sg" }
variable "hostname" { default = "root" }
variable "security_group" { default = "" }
variable "sec_grp" { default = "" }

// ----------------- KEYPAIR

variable "key_name1" { default = "tc_prod_sg1" }
variable "key_name2" { default = "tc_prod_sg2" }
variable "key_name3" { default = "tc_prod_sg3js" }
variable "public_key1" {}
// xx

//---------jumpserver rules and vm
variable "instance_name_js" { default = "vm_js_sg" }
variable "js_secgrp_name" { default = "js_sec_grp" }
variable "js1_cidr_ip" { default = "ipadd" }
variable "js2_cidr_ip" { default = "ipadd" }
variable "js3_cidr_ip" { default = "ipadd" }
variable "ip_protocol_misc" { default = "TCP" }
variable "portrange_misc" { default = "22" }
variable "js_egressout" { default = "0.0.0.0/0" }
