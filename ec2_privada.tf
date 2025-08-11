# --- EC2 privada ---
resource "aws_instance" "private_ec2" {
  ami                         = "ami-08a6efd148b1f7504"
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.private_1.id
  vpc_security_group_ids      = [aws_security_group.private_sg.id]
  iam_instance_profile        = aws_iam_instance_profile.ec2_profile.name
  associate_public_ip_address = false
  key_name                    = aws_key_pair.generated_key.key_name

  tags = local.tag
}
