# Configure Virtual private cloud (VPC)
resource "aws_vpc" "web-vpc" {
  cidr_block           = var.cidr_vpc
  instance_tenancy     = "default"
  enable_dns_hostnames = false
  enable_dns_support   = true
  tags = {
    Name = "${var.env_name}"
  }
}


# Configure a public subnet 
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.web-vpc.id
  cidr_block              = var.cidr_subnet
  availability_zone       = var.a_zone
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.env_name}"
    Type = "Public"
  }
}

# Configure Internet gateway 
resource "aws_internet_gateway" "web" {
  vpc_id = aws_vpc.web-vpc.id
  tags = {
    Name = "igw-${var.env_name}"
  }
}


# Configure public Route Table 
resource "aws_route_table" "rtb_pub" {
  vpc_id = aws_vpc.web-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.web.id
  }

  tags = {
    Name = "pub_rt_${var.env_name}"
  }
}
# Configure Route Table association for public subnet 
resource "aws_route_table_association" "rta_pub_subnet" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.rtb_pub.id
}
