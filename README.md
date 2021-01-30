Palo Alto Networks VM-Bootstrap Module for AWS
===========

A terraform module for deploying an S3 bucket and the dependencies required
to [bootstrap a VM-Series firewalls in AWS](https://docs.paloaltonetworks.com/vm-series/9-1/vm-series-deployment/bootstrap-the-vm-series-firewall/bootstrap-the-vm-series-firewall-in-aws.html).

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | ~> 0.12.20 |
| aws | ~> 2.7 |

## Providers

| Name | Version |
|------|---------|
| aws | ~> 2.7 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| authcode | Authcode to license the VM-series firewall | `string` | n/a | yes |
| bootstrap\_directories | The directories comprising the bootstrap package | `list(string)` | <pre>[<br>  "config/",<br>  "content/",<br>  "software/",<br>  "license/",<br>  "plugins/"<br>]</pre> | no |
| bootstrap\_phash | Hashed password to set in bootstrap.xml for initial admin credentials | `string` | n/a | yes |
| bucket\_prefix | Bucket prefix name | `string` | n/a | yes |
| dgname | The Panorama device group name | `string` | `""` | no |
| dns-primary | IP of primary DNS server | `string` | `""` | no |
| dns-secondary | IP of secondary DNS server | `string` | `""` | no |
| hostname | The hostname of the VM-series instance | `string` | `""` | no |
| local\_directory | local folder to copy to s3 | `string` | `"bootstrap_files"` | no |
| op-command-modes | Set jumbo-frame and/or mgmt-interface-swap | `string` | `""` | no |
| panorama-server | IP of primary Panorama | `string` | `""` | no |
| panorama-server2 | IP of secondary ha Panorama | `string` | `""` | no |
| tags | Map of additional tags to apply to all resources | `map(any)` | `{}` | no |
| tplname | The Panorama template stack name | `string` | `""` | no |
| vm-auth-key | Virtual machine authentication key | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| bucket\_id | ID of created bucket. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
