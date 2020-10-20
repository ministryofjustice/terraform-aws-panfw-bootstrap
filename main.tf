
locals {
  directories = flatten([
    for k, v in var.bootstrap_environments : [
      for dir in toset(var.bootstrap_directories) : {
        bucket    = k
        directory = dir
      }
    ]
  ])

  files = flatten([
    for k, v in var.bootstrap_environments : [
      for file in fileset("${path.root}/${var.local_directory}/${k}", "**") : {
        bucket = k
        file   = file
      }
    ]
  ])
}

# ----------------------------------------------------------
# update init config in bootstrap bucket
# ----------------------------------------------------------
data "template_file" "initconfig" {
  for_each = var.bootstrap_environments
  template = file("${path.module}/bootstrap_templates/init-cfg.txt.tpl")

  vars = {
    vm_auth_key           = var.vm_auth_key
    pan_device_group_name = each.value.pan_device_group_name
    pan_template_name     = each.value.pan_template_name
    panorama1_ip          = var.panorama1_ip
    panorama2_ip          = var.panorama2_ip
    pan_dns_primary       = var.pan_dns_primary
    pan_dns_secondary     = var.pan_dns_secondary
  }
}

// we have to use sensitive_content in local_file to prevent stuff from appearing in the plan
resource "local_file" "initconfig-render-file" {
  for_each          = var.bootstrap_environments
  sensitive_content = data.template_file.initconfig[each.key].rendered
  filename          = "${path.root}/bootstrap_files/${each.key}/config/init-cfg.txt"
}

# ----------------------------------------------------------
# update bootstrap.xml config in bootstrap bucket
# ----------------------------------------------------------
data "template_file" "bootstrapxml" {
  template = file("${path.module}/bootstrap_templates/bootstrap.xml.tpl")

  vars = {
    bootstrap_phash = var.bootstrap_phash
  }
}

// we have to use sensitive_content in local_file to prevent stuff from appearing in the plan
resource "local_file" "bootstrap-render-file" {
  for_each          = var.bootstrap_environments
  sensitive_content = data.template_file.bootstrapxml.rendered
  filename          = "${path.root}/bootstrap_files/${each.key}/config/bootstrap.xml"
}

// we have to use sensitive_content in local_file to prevent stuff from appearing in the plan
resource "local_file" "authcodes-render-file" {
  for_each          = var.bootstrap_environments
  sensitive_content = var.pan_authcode
  filename          = "${path.root}/bootstrap_files/${each.key}/license/authcodes"
}


# resource "aws_s3_bucket" "bucket" {
#   for_each = var.bootstrap_environments
#   tags = var.tags
#   bucket = each.key
#   acl           = "private"
# }

resource "aws_s3_bucket" "bucket" {
  for_each      = var.bootstrap_environments
  bucket        = var.bucket_prefix == true ? null : lower(each.key)
  bucket_prefix = var.bucket_prefix == false ? null : lower(each.key)
  tags          = var.tags
  acl           = "private"
}


resource "aws_s3_bucket_object" "bootstrap_dirs" {
  for_each = { for dir in local.directories : "${dir.bucket}-${dir.directory}" => dir }
  tags     = var.tags
  bucket   = aws_s3_bucket.bucket[each.value.bucket].id
  key      = each.value.directory
  content  = "/dev/null"
}

resource "aws_s3_bucket_object" "bootstrap_files" {
  for_each = { for file in flatten([
    for k, v in var.bootstrap_environments : [
      for file in fileset("${path.root}/${var.local_directory}/${k}", "**") : {
        bucket = k
        file   = file
      }
    ]
  ]) : "${file.bucket}-${file.file}" => file }
  tags   = var.tags
  bucket = aws_s3_bucket.bucket[each.value.bucket].id
  key    = each.value.file
  source = "${path.root}/${var.local_directory}/${each.value.bucket}/${each.value.file}"
  etag   = filemd5("${path.root}/${var.local_directory}/${each.value.bucket}/${each.value.file}")

  depends_on = [local_file.bootstrap-render-file, local_file.authcodes-render-file, local_file.initconfig-render-file]
}
