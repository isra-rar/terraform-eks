resource "aws_eip" "eks_ngw_eip_1a" {
  domain = "vpc"

  tags = merge(
    {
      Name = "${var.project_name}-ngw-eip-1a",
    },
    local.tags
  )
}

resource "aws_eip" "eks_ngw_eip_1b" {
  domain = "vpc"

  tags = merge(
    {
      Name = "${var.project_name}-ngw-eip-1b",
    },
    local.tags
  )
}

resource "aws_nat_gateway" "eks_ngw_1a" {
  allocation_id = aws_eip.eks_ngw_eip_1a.id
  subnet_id     = aws_subnet.eks_subnet_public_1a.id

  tags = merge(
    {
      Name = "${var.project_name}-ngw-1a",
    },
    local.tags
  )
}

resource "aws_nat_gateway" "eks_ngw_1b" {
  allocation_id = aws_eip.eks_ngw_eip_1b.id
  subnet_id     = aws_subnet.eks_subnet_public_1b.id

  tags = merge(
    {
      Name = "${var.project_name}-ngw-1b",
    },
    local.tags
  )
}

resource "aws_route_table" "eks_private_route_table_1a" {
  vpc_id = aws_vpc.eks_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.eks_ngw_1a.id
  }

  tags = merge(
    {
      Name = "${var.project_name}-private-route-table-1a",
    },
    local.tags
  )
}


resource "aws_route_table" "eks_private_route_table_1b" {
  vpc_id = aws_vpc.eks_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.eks_ngw_1b.id
  }

  tags = merge(
    {
      Name = "${var.project_name}-private-route-table-1b",
    },
    local.tags
  )
}