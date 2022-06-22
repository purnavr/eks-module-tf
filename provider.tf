provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = aws_eks_cluster.eks.arn
}
