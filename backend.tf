terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.99.1"
    }
  }

  backend "s3" {
    bucket = "openn-ai"
    key    = "tf-state"
    region = "us-east-1"
  }
}
