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
