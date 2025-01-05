resource "aws_subnet" "openn-ai-subnet-pub-1a" {
  vpc_id            = aws_vpc.openn-ai-vpc.id
  cidr_block        = "10.1.1.0/28"
  availability_zone = "${data.aws_region.current.name}a"
  tags = {
    Name = "openn-ai-public-subnet-1a"
  }
}

resource "aws_subnet" "openn-ai-subnet-pub-1b" {
  vpc_id            = aws_vpc.openn-ai-vpc.id
  cidr_block        = "10.1.1.16/28"
  availability_zone = "${data.aws_region.current.name}b"

  tags = {
    Name = "openn-ai-public-subnet-1b"
  }
}

resource "aws_subnet" "openn-ai-subnet-pri-1a" {
  vpc_id            = aws_vpc.openn-ai-vpc.id
  cidr_block        = "10.1.1.128/28"
  availability_zone = "${data.aws_region.current.name}a"

  tags = {
    Name = "openn-ai-private-subnet-1a"
  }
}

resource "aws_subnet" "openn-ai-subnet-pri-1b" {
  vpc_id            = aws_vpc.openn-ai-vpc.id
  cidr_block        = "10.1.1.144/28"
  availability_zone = "${data.aws_region.current.name}b"

  tags = {
    Name = "openn-ai-private-subnet-1b"
  }
}
