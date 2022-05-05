output "website" {
    value = aws_s3_bucket_website_configuration.hosting-config.website_endpoint
}