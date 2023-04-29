# do-domain

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_digitalocean"></a> [digitalocean](#requirement\_digitalocean) | 2.22.3 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_digitalocean"></a> [digitalocean](#provider\_digitalocean) | 2.22.3 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [digitalocean_domain.domain](https://registry.terraform.io/providers/digitalocean/digitalocean/2.22.3/docs/resources/domain) | resource |
| [digitalocean_record.a_records](https://registry.terraform.io/providers/digitalocean/digitalocean/2.22.3/docs/resources/record) | resource |
| [digitalocean_record.cname_records](https://registry.terraform.io/providers/digitalocean/digitalocean/2.22.3/docs/resources/record) | resource |
| [digitalocean_record.ns_records](https://registry.terraform.io/providers/digitalocean/digitalocean/2.22.3/docs/resources/record) | resource |
| [digitalocean_domain.domain](https://registry.terraform.io/providers/digitalocean/digitalocean/2.22.3/docs/data-sources/domain) | data source |
| [digitalocean_records.ns_records](https://registry.terraform.io/providers/digitalocean/digitalocean/2.22.3/docs/data-sources/records) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_a_record_list"></a> [a\_record\_list](#input\_a\_record\_list) | A list of A records to create. | <pre>list(object({<br>    name : string,<br>    value : string,<br>    ttl : optional(number)<br>  }))</pre> | `[]` | no |
| <a name="input_cname_record_list"></a> [cname\_record\_list](#input\_cname\_record\_list) | A list of CNAME records to create. | <pre>list(object({<br>    name : string,<br>    value : string,<br>    ttl : optional(number)<br>  }))</pre> | `[]` | no |
| <a name="input_create_domain"></a> [create\_domain](#input\_create\_domain) | Shall we create a new domain, or reuse an existing one | `bool` | `false` | no |
| <a name="input_do_domain"></a> [do\_domain](#input\_do\_domain) | The domain to create | `string` | n/a | yes |
| <a name="input_ns_record_list"></a> [ns\_record\_list](#input\_ns\_record\_list) | A list of NS records to create. | <pre>list(object({<br>    name : string,<br>    value : string,<br>    ttl : optional(number)<br>  }))</pre> | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_do_ns_records"></a> [do\_ns\_records](#output\_do\_ns\_records) | The delegation to set in the parent zone. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
