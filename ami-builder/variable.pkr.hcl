variable region {
  description = "AWS region"
  type        = string
  default     = "us-east-2"
}

variable instance_type {
  description = "instance type for AMI"
  type        = string
  default     = "t2.micro"
}

variable ssh_user_name {
  description = "ssh user for instance"
  type        = string
  default     = "ubuntu"
}

variable image_name {
  description = "Image name"
  type        = string
  default     = "packer-ami-{{timestamp}}"
}