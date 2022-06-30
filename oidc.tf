data "external" "thumb" {
  program = ["kubergrunt", "eks", "oidc-thumbprint", "--issuer-url", aws_eks_cluster.eks.identity.0.oidc.0.issuer]
}

resource "aws_iam_openid_connect_provider" "cluster" {
  client_id_list  = ["sts.amazonaws.com"]
  thumbprint_list = [data.external.thumb.result.thumbprint]
  url             = aws_eks_cluster.eks.identity.0.oidc.0.issuer
}

//data "aws_caller_identity" "current" {}
//
//data "aws_iam_policy_document" "policy_document" {
//  statement {
//    actions = ["sts:AssumeRoleWithWebIdentity"]
//
//    condition {
//      test = "ForAnyValue:StringLike"
//      variable = "${replace(
//        aws_eks_cluster.eks.identity[0].oidc[0].issuer,
//        "https://",
//        "",
//      )}:sub"
//      values = local.serviceAccountList
//    }
//
//    principals {
//      identifiers = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:oidc-provider/${replace(
//        aws_eks_cluster.eks.identity[0].oidc[0].issuer,
//        "https://",
//        "",
//      )}"]
//      type = "Federated"
//    }
//  }
//}
//
//resource "aws_iam_role" "role" {
//  name               = format("%s-%s", , var.role_name)
//  assume_role_policy = data.aws_iam_policy_document.policy_document.json
//
//  tags = merge(
//    var.tags,
//    {
//      Name = format("%s-%s", var.cluster_name, var.role_name)
//    }
//  )
//}