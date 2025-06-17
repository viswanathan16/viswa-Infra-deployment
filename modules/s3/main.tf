resource "aws_s3_bucket" "my-s3" {
  bucket = "var.bucket_name-${var.env}"


tags ={
    Name = "my-infrabucket-${var.env}"
    Environment = var.env
 }
}

 resource "aws_s3_bucket_ownership_controls" "ownership" {
  bucket = aws_s3_bucket.my-s3.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.my-s3.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}


resource "aws_s3_bucket_acl" "example" {
  depends_on = [
    aws_s3_bucket_ownership_controls.ownership,
    aws_s3_bucket_public_access_block.example,
  ]

  bucket = aws_s3_bucket.my-s3.id
  acl    = "public-read"
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.my-s3
  versioning_configuration {
    status = "Enabled"
  }
}