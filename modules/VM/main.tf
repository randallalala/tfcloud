


resource "tencentcloud_instance" "vm_instance" {
  allocate_public_ip = var.allocate_public_ip // MANUALLY RENAME PUB/PRIV AND REMOVE FOR PRIV AFTER TF APPLY, WITHOUT THIS..UNABLE TO SET internet_max_bandwidth_out
  availability_zone  = var.availability_zone
  subnet_id          = var.subnet_id
  vpc_id             = var.vpc_id
  instance_type      = var.instance_type
  image_id           = var.image_id
  system_disk_type   = var.system_disk_type
  system_disk_size   = var.system_disk_size
  data_disks {
    data_disk_size = var.data_disk_size
    data_disk_type = var.data_disk_type
  }
  internet_max_bandwidth_out = var.internet_max_bandwidth_out
  security_groups            = []
  key_name                   = var.key_name
  instance_name              = var.instance_name
  hostname                   = var.hostname
}
