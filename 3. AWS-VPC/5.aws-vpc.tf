resource "aws_vpc" "test" {
  cidr_block       = "10.10.0.0/16"
  tags = {
    Name = "test"
  }
}
resource "aws_subnet" "subnet1" {
  vpc_id     = "${aws_vpc.test.id}"
  cidr_block = "10.10.1.0/24"
  availability_zone = "us-west-2a"
  tags = {
    Name = "subnet-1"
  }
}

resource "aws_subnet" "subnet2" {
  vpc_id     = "vpc-0b34570ece0c8524f"
  cidr_block = "10.10.2.0/24"
  availability_zone = "us-west-2b"
  tags = {
    Name = "subnet-2"
  }
}
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.test.id

  tags = {
    Name = "Demo-igw"
  }
}

resource "aws_route_table" "pub-rt" {
 vpc_id = aws_vpc.test.id
 tags = {
 Name = "pub-rt"
}
  route {
    cidr_block = "0.0.0.0/0"
   gateway_id = aws_internet_gateway.igw.id
  }

}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.subnet1.id
  route_table_id = aws_route_table.pub-rt.id
}

resource "aws_instance" "this" {
  ami                     = "ami-0d442a425e2e0a743"
  instance_type           = "t2.micro"
  subnet_id = aws_subnet.subnet1.id
}
