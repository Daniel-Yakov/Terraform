// Create VPC
resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr_block

  tags = merge(var.tags, {
    Name = "daniel-doiteasy-vpc"
  })
}

// Create IGW
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpc.id

  tags = merge(var.tags, {
    Name = "daniel-doiteasy-igw"
  })
}

// Create routing table
resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.vpc.id

  // add route to the routing table
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = merge(var.tags, {
    Name = "daniel-doiteasy-rt"
  })
}

// Create first subnet
resource "aws_subnet" "sub1" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.subnet_cidr_block[0]
  availability_zone = var.az[0]

  tags = merge(var.tags, {
    Name = "daniel-sub-3a-pub"
  })
}

// Create second subnet
resource "aws_subnet" "sub2" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.subnet_cidr_block[1]
  availability_zone = var.az[1]

  tags = merge(var.tags, {
    Name = "daniel-sub-3b-pub"
  })
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
