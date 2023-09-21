variable "aws_region" {
    type = string
    default = "eu-west-1"
    description = "AWS Region. Set using tfvars files or environ variables"
}

variable "acm_certificate_arn" {
    type = string
    default = ""
    description = "ACM Certificate"
}

variable "domain" {
    type = string
    default = ""
    description = "Domain name. Set using tfvars files or environment variables"
}

variable "s3_bucket" {
    type = string
    default = ""
    description = "S3 bucket. Set using tfvars files or environment variables"
}
