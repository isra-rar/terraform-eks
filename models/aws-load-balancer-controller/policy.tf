resource "aws_iam_policy" "eks_controller_policy" {
  name = "${var.project_name}-aws_load-balancer-controller-policy"

  policy = file("${path.module}/iam_policy.json")

  tags = merge(
    {
      Name = "${var.project_name}-aws_load_balancer_controller_policy",
    },
    var.tags
  )
}