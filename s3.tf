
# --- Bucket S3 ---
resource "aws_s3_bucket" "my_bucket" {
  bucket = "test-1-caleidos-terraform-bucket"
  tags = local.tag
}
