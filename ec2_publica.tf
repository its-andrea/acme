
# --- Bastion Host (EC2 pública) ---
resource "aws_instance" "bastion" {
  ami                  = "ami-08a6efd148b1f7504" # Amazon Linux 2
  instance_type        = "t3.micro"
  subnet_id            = aws_subnet.public_1.id
  security_groups      = [aws_security_group.bastion_sg.id]
  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name
  key_name             = aws_key_pair.generated_key.key_name
  user_data            = <<-EOF
    #!/bin/bash
    aws s3 cp s3://test-1-caleidos-terraform-bucket/keypair_privado.pem /keypair_privado.pem
  EOF
  tags                 = local.tag
}
