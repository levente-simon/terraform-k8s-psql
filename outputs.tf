output "postgresql-password" {
  value     = kubernetes_secret.postgresql.data.postgresql-password
  sensitive = true
}