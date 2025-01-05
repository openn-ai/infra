resource "aws_route_table" "openn-ai-pub-rtb" {
  vpc_id = aws_vpc.openn-ai-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.openn-ai-igw.id
  }

  tags = {
    Name = "openn-ai-public-rtb"
  }
}

resource "aws_route_table" "openn-ai-pri-rtb" {
  vpc_id = aws_vpc.openn-ai-vpc.id

  tags = {
    Name = "openn-ai-private-rtb"
  }
}

resource "aws_route_table_association" "pub-rtb-1b" {
  route_table_id = aws_route_table.openn-ai-pub-rtb.id
  subnet_id      = aws_subnet.openn-ai-subnet-pub-1b.id
}

resource "aws_route_table_association" "pub-rtb-1a" {
  route_table_id = aws_route_table.openn-ai-pub-rtb.id
  subnet_id      = aws_subnet.openn-ai-subnet-pub-1a.id
}

resource "aws_route_table_association" "pri-rtb-1b" {
  route_table_id = aws_route_table.openn-ai-pri-rtb.id
  subnet_id      = aws_subnet.openn-ai-subnet-pri-1b.id
}

resource "aws_route_table_association" "pri-rtb-1a" {
  route_table_id = aws_route_table.openn-ai-pri-rtb.id
  subnet_id      = aws_subnet.openn-ai-subnet-pri-1a.id
}
