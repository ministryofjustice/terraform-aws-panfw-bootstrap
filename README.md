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
| bucket\_prefix | Prefix of the bucket name | `string` | `"bootstrap-"` | no |
| local\_directory | local folder to copy to s3 | `string` | `"files"` | no |

## Outputs

| Name | Description |
|------|-------------|
| bucket\_id | ID of created bucket. |
