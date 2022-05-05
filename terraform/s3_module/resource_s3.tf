resource "aws_s3_bucket" "web_bucket" {
  bucket = var.bucket_name

  tags = {
    Name        = "My bucket"
    Description = "bucket for static web deployment"
  }

}

resource "aws_s3_bucket_acl" "web_bucket_bucket_acl" {
  bucket = aws_s3_bucket.web_bucket.id
  acl    = var.bucket_acl
}

resource "aws_s3_bucket_policy" "allow_public_access" {
  bucket = aws_s3_bucket.web_bucket.id
  policy = file(var.policy_path)
}

resource "aws_s3_bucket_object" "upload_files" {
  for_each     = fileset(var.html_css_path, "**")
  bucket       = aws_s3_bucket.web_bucket.id
  key          = each.value
  source       = "../documents/website/${each.value}"
  content_type = "text/html"
  etag         = filemd5("../documents/website/${each.value}")
}

