# Data source to fetch the most recent Ubuntu 20.04 HVM EBS AMI from Canonical
data "amazon-ami" "ubuntu" {
  filters = {
    virtualization-type = "hvm"
    root-device-type    = "ebs"
    name                = "ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"
  }
  
  owners      = ["099720109477"]
  most_recent = true
  region      = var.region
}