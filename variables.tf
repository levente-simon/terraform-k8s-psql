variable "postgresql_fqdn"        { type = string   }

variable "postgresql_volume_size" {
  type    = string
  default = "6Gi"
}

variable "postgresql_replica_count" {
  type    = number
  default = 3
}

variable "postgresql_password" {
  type      = string
  default   = ""
  sensitive = true
}

variable "postgresql_namespace" {
  type    = string
  default = "postgresql"
}

variable "pgpool_usernames" {
  type = string
  default = ""
}
variable "pgpool_passwords" {
  type = string
  default = ""
}

variable "k8s_host" {
  type      = string
  sensitive = true
}

variable "k8s_client_certificate" {
  type      = string
  sensitive = true
  default   = ""
}

variable "k8s_client_key" {
  type      = string
  sensitive = true
  default   = ""
}

variable "k8s_cluster_ca_certificate" {
  type      = string
  sensitive = true
  default   = ""
}

variable "k8s_cluster_client_token" {
  type      = string
  sensitive = true
  default   = ""
}
