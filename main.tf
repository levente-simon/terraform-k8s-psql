terraform {
}


provider "kubernetes" {
  host                   = var.k8s_host
  client_certificate     = var.k8s_client_certificate
  client_key             = var.k8s_client_key
  cluster_ca_certificate = var.k8s_cluster_ca_certificate
  token                  = var.k8s_cluster_client_token
}

provider "helm" {
  kubernetes {
    host                   = var.k8s_host
    client_certificate     = var.k8s_client_certificate
    client_key             = var.k8s_client_key
    cluster_ca_certificate = var.k8s_cluster_ca_certificate
    token                  = var.k8s_cluster_client_token
  }
}

variable "module_depends_on" {
  type    = any
  default = []
}

resource "kubernetes_namespace" "postgresql" {
  depends_on = [ var.module_depends_on ]

  lifecycle {
    ignore_changes  = all 
  }

  metadata {
    name = var.postgresql_namespace
  }
}

resource "kubernetes_manifest" "postgresql_tls" {
  depends_on = [ kubernetes_namespace.postgresql ]

  manifest   = {
    "apiVersion" = "cert-manager.io/v1"
    "kind"       = "Certificate"
    "metadata"   = {
      "name"        = "postgresql-tls"
      "namespace"   = "${var.postgresql_namespace}"
    }
    "spec"       = {
      "secretName"  = "postgresql-tls"
      "duration"    = "48h0m0s"
      "renewBefore" = "2h0m0s"
      "subject"     = {
        "organizations" = [ "Corp" ]
      }
      "privateKey"  = {
        "algorithm"     = "RSA"
        "encoding"      = "PKCS1"
        "size"          = "2048"
      }
      "usages"      = [ "server auth"  ]
      "dnsNames"    = [ "${var.postgresql_fqdn}",
                        "*.postgresql-postgresql-ha-postgresql-headless.${var.postgresql_namespace}.svc.cluster.local"
                      ]
      "issuerRef"   = { 
        "name"  = "vault-issuer"
        "kind"  = "ClusterIssuer"
      }
    }
  }
}

resource "helm_release" "postgresql" {
  depends_on = [ kubernetes_namespace.postgresql ]
  name       = "postgresql"

  lifecycle {
    ignore_changes  = all 
  }

  repository = "https://charts.bitnami.com/bitnami"
  chart      = "postgresql-ha"
  namespace  = var.postgresql_namespace
  values     = [ "${format(file("${path.module}/etc/postgresql-config.yaml"), 
                     var.postgresql_replica_count,
                     var.postgresql_password,
                     var.postgresql_volume_size,
                     var.postgresql_fqdn,
                     var.pgpool_usernames,
                     var.pgpool_passwords)}"
               ]
}

data "kubernetes_secret" "postgresql" {
  depends_on = [ helm_release.postgresql ]

  metadata {
    name      = "postgresql-postgresql-ha-postgresql"
    namespace = var.postgresql_namespace
  }
}