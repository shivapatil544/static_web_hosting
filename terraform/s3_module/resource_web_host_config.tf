resource "aws_s3_bucket_website_configuration" "hosting-config" {
  bucket = var.bucket_name
  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

}
