Palo Alto Networks VM-Bootstrap Module for AWS
===========

A terraform module for deploying an S3 bucket and the dependencies required
to [bootstrap a VM-Series firewalls in AWS](https://docs.paloaltonetworks.com/vm-series/9-1/vm-series-deployment/bootstrap-the-vm-series-firewall/bootstrap-the-vm-series-firewall-in-aws.html).

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.20 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 2.7 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 2.7 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_s3_bucket.bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_object.authcode](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_object) | resource |
| [aws_s3_bucket_object.bootstrap_dirs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_object) | resource |
| [aws_s3_bucket_object.bootstrap_files](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_object) | resource |
| [aws_s3_bucket_object.bootstrap_xml](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_object) | resource |
| [aws_s3_bucket_object.init_cfg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_object) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_authcode"></a> [authcode](#input\_authcode) | Authcode to license the VM-series firewall | `string` | n/a | yes |
| <a name="input_bootstrap_directories"></a> [bootstrap\_directories](#input\_bootstrap\_directories) | The directories comprising the bootstrap package | `list(string)` | <pre>[<br>  "config/",<br>  "content/",<br>  "software/",<br>  "license/",<br>  "plugins/"<br>]</pre> | no |
| <a name="input_bootstrap_phash"></a> [bootstrap\_phash](#input\_bootstrap\_phash) | Hashed password to set in bootstrap.xml for initial user credentials | `string` | n/a | yes |
| <a name="input_bootstrap_user"></a> [bootstrap\_user](#input\_bootstrap\_user) | Username of the initial user in the bootstrap.xml | `string` | n/a | yes |
| <a name="input_bucket_prefix"></a> [bucket\_prefix](#input\_bucket\_prefix) | Bucket prefix name | `string` | n/a | yes |
| <a name="input_dgname"></a> [dgname](#input\_dgname) | The Panorama device group name | `string` | `""` | no |
| <a name="input_dhcp-accept-server-hostname"></a> [dhcp-accept-server-hostname](#input\_dhcp-accept-server-hostname) | Set dhcp-accept-server-hostname | `string` | `"yes"` | no |
| <a name="input_dns-primary"></a> [dns-primary](#input\_dns-primary) | IP of primary DNS server | `string` | `""` | no |
| <a name="input_dns-secondary"></a> [dns-secondary](#input\_dns-secondary) | IP of secondary DNS server | `string` | `""` | no |
| <a name="input_hostname"></a> [hostname](#input\_hostname) | The hostname of the VM-series instance | `string` | `""` | no |
| <a name="input_local_directory"></a> [local\_directory](#input\_local\_directory) | local folder to copy to s3 | `string` | `"bootstrap_files"` | no |
| <a name="input_op-command-modes"></a> [op-command-modes](#input\_op-command-modes) | Set jumbo-frame and/or mgmt-interface-swap | `string` | `""` | no |
| <a name="input_panorama-server"></a> [panorama-server](#input\_panorama-server) | IP of primary Panorama | `string` | `""` | no |
| <a name="input_panorama-server2"></a> [panorama-server2](#input\_panorama-server2) | IP of secondary ha Panorama | `string` | `""` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Map of additional tags to apply to all resources | `map(any)` | `{}` | no |
| <a name="input_tplname"></a> [tplname](#input\_tplname) | The Panorama template stack name | `string` | `""` | no |
| <a name="input_vm-auth-key"></a> [vm-auth-key](#input\_vm-auth-key) | Virtual machine authentication key | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_bucket_id"></a> [bucket\_id](#output\_bucket\_id) | ID of created bucket. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
