# Configure Webserver
resource "aws_instance" "server" {
  ami           = data.aws_ami.ubuntu.id #reference data-source.tf
  instance_type = var.instance_types
  key_name      = var.key_name
  subnet_id     = aws_subnet.public_subnet.id

  tags = {
    Name = "ec2-${var.env_name}"
  }
  vpc_security_group_ids = [aws_security_group.server.id]
}