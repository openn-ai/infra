data "aws_region" "current" {}

resource "aws_vpc_endpoint" "openn-ai-s3-vpce" {
  service_name = "com.amazonaws.${data.aws_region.current.name}.s3"
  vpc_id       = aws_vpc.openn-ai-vpc.id

  route_table_ids = [
    aws_route_table.openn-ai-pri-rtb.id
  ]

  tags = {
    Name = "openn-ai-s3"
  }
}
