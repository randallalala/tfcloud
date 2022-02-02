variable "allocate_public_ip" { default = true }
variable "availability_zone" {
  # default = "ap-hongkong-1" 
} //required

# variable "key_name" { default = "test" }
variable "key_name" { default = "" }
variable "public_key" { default = "" }

// --------------------- providers
variable "gitlab_token" { default = "XX" }
variable "region" { default = "" }
