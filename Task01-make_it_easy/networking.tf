// Create VPC
resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "daniel-doiteasy-vpc"
    Owner = "Daniel Yakov"
    bootcamp = "17"
    expiration_date = "01-04-2023"
  }
}

// Create IGW
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "daniel-doiteasy-igw"
    Owner = "Daniel Yakov"
    bootcamp = "17"
    expiration_date = "01-04-2023"
  }
}

// Create routing table
resource "aws_route_table" "rt" {
    vpc_id = aws_vpc.vpc.id

    // add route to the routing table
    route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.gw.id
    }

    tags = {
      Name = "daniel-doiteasy-rt"
      Owner = "Daniel Yakov"
      bootcamp = "17"
      expiration_date = "01-04-2023"
    }
}

// Create first subnet
resource "aws_subnet" "sub1" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "eu-west-3a"

  tags = {
    Name = "daniel-sub-3a-pub"
    Owner = "Daniel Yakov"
    bootcamp = "17"
    expiration_date = "01-04-2023"
  }
}

// Create second subnet
resource "aws_subnet" "sub2" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "eu-west-3b"

  tags = {
    Name = "daniel-sub-3b-pub"
    Owner = "Daniel Yakov"
    bootcamp = "17"
    expiration_date = "01-04-2023"
  }
}

// Associate first subnet to route table
resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.sub1.id
  route_table_id = aws_route_table.rt.id
}

// Associate second subnet to route table
resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.sub2.id
  route_table_id = aws_route_table.rt.id
}
