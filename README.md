## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | n/a |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [helm_release.postgresql](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [kubernetes_manifest.postgresql_tls](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/manifest) | resource |
| [kubernetes_namespace.postgresql](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [kubernetes_secret.postgresql](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/data-sources/secret) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_k8s_host"></a> [k8s\_host](#input\_k8s\_host) | n/a | `string` | n/a | yes |
| <a name="input_postgresql_fqdn"></a> [postgresql\_fqdn](#input\_postgresql\_fqdn) | n/a | `string` | n/a | yes |
| <a name="input_k8s_client_certificate"></a> [k8s\_client\_certificate](#input\_k8s\_client\_certificate) | n/a | `string` | `""` | no |
| <a name="input_k8s_client_key"></a> [k8s\_client\_key](#input\_k8s\_client\_key) | n/a | `string` | `""` | no |
| <a name="input_k8s_cluster_ca_certificate"></a> [k8s\_cluster\_ca\_certificate](#input\_k8s\_cluster\_ca\_certificate) | n/a | `string` | `""` | no |
| <a name="input_k8s_cluster_client_token"></a> [k8s\_cluster\_client\_token](#input\_k8s\_cluster\_client\_token) | n/a | `string` | `""` | no |
| <a name="input_module_depends_on"></a> [module\_depends\_on](#input\_module\_depends\_on) | n/a | `any` | `[]` | no |
| <a name="input_postgresql_namespace"></a> [postgresql\_namespace](#input\_postgresql\_namespace) | n/a | `string` | `"postgresql"` | no |
| <a name="input_postgresql_password"></a> [postgresql\_password](#input\_postgresql\_password) | n/a | `string` | `""` | no |
| <a name="input_postgresql_replica_count"></a> [postgresql\_replica\_count](#input\_postgresql\_replica\_count) | n/a | `number` | `3` | no |
| <a name="input_postgresql_volume_size"></a> [postgresql\_volume\_size](#input\_postgresql\_volume\_size) | n/a | `string` | `"6Gi"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_postgresql_password"></a> [postgresql\_password](#output\_postgresql\_password) | n/a |
