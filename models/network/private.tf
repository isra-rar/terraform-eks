resource "aws_subnet" "eks_subnet_private_1a" {
  vpc_id            = aws_vpc.eks_vpc.id
  cidr_block        = cidrsubnet(aws_vpc.eks_vpc.cidr_block, 8, 3)
  availability_zone = "${aws_vpc.eks_vpc.region}a"

  tags = merge(
    {
      Name                              = "${var.project_name}-subnet-private-1a",
      "kubernetes.io/role/internal-elb" = "1"
    },
    var.tags
  )
}

resource "aws_subnet" "eks_subnet_private_1b" {
  vpc_id            = aws_vpc.eks_vpc.id
  cidr_block        = cidrsubnet(aws_vpc.eks_vpc.cidr_block, 8, 4)
  availability_zone = "${aws_vpc.eks_vpc.region}b"

  tags = merge(
    {
      Name                              = "${var.project_name}-subnet-private-1b",
      "kubernetes.io/role/internal-elb" = "1"
    },
    var.tags
  )
}

resource "aws_route_table_association" "eks_private_rtb_assoc_1a" {
  subnet_id      = aws_subnet.eks_subnet_private_1a.id
  route_table_id = aws_route_table.eks_private_route_table_1a.id
}

resource "aws_route_table_association" "eks_private_rtb_assoc_1b" {
  subnet_id      = aws_subnet.eks_subnet_private_1b.id
  route_table_id = aws_route_table.eks_private_route_table_1b.id
}