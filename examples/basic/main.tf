provider "aws" {
  region = var.region
}

module "s3-bucket" {
  source        = "../../"
  bucket_prefix = var.bucket_prefix
}
