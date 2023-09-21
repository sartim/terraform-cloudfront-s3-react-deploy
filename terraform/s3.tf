resource "aws_s3_bucket" "terraform_cloudfront_s3_react_deploy" {
  bucket = var.s3_bucket
  acl    = "public-read"
  force_destroy = true

  website {
    index_document = "index.html"
  }
}