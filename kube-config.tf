resource "null_resource" "get-kube-config" {
  depends_on = [aws_eks_node_group.node-group]
  provisioner "local-exec" {
    command = "aws eks update-kubeconfig  --name ${var.ENV}-eks-cluster"
  }
}

resource "kubernetes_namespace" "example" {
  metadata {
    name = "my-first-namespace"
  }
}

