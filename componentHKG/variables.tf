

variable "region" { default = "ap-hongkong" }
variable "az1" { default = "ap-hongkong-1" }
variable "az2" { default = "ap-hongkong-2" }
variable "az3" { default = "ap-hongkong-3" }

// ----------------- VPC
variable "vpc_cidr_block" { default = "ip add" }
variable "vpc_name" { default = "vpc_hkg" }

// ----------------- EIP NAT GW
variable "eip_name" { default = "eip_hkg" }
variable "nat_gw_name" { default = "nat_gw_hkg" }
variable "bandwidth" { default = 5000 }
variable "max_concurrent" { default = 1000000 }


// ----------------- ROUTE TABLE AND ENTRY
variable "destination_cidr_block" { default = "0.0.0.0/0" }
variable "next_type_eip" { default = "EIP" }
variable "next_hub" { default = "0" }
variable "next_type_nat" { default = "NAT" }
variable "rtb_id" { default = "" }


// ----------------- SUBNET
variable "subnet_name_pub_a" { default = "pub_a" }
variable "pub_a_cidr_block" { default = "ip add" }

variable "subnet_name_pub_b" { default = "pub_b" }
variable "pub_b_cidr_block" { default = "ip add" }

variable "subnet_name_pub_c" { default = "pub_c" }
variable "pub_c_cidr_block" { default = "ip add" }

variable "subnet_name_priv_a" { default = "priv_a" }
variable "priv_a_cidr_block" { default = "ip add" }

variable "subnet_name_priv_b" { default = "priv_b" }
variable "priv_b_cidr_block" { default = "ip add" }

variable "subnet_name_priv_c" { default = "priv_c" }
variable "priv_c_cidr_block" { default = "ip add" }

// ----------------- SEC GRP AND RULES
variable "sec_grp_name" { default = "sec_grp" }
variable "sec_grp_id" { default = "" }
variable "sgvpn" { default = "ip add" }
variable "ciscovpn" { default = "ip add" }
variable "sec_rules_type_i" { default = "ingress" }
variable "sec_rules_type_e" { default = "egress" }
variable "policy" { default = "accept" }
variable "vpc_cidr_block_sg" { default = "ip add" }

// ----------------- VM INSTANCE 
variable "allocate_public_ip" { default = true }
variable "subnet_id" { default = "" }
variable "vpc_id" { default = "" }
variable "instance_type" { default = "S5.Letc" }
variable "image_id" { default = "img-8rrx" }
variable "system_disk_type" { default = "CLOUD_SSD or PREM" }
variable "system_disk_size" { default = 10000 }
variable "data_disk_type" { default = "CLOUD_SSD or PREM" }
variable "data_disk_size" { default = 20000 }
variable "internet_max_bandwidth_out" { default = 10000 }
variable "instance_name" { default = "hkg_vm" }
variable "hostname" { default = "rootoruser" }
variable "security_group" { default = "" }
variable "sec_grp" { default = "" }

// ----------------- KEYPAIR
variable "key_name1" { default = "hkg1" }
variable "key_name2" { default = "hkg2" }
