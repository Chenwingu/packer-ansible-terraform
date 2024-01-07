
variable "cidr_vpc" {
  description = "cidr range for vpc"
  type        = string
}

variable "cidr_subnet" {
  description = "cidr range for public subnet"
  type        = string
}

variable "a_zone" {
  description = "Availability zone"
  type        = string
}

variable "env_name" {
  type        = string
  description = "environment"
}

variable "instance_types" {
  description = "instance type for the webserver instance"
  type        = string
}

variable "key_name" {
  description = "keypair for the webserver instance "
  type        = string
}

variable "images" {
  description = "images for the webserver instance"
  type        = string
}

# Configure variable for webserver security group
variable "incoming_traffic" {
  type = list(object({
    port        = number
    description = string
    protocol    = string
  }))
  description = "ingress rule for security group of webserver"
  default = [{
    description = "inbound rule for webserver  for ssh"
    port        = 22
    protocol    = "tcp"
    },
    {
      description = "inbound rule for webserver (http)"
      port        = 80
      protocol    = "tcp"
  }]
}
