variable "allocate_public_ip" { default = true }
variable "availability_zone" {
  # default = "ap-hongkong-1" 
} 
variable "subnet_id" { default = "" }
variable "vpc_id" { default = "" }
variable "instance_type" { default = "S5.235D" }
variable "image_id" { default = "img-235" } //required
variable "system_disk_type" { default = "CLOUD_SSD" }
variable "system_disk_size" { default = 10000 }
variable "data_disk_type" { default = "CLOUD_SSD" }
variable "data_disk_size" { default = 20000 }
variable "internet_max_bandwidth_out" { default = 10000 }
variable "security_groups" { default = [] }
variable "sec_grp" { default = "" }
variable "instance_name" { default = "XX" }
variable "hostname" { default = "root" }
variable "key_name" { default = "" }
variable "public_key" { default = "" }

// --------------------- providers
variable "gitlab_token" { default = "XX" }
variable "region" { default = "" }
