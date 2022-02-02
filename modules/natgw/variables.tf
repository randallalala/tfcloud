variable "gitlab_token" { default = "XX" }
variable "region" { default = "ap-hongkong" }
//----------------------------------------------------
variable "eip_name" {  default = "eip"}
variable "nat_gw_name" { default = "nat_gw" }
variable "vpc_id" { default = "" }
variable "bandwidth" { default = 5000 }
variable "max_concurrent" { default = 1000000 }
