resource "aws_s3_bucket" "frontend" {
  bucket = "${var.env}-easycrud-frontend"

  tags = {
    Environment = var.env
  }
}

resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.frontend.id

  index_document {
    suffix = "index.html"
  }
}