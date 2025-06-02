resource "aws_s3_bucket" "openn-ai" {
  bucket = "openn-ai"
}

resource "aws_s3_bucket" "financial-data" {
  bucket = "openn-ai-financial-data"
}
