output "postgresql_password" {
  value     = data.kubernetes_secret.postgresql.data.postgresql-password
  sensitive = true
}