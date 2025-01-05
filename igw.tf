resource "aws_internet_gateway" "openn-ai-igw" {
  vpc_id = aws_vpc.openn-ai-vpc.id
}
