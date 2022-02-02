
// --------------------------------------------   vpc
module "vpc_hkg" {
  source            = "../modules/VPC"
  cidr_block        = var.vpc_cidr_block
  vpc_name          = var.vpc_name
}

// --------------------------------------------   nat gw & eip
module "eipnatgw_hkg" {
  source         = "../modules/natgw"
  eip_name       = var.eip_name
  nat_gw_name    = var.nat_gw_name
  vpc_id         = module.vpc_hkg.vpc_id
  bandwidth      = var.bandwidth
  max_concurrent = var.max_concurrent
}


// --------------------------------------------   route table & entry
module "rtb_public" {
  source                 = "../modules/rtb_pub"
  vpc_id                 = module.vpc_hkg.vpc_id
  destination_cidr_block = var.destination_cidr_block
  next_type              = var.next_type_eip
  next_hub               = var.next_hub
}
module "rtb_private" {
  source                 = "../modules/rtb_priv"
  vpc_id                 = module.vpc_hkg.vpc_id
  destination_cidr_block = var.destination_cidr_block
  next_type              = var.next_type_nat
  next_hub               = module.eipnatgw_hkg.natgw_id
}

// --------------------------------------------  subnet x6
module "subnet_pub_a" {
  source            = "../modules/subnet"
  subnet_name       = var.subnet_name_pub_a
  vpc_id            = module.vpc_hkg.vpc_id
  subnet_cidr_block = var.pub_a_cidr_block
  route_table_id    = module.rtb_public.rtb_pub_id
  availability_zone = var.az2
}
module "subnet_pub_b" {
  source            = "../modules/subnet"
  subnet_name       = var.subnet_name_pub_b
  vpc_id            = module.vpc_hkg.vpc_id
  subnet_cidr_block = var.pub_b_cidr_block
  route_table_id    = module.rtb_public.rtb_pub_id
  availability_zone = var.az2
}
module "subnet_pub_c" {
  source            = "../modules/subnet"
  subnet_name       = var.subnet_name_pub_c
  vpc_id            = module.vpc_hkg.vpc_id
  subnet_cidr_block = var.pub_c_cidr_block
  route_table_id    = module.rtb_public.rtb_pub_id
  availability_zone = var.az2
}
module "subnet_priv_a" {
  source            = "../modules/subnet"
  subnet_name       = var.subnet_name_priv_a
  vpc_id            = module.vpc_hkg.vpc_id
  subnet_cidr_block = var.priv_a_cidr_block
  route_table_id    = module.rtb_private.rtb_priv_id
  availability_zone = var.az2
}
module "subnet_priv_b" {
  source            = "../modules/subnet"
  subnet_name       = var.subnet_name_priv_b
  vpc_id            = module.vpc_hkg.vpc_id
  subnet_cidr_block = var.priv_b_cidr_block
  route_table_id    = module.rtb_private.rtb_priv_id
  availability_zone = var.az2
}
module "subnet_priv_c" {
  source            = "../modules/subnet"
  subnet_name       = var.subnet_name_priv_c
  vpc_id            = module.vpc_hkg.vpc_id
  subnet_cidr_block = var.priv_c_cidr_block
  route_table_id    = module.rtb_private.rtb_priv_id
  availability_zone = var.az2
}

// --------------------------------------------  security group & RULES
module "sec_grp" {
  source       = "../modules/secgrp"
  sec_grp_name = var.sec_grp_name
}

module "apex_out" {
  source            = "../modules/secgrprules"
  sec_grp_id        = module.sec_grp.sec_group_id
  sec_rules_type    = var.sec_rules_type_e
  sec_rules_cidr_ip = var.destination_cidr_block
  sec_rules_policy  = var.policy
}
module "vpn" {
  source            = "../modules/secgrprules"
  sec_grp_id        = module.sec_grp.sec_group_id
  sec_rules_type    = var.sec_rules_type_i
  sec_rules_cidr_ip = var.vpn
  sec_rules_policy  = var.policy
}
module "private_cidr_hkg" {
  source            = "../modules/secgrprules"
  sec_grp_id        = module.sec_grp.sec_group_id
  sec_rules_type    = var.sec_rules_type_i
  sec_rules_cidr_ip = var.vpc_cidr_block
  sec_rules_policy  = var.policy
}
module "private_cidr_sg" {
  source            = "../modules/secgrprules"
  sec_grp_id        = module.sec_grp.sec_group_id
  sec_rules_type    = var.sec_rules_type_i
  sec_rules_cidr_ip = var.vpc_cidr_block_sg
  sec_rules_policy  = var.policy
}

// -------------------------------------------- INSTANCE VM & KEYPAIR
module "hkg_vm1" {
  source                     = "../modules/VM"
  allocate_public_ip         = var.allocate_public_ip // MANUALLY RENAME PUB/PRIV AND REMOVE FOR PRIV AFTER TF APPLY, WITHOUT THIS..UNABLE TO SET internet_max_bandwidth_out
  availability_zone          = var.az2
  subnet_id                  = module.subnet_pub_b.subnet_id
  vpc_id                     = module.vpc_hkg.vpc_id
  instance_type              = var.instance_type
  image_id                   = var.image_id
  system_disk_type           = var.system_disk_type
  system_disk_size           = var.system_disk_size
  data_disk_type             = var.data_disk_type
  data_disk_size             = var.data_disk_size
  internet_max_bandwidth_out = var.internet_max_bandwidth_out
  instance_name              = var.instance_name
  hostname                   = var.hostname
  sec_grp                    = module.sec_grp.sec_group_id
  key_name                   = module.tc_prod_hkg1.key_id
  region                     = var.region
}

module "hkg_vm2" {
  source                     = "../modules/VM"
  allocate_public_ip         = var.allocate_public_ip // MANUALLY RENAME PUB/PRIV AND REMOVE FOR PRIV AFTER TF APPLY, WITHOUT THIS..UNABLE TO SET internet_max_bandwidth_out
  availability_zone          = var.az2
  subnet_id                  = module.subnet_priv_b.subnet_id
  vpc_id                     = module.vpc_hkg.vpc_id
  instance_type              = var.instance_type
  image_id                   = var.image_id
  system_disk_type           = var.system_disk_type
  system_disk_size           = var.system_disk_size
  data_disk_type             = var.data_disk_type
  data_disk_size             = var.data_disk_size
  internet_max_bandwidth_out = var.internet_max_bandwidth_out
  instance_name              = var.instance_name
  hostname                   = var.hostname
  sec_grp                    = module.sec_grp.sec_group_id
  key_name                   = module.kp_hkg2.key_id
  region                     = var.region
}

module "kp_hkg1" {
  source            = "../modules/keypair"
  key_name          = var.key_name1
  public_key        = var.public_key1
  availability_zone = var.az2
  region            = var.region
}
module "apex_tc_prod_hkg2" {
  source            = "../modules/keypair"
  key_name          = var.key_name2
  public_key        = var.public_key2
  availability_zone = var.az2
  region            = var.region
}



# // -------------------------------------------- import troubleshooting


# # resource "tencentcloud_instance" "randalltest" {
# #   # (resource arguments)
# # }

