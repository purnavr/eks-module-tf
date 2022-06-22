resource "null_resource" "get-kube-config" {
  depends_on = [aws_eks_node_group.node-group]
  provisioner "local-exec" {
    command = "aws eks update-kubeconfig  --name ${var.ENV}-eks-cluster"
  }
}

provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = aws_eks_cluster.eks.arn
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
    exec {
      api_version = "client.authentication.k8s.io/v1alpha1"
      args        = ["eks", "get-token", "--cluster-name", "${var.ENV}-eks-cluster"]
      command     = "aws"
    }
  }
}



