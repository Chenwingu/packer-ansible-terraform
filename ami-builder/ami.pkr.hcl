source "amazon-ebs" "ubuntu" {
  assume_role {
    role_arn     = "arn:aws:iam::Account_ID:role/Role_Name"
    session_name = "packer-session"

  }
  region        = var.region
  source_ami    = data.amazon-ami.ubuntu.id
  instance_type = var.instance_type
  ssh_username  = var.ssh_user_name
  ami_name      = var.image_name
  
  tags = {
    "Name": "Packer-Ami" // Used by Terraform during EC2 launching
  }
}

build {
  name = "create-ami"
  sources = [
    "source.amazon-ebs.ubuntu"
  ]

# Install and configure the web server on the EC2 instance using Ansible
  provisioner "ansible"{
    playbook_file = "./ami-builder/configuration/playbook.yml"
  }
}