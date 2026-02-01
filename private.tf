resource "aws_subnet" "eks_subnet_private_1a" {
  vpc_id            = aws_vpc.eks_vpc.id
  cidr_block        = cidrsubnet(aws_vpc.eks_vpc.cidr_block, 8, 3)
  availability_zone = "${aws_vpc.eks_vpc.region}a"

  tags = merge(
    {
      Name                              = "rodg-eks-subnet-private-1a",
      "kubernetes.io/role/internal-elb" = "1"
    },
    local.tags
  )
}

resource "aws_subnet" "eks_subnet_private_1b" {
  vpc_id            = aws_vpc.eks_vpc.id
  cidr_block        = cidrsubnet(aws_vpc.eks_vpc.cidr_block, 8, 4)
  availability_zone = "${aws_vpc.eks_vpc.region}b"

  tags = merge(
    {
      Name                              = "rodg-eks-subnet-private-1b",
      "kubernetes.io/role/internal-elb" = "1"
    },
    local.tags
  )
}