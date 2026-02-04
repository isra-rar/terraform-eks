resource "aws_internet_gateway" "eks_igw" {
  vpc_id = aws_vpc.eks_vpc.id

  tags = merge(
    {
      Name = "${var.project_name}-igw",
    },
    var.tags
  )
}

resource "aws_route_table" "eks_public_route_table" {
  vpc_id = aws_vpc.eks_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.eks_igw.id
  }

  tags = merge(
    {
      Name = "${var.project_name}-public-route-table",
    },
    var.tags
  )
}
