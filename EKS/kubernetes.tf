provider "kubernetes" {
  host                  = data.aws_eks_cluster.cluster.cluster_endpoint_public_access
  token                 = data.aws_eks_cluster.token
  cluster_ca_certificate= base64encode(data.aws_eks_cluster.cluster.cluster_ca_certificate_authority.0.date)
}

resource "kubernetes_namespace" "text" {
  metadata {
    name = "nginx"
    namespace = kubernetes_namespace.test.metadata.0.name
  }
  spec {
    replicas = 2
    selector {
      match_labels = {
        app = "MyTestApp"
      }
    }
    template{
      metadata {
        labels = {
          app = "MyTestApp"
        }
      }
    }
  }
}
