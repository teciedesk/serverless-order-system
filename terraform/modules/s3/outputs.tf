output "bucket_name" {
  value = aws_s3_bucket.static_site.id
}

output "website_endpoint" {
  value = aws_s3_bucket_website_configuration.static_site.website_endpoint
}

resource "aws_s3_bucket" "source" {
  bucket = "your-source-bucket-name"
}

resource "aws_s3_bucket" "destination" {
  bucket = "your-dr-destination-bucket"
}
