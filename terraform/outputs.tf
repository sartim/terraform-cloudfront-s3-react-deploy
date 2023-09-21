output "cloudfront_domain_name" {
  value = aws_cloudfront_distribution.terraform_cloudfront_s3_react_deploy.domain_name
}
