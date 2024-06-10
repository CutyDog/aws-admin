resource "aws_s3_bucket" "tfstate" {
  bucket = "cutydog-organization-admin-tfstate"
}

resource "aws_s3_bucket_versioning" "tfstate" {
  bucket = aws_s3_bucket.tfstate.bucket
  versioning_configuration {
    status = "Enabled"
  }
}
