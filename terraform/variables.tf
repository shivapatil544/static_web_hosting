variable "input_bucket_name" {
  type    = string
  default = "static-web-hosting-544"
}

variable "input_bucket_acl" {
  type    = string
  default = "public-read"
}

variable "input_policy_path" {
  type    = string
  default = "../documents/policy.json"
}

variable "input_html_css_path" {
  type    = string
  default = "../documents/website/"
}