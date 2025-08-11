
resource "tls_private_key" "my_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated_key" {
  key_name   = "keypair_privado"
  public_key = tls_private_key.my_key.public_key_openssh
}

resource "aws_s3_object" "my_private_key_s3" {
  bucket = aws_s3_bucket.my_bucket.id
  key    = "keypair_privado.pem"
  content = tls_private_key.my_key.private_key_pem
  acl = "private"
}