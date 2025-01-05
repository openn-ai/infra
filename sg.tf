resource "aws_security_group" "openn-ai-sg" {
  vpc_id = aws_vpc.openn-ai-vpc.id
}