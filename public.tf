resource "aws_subnet" "eks_subnet_public_1a" {
  vpc_id                  = aws_vpc.eks_vpc.id
  cidr_block              = cidrsubnet(aws_vpc.eks_vpc.cidr_block, 8, 1)
  availability_zone       = "${aws_vpc.eks_vpc.region}a"
  map_public_ip_on_launch = true

  tags = merge(
    {
      Name                     = "rodg-eks-subnet-public-1a",
      "kubernetes.io/role/elb" = "1"
    },
    local.tags
  )
}

resource "aws_subnet" "eks_subnet_public_1b" {
  vpc_id                  = aws_vpc.eks_vpc.id
  cidr_block              = cidrsubnet(aws_vpc.eks_vpc.cidr_block, 8, 2)
  availability_zone       = "${aws_vpc.eks_vpc.region}b"
  map_public_ip_on_launch = true

  tags = merge(
    {
      Name                     = "rodg-eks-subnet-public-1b",
      "kubernetes.io/role/elb" = "1"
    },
    local.tags
  )
}