resource "aws_cloudfront_distribution" "terraform_cloudfront_s3_react_deploy" {
  origin {
    domain_name = aws_s3_bucket.terraform_cloudfront_s3_react_deploy.website_endpoint
  }

  enabled             = true
  is_ipv6_enabled     = true
  comment = "Terraform CloudFront S3 React Deploy Demo"
  default_root_object = "index.html"
  wait_for_deployment = false

  custom_error_response = {
    error403 = {
      error_code         = 403
      response_code      = 404
      response_page_path = "/404.html"
    }
    error404 = {
      error_code         = 404
      response_code      = 404
      response_page_path = "/404.html"
    }
  }

  default_cache_behavior {
    target_origin_id = aws_s3_bucket.terraform_cloudfront_s3_react_deploy.id

    viewer_protocol_policy = "redirect-to-https"
    allowed_methods        = ["GET", "HEAD", "OPTIONS"]
    cached_methods         = ["GET", "HEAD"]
    compress        = true

    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }

    min_ttl    = 3600
    default_ttl = 3600
    max_ttl    = 7200
  }

  viewer_certificate {
    acm_certificate_arn = var.acm_certificate_arn
    ssl_support_method = "sni-only"
  }

  aliases = [var.domain]
}