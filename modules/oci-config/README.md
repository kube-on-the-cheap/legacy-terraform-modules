# oci-config

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
---
title: oci-config
author: Marco Bulgarini
tags:
- config
- ini
- oracle cloud
- infrastructure
---

# `oci-config` Module

The `oci-config` module is intended to parse the configuration in the `~/.oci/config` file as generated after the `oci setup bootstrap` command.

The bootstrap process is required in order to have a file to parse at all, and the optional variable is validated against the possiiblity that the config file is inaccessible or missing.

## SSH key format

Please be aware that the bootstrap process creates an SSH key that, at the time of writing, is in a format (PKCS#8) that is not parsed from the OCI Terraform provider. A bug has been opened [here](https://github.com/oracle/terraform-provider-oci/issues/1647). Until that is fixed, please rewrite your SSH key in PKCS#1 format with:

```bash
key_file=$(awk -F = '/key_file/ { print $2 }' ${HOME}/.oci/config )
key_file_dirname=$(dirname $key_file)
key_file_basename=$(basename $key_file .pem)
new_key_file="${key_file_dirname}/${key_file_basename}_rsa.pem"
pass_phrase=$(awk -F = '/pass_phrase/ { print $2 }' ${HOME}/.oci/config )
openssl rsa -des3 \
  -in ${key_file} -passin "pass:${pass_phrase}" \
  -out ${new_key_file} -passout "pass:${pass_phrase}"
```

and use that in `~/.oci/config`:

```bash
chmod 0600 ${new_key_file}
sed -i .bak  "s|^key_file=.*$|key_file=${new_key_file}|g" ~/.oci/config
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.4.0 |
| <a name="requirement_config"></a> [config](#requirement\_config) | 0.2.8 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_config"></a> [config](#provider\_config) | 0.2.8 |

## Resources

| Name | Type |
|------|------|
| [config_ini.config_oci](https://registry.terraform.io/providers/alabuel/config/0.2.8/docs/data-sources/ini) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_config_oci_location"></a> [config\_oci\_location](#input\_config\_oci\_location) | The default location for your OCI setup file | `string` | `"~/.oci/config"` | no |
| <a name="input_config_section_name"></a> [config\_section\_name](#input\_config\_section\_name) | The config section name from which extract params | `string` | `"DEFAULT"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_common"></a> [common](#output\_common) | The OCI configuration parameters, without sensitive data |
| <a name="output_sensitive"></a> [sensitive](#output\_sensitive) | The OCI configuration parameters, without sensitive data |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
