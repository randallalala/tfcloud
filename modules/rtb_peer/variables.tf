variable "vpc_id" { default = "" }
variable "rtb_priv_name" { default = "rtb_private" }
variable "destination_cidr_block" { default = "0.0.0.0/0" }
variable "next_type" { default = "CVM" }
variable "next_hub" { default = "0" }

//---------------provider
variable "gitlab_token" { default = "XX" }
variable "region" { default = "ap-hongkong" }

