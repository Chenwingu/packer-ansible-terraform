# Configure security group for Webserver 
resource "aws_security_group" "server" {
  name        = "webserver-sg"
  vpc_id      = aws_vpc.web-vpc.id

  dynamic "ingress" {
    for_each = var.incoming_traffic
    content {
      description = ingress.value.description
      protocol    = ingress.value.protocol
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "sg-${var.env_name}"
  }
}