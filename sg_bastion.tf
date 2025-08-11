# --- Security Group para bastión host ---
resource "aws_security_group" "bastion_sg" {
  name        = "bastion-sg"
  description = "Permitir SSH desde mi IP"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["38.25.15.5/32"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = local.tag
}