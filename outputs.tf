output "postgresql_password" {
  value     = kubernetes_secret.postgresql.data.postgresql-password
  sensitive = true
}