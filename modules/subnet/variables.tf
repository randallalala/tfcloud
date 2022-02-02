variable "vpc_id" { default = "" }
variable "route_table_id" { default = "" }
variable "availability_zone" {}
variable "subnet_id" { default = "" }

variable "subnet_name" { default = "subnet" }
variable "subnet_cidr_block" { default = "" }

// ------------------providers
variable "gitlab_token" { default = "XX" }
variable "region" { default = "ap-hongkong" }
