resource "aws_vpc" "openn-ai-vpc" {
  cidr_block = "10.1.1.0/24"
  instance_tenancy = "default"
  enable_dns_hostnames = true
  tags = {
    Name = "openn-ai-vpc"
  }
}
