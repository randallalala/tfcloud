variable "sec_grp_id" { default = "" }
variable "sec_rules_type" { default = "ingress" }
variable "sec_rules_cidr_ip" { default = "0.0.0.0/0" }
variable "sec_rules_policy" { default = "accept" }
//------------------providers
variable "gitlab_token" { default = "XX" }
variable "region" { default = "ap-hongkong" }

variable "ip_protocol_misc" { default = "TCP" }
variable "portrange_misc" { default = "80" }

