
# --- NAT Gateway ---
resource "aws_eip" "nat_eip" {
  domain    = "vpc"
  tags      = local.tag
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public_1.id
  tags         = local.tag
}
