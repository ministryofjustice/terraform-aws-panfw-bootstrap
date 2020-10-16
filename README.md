## AWS S3 PanFw Bootstrap module
### Overview
Simple take on the S3 Bootstrap bucket creation.

### Caveats
This module will build out a bootstrap bucket in AWS but will not create any files for bootstrapping the Pan Fws.

### Usage
```
provider "aws" {
  region = "us-east-1"
}

module "s3-bucket" {
  source        = "git::https://gitlab.com/public-tf-modules/terraform-aws-panfw-s3_bootstrap?ref=v0.1.0"
  bucket_prefix = "bootstrap-me-"
}
```

## Providers

| Name | Version |
|------|---------|
| aws | ~> 2.7 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| bootstrap\_directories | The directories comprising the bootstrap package | `list(string)` | <pre>[<br>  "config/",<br>  "content/",<br>  "software/",<br>  "license/",<br>  "plugins/"<br>]</pre> | no |
| bucket\_prefix | Enable bucket prefixes | `bool` | `false` | no |
| local\_directory | Local folder to copy to s3 buckets | `string` | `"files"` | no |
| tags | Tags to be associated with s3 buckets | `map(string)` | `{}` | no |
| pan\_authcode | Auth code to license VN-Series firewalls  | `string` | `null` | yes |
| vm\_auth\_key | VM auth key generated on Panorama  | `string` | `null` | yes |
| panorama1\_ip |  `panorama-server` parameter to be included in init-cfg.txt | `string` | `null` | yes |
| panorama2\_ip |  `panorama-server-2` parameter to be included in init-cfg.txt | `string` | `null` | yes |
| bootstrap\_phash | pash for the admin username | `string` | `null` | yes |
| bootstrap\_environments | A map of environments | `map` | `{}` | yes |


## Outputs

| Name | Description |
|------|-------------|
| bootstrap\_s3\_buckets | Map of S3 bucket names and arns |
| s3\_buckets\_arn | Map of S3 bucket arns |

